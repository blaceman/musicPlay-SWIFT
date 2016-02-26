//
//  musicPlayViewController.swift
//  musicPlay-SWIFT
//
//  Created by apple on 16/2/12.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class musicPlayViewController: UIViewController {
    @IBOutlet weak var rotateImageView: UIImageView!
    @IBOutlet weak var page: UIPageControl!
    @IBOutlet weak var MusicPlayProgressSlider: UISlider!
    @IBOutlet weak var labelCurrentimer: UILabel!
    @IBOutlet weak var labelAlltime: UILabel!
    @IBOutlet weak var labelSongTitle: UILabel!
    @IBOutlet weak var labelAlbum: UILabel!
    @IBOutlet weak var buttonPlayOrPause: UIButton!
    @IBOutlet weak var buttonLoop: UIButton!
    @IBOutlet weak var buttonShuffle: UIButton!
    @IBOutlet weak var buttonSingle: UIButton!
    @IBOutlet weak var buttonMusic: UIButton!
    @IBOutlet weak var backImageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBAction func pageAction(sender: UIPageControl) {
        self.scrollView.contentOffset = CGPointMake(CGFloat(self.page.currentPage) * self.view.bounds.size.width, 0);
    }
    @IBAction func musicPlayProgressAction(sender: UISlider) {
    }
    
    @IBAction func musicVolumeAction(sender: UISlider) {
    }
    
    @IBAction func loopAction(sender: UIButton) {
    }
    
    @IBAction func shuffeAction(sender: UIButton) {
    }
    
    @IBAction func singleAction(sender: UIButton) {
    }
    
    @IBAction func musicAction(sender: UIButton) {
    }
    @IBAction func returnAction(sender: UIButton) {
       self.dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func rewindAction(sender: UIButton) {
    }
    @IBAction func PlayOrPauseAction(sender: UIButton) {
    }
    @IBAction func forwardAction(sender: UIButton) {
    }
 
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

   
    }

}
