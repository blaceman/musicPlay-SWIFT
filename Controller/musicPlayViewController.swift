//
//  musicPlayViewController.swift
//  musicPlay-SWIFT
//
//  Created by apple on 16/2/12.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class musicPlayViewController: UIViewController,musicAudioManagerDelegate {
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
    var timer:NSTimer?
    
    //pageAction
    @IBAction func pageAction(sender: UIPageControl) {
        self.scrollView.contentOffset = CGPointMake(CGFloat(self.page.currentPage) * self.view.bounds.size.width, 0);
    }
    
    //滑动音乐播放的进条
    @IBAction func musicPlayProgressAction(sender: UISlider) {
        let musicaudiomanager = musicAudioManager.shareManager
        musicaudiomanager.seekToTimePlay(Float64(sender.value))
    }
    
    //声音大小
    @IBAction func musicVolumeAction(sender: UISlider) {
        musicAudioManager.shareManager.setVolumn(sender.value)
    }
    
    //循环播放
    @IBAction func loopAction(sender: UIButton) {
        musicAudioManager.shareManager
    }
    //随机播放
    @IBAction func shuffeAction(sender: UIButton) {
    }
    //单曲循坏
    @IBAction func singleAction(sender: UIButton) {
    }
    //
    @IBAction func musicAction(sender: UIButton) {
    }
    //右上角返回
    @IBAction func returnAction(sender: UIButton) {
       self.dismissViewControllerAnimated(true, completion: nil)
    }
    //上一首
    @IBAction func rewindAction(sender: UIButton) {
    }
    //
    @IBAction func PlayOrPauseAction(sender: UIButton) {
        if musicAudioManager.shareManager.isplay == true{
            musicAudioManager.shareManager.pause()
            sender.setImage(UIImage(named:"play"), forState: UIControlState.Normal)
            sender.setImage(UIImage(named:"play_h"), forState: UIControlState.Highlighted)
        }else{
            musicAudioManager.shareManager.play()
            sender.setImage(UIImage(named:"pause"), forState: UIControlState.Normal)
            sender.setImage(UIImage(named:"pause_h"), forState: UIControlState.Highlighted)
            if timer == nil{
                return;
            }else{
                timer = NSTimer.scheduledTimerWithTimeInterval(0.05, target: self, selector: "", userInfo: nil, repeats: true)
            }
            
        }
    }
    //
    @IBAction func forwardAction(sender: UIButton) {
    }
    private func rotateAction(){
      self.rotateImageView.transform = CGAffineTransformRotate(self.rotateImageView.transform, CGFloat(M_PI))
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
       musicAudioManager.shareManager.delegate = self
        self.labelSongTitle.text = "我是逗b"
        self.rotateImageView.addObserver(self, forKeyPath: "image", options: .New, context: UnsafeMutablePointer<Void>.alloc(3))
        self.labelSongTitle.addObserver(self, forKeyPath: "text", options: NSKeyValueObservingOptions.New, context: UnsafeMutablePointer<Void>())
        self.reloadViewData()
      
    }
    private func reloadViewData(){
        self.scrollView.pagingEnabled = true
        self.scrollView.showsHorizontalScrollIndicator = false
        self.timer?.invalidate()
        self.timer = nil
        let model = musicManager.sharemanager.returnMusicInfomodel(1)
//        self.backImageView.sd_setImageWithURL(NSURL(string: model.blurPicUrl))
        self.rotateImageView.image = UIImage(named: "1.png")
//        self.labelSongTitle.text = model.name
    }
    func audioPlayWithProgress(progress: Float) {
        
    }
    func audioPlayEndtime() {
        
    }
    func timerAction() {
        
    }

}
