//
//  musicAudioManager.swift
//  musicPlay-SWIFT
//
//  Created by apple on 16/2/16.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit
protocol musicAudioManagerDelegate{
    func audioPlayWithProgress(progress:Float)
    func timerAction()
    func audioPlayEndtime()
}
class musicAudioManager: NSObject {
    static let shareManager = musicAudioManager()
    var delegate:musicAudioManagerDelegate?
    let avplay = AVPlayer()
    var timer:NSTimer?
    var isplay:Bool?

    override init() {
         super.init()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "audioEndHandle", name: AVPlayerItemDidPlayToEndTimeNotification, object: nil)
    }
    
   @objc private func audioEndHandle(){
        self.timer!.invalidate()
        self.timer = nil
        self.delegate?.audioPlayEndtime()
    }
    func setVolumn(volumn:Float){
        self.avplay.volume = volumn
    }
    func setMusicAudioMUsicUrl(musicUrl:String){
        if self.avplay.currentItem != nil {
            self.avplay.currentItem?.removeObserver(self, forKeyPath: "status")
        }
        let item = AVPlayerItem(URL: NSURL(string: musicUrl)!)
        item.addObserver(self, forKeyPath: "status", options: .New, context: nil)
        self.avplay .replaceCurrentItemWithPlayerItem(item)
    }
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        let new:AVPlayerItemStatus = change!["new"]as!AVPlayerItemStatus
        switch new{
        case .Failed:
            print("AVPlayItemStatusFailed")
        case .ReadyToPlay:
            print("AVPlayItemStatusReadyToPlay")
            self.play()
            self.delegate?.timerAction()
        case .Unknown:
            print("AVPlayItemStatusUnknow")
        }
    }
    func play(){
        self.avplay.play()
        self.isplay = true
        if self.timer?.valid == true  {
            return;
        }
        self.timer = NSTimer(timeInterval: 1, target: self, selector: "TimerHandle", userInfo: nil, repeats: true)
    }
    func pause(){
        self.avplay.pause()
        self.isplay = false
        self.timer?.invalidate()
        self.timer = nil
    }
    @objc private func TimerHandle(){
        let seconds:Float = Float(self.avplay.currentTime().value) / Float(self.avplay.currentTime().timescale)
        self.delegate?.audioPlayWithProgress(seconds)
    }
    func isPlayingCurrenAUdioWIthUrl(url:String){
        
    }
    func seekToTimePlay(time:Float64){
        self.avplay .pause()
        self.avplay.seekToTime(CMTimeMakeWithSeconds(time, self.avplay.currentTime().timescale))
        self.avplay.play()
    }

}
