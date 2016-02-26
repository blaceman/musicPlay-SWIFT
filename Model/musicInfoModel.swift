//
//  musicInfoModel.swift
//  musicPlay-SWIFT
//
//  Created by apple on 16/2/12.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class musicInfoModel: NSObject {
    var mp3Url = String()
    var identify = NSInteger()
    var name = String()
    var picUrl = String()
    var blurPicUrl = String()
    var album = String()
    var singer = String()
    var duration = NSInteger()
    var artists_name = String()
    var lyric = String()
    class func modelWithDic(dic:NSDictionary)-> musicInfoModel{
        let model = musicInfoModel()
        model.mp3Url = (dic.objectForKey("mp3Url")as? String)!
        model.identify = (dic["id"]as? NSInteger)!
        model.name = (dic["name"]as? String)!
        model.picUrl = (dic["picUrl"]as? String)!
        model.blurPicUrl = (dic["blurPicUrl"]as? String)!
        model.album = (dic["album"]as? String)!
        model.singer = (dic["singer"]as? String)!
        model.duration = (dic["duration"]as? NSInteger)!
        model.artists_name = (dic[
            "artists_name"]as? String)!
        model.lyric = (dic["lyric"]as? String)!
        return model
    }
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        print("miss")
    }
}
