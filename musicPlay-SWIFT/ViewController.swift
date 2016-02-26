//
//  ViewController.swift
//  musicPlay-SWIFT
//
//  Created by apple on 16/2/8.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,musicListCellDelegate {
    @IBOutlet var tableView: UITableView!
    var modelArr = NSMutableArray()
    var imageView:UIImageView?
    var currenIndexRow:Int?
    var musicP:UIViewController?
    
    private func loadbackimageView(){
        self.imageView = UIImageView(frame: self.view.bounds)
        if self.imageView?.image == nil{
            self.imageView?.image = UIImage(named: "1")
        }
        let visual = UIVisualEffectView(frame: self.view.bounds)
        visual.effect = UIBlurEffect(style:.Dark)
        self.imageView?.addSubview(visual)
//        self.view.addSubview(self.imageView!)
        self.tableView.backgroundView = self.imageView
        self.view.backgroundColor = UIColor.whiteColor()
    }
    
    @IBAction private func BtnAction(sender: UIButton) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "音乐列表"
     self.tableView.backgroundColor = UIColor.whiteColor()
        self.edgesForExtendedLayout = .None
        self.navigationController?.navigationBar.barStyle = .BlackTranslucent
        self.loadbackimageView()
        self.tableView.tableFooterView = UIView()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        let musicmanager = musicManager.sharemanager
        musicmanager.resquestDatablock(frame: self.view.bounds, view: self.tableView){
            self.modelArr = $0
        }
    }
  
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return modelArr.count
        return musicManager.sharemanager.returnMusicInfoModelCount()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:musicListCell = (self.tableView.dequeueReusableCellWithIdentifier("reuse", forIndexPath: indexPath) as! musicListCell)
        let model = musicManager.sharemanager
        cell.cellWithModel(model: model.returnMusicInfomodel(indexPath.row))
        cell.delegate = self
      cell.selectedBackgroundView = UIView(frame: cell.frame)
        cell.selectedBackgroundView?.backgroundColor = UIColor.clearColor()
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if self.currenIndexRow != indexPath.row{
            self.currenIndexRow = indexPath.row
        }else{
            
        }
        
    }
    func passimage(image: UIImage) {
       print("haha")
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "Model1"{
         self.musicP = segue.destinationViewController
        }else if segue.identifier == "Model2"{
            self.musicP = segue.destinationViewController
        }
    }

}

