//
//  musicListCell.swift
//  musicPlay-SWIFT
//
//  Created by apple on 16/2/12.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit
protocol musicListCellDelegate{
    
    func passimage(image:UIImage)
}

class musicListCell: UITableViewCell {
    
   var delegate:musicListCellDelegate?
    @IBOutlet weak var songPic: UIImageView!{
        willSet{
            
        }
    }
    @IBOutlet weak var songName: UILabel!
    @IBOutlet weak var singerName: UILabel!


//    required init?(coder aDecoder: NSCoder) {
//        
//        fatalError("init(coder:) has not been implemented")
//    }

//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    

    

    func cellWithModel(model model:musicInfoModel){
        songPic.sd_setImageWithURL(NSURL(string: model.picUrl))
        songName.text = model.name
        singerName.text = model.singer
        singerName.highlightedTextColor = UIColor.redColor()
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected == true{
           self.songName.textColor = UIColor.yellowColor()
            if self.songPic.image == nil{
                self.songPic.addObserver(self, forKeyPath: "image", options: NSKeyValueObservingOptions.New, context: nil)
            }else{
                self.delegate?.passimage(songPic.image!)
            }
            
        }
        else{
            self.songName.textColor = UIColor.blackColor()
        }
    }
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        self.delegate?.passimage(songPic.image!)
       self.songPic.removeObserver(self, forKeyPath: "image")
    }

}
