//
//  lyricManager.swift
//  musicPlay-SWIFT
//
//  Created by apple on 16/2/12.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class lyricManager: NSObject {
    var modelmarr:Array<lyricModel>?
    var currenlyric:Int?
    static let sharemanager = lyricManager()
    func setLyricDataArrayWithLyricStr(lyricstr:String?){
        self.modelmarr?.removeAll()
        if lyricstr != nil{
            let arr = lyricstr?.componentsSeparatedByString("\n")
            if arr?.count <= 1 {
                let model = lyricModel()
                model.lyricstr = "没歌"
                model.currentime = 1.00
                self.modelmarr?.append(model)
                self.currenlyric = -1
            }
            for index in 0...arr!.count - 1{
                let time1 = arr![index]
                var lyricstrarr:NSArray = NSArray()
                if time1.containsString("]"){
                    lyricstrarr = time1.componentsSeparatedByString("]")
                }else{
                    lyricstrarr = ["00:01.000",time1]
                }
                let timearr:NSArray? = lyricstrarr[0].componentsSeparatedByString(":")
                let timer:NSString = timearr![0]as!NSString
               timer.substringFromIndex(1)
                let min = timer.intValue
                let sec = timearr![1].floatValue
                let model = lyricModel()
                model.lyricstr = lyricstrarr[1] as? String
                model.currentime = Float(min * 60) + sec
            }
            self.currenlyric = -1
        }else{
            let model = lyricModel()
            model.lyricstr = "没歌词"
            model.currentime = 01.00
            self.modelmarr?.append(model)
            self.currenlyric = -1
        }
        
    }
    func lyricRunprogress(progress:Float)->Int{
        let array = lyricManager.sharemanager.modelmarr
        for model:lyricModel in array!{
            if Int(progress) == Int(model.currentime!){
                self.currenlyric = array?.indexOf(model)
                return self.currenlyric!
            }
        }
        return self.currenlyric!
    }

}
