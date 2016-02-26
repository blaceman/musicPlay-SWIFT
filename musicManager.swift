//
//  musicManager.swift
//  musicPlay-SWIFT
//
//  Created by apple on 16/2/12.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

//全局变量单例写法
//private let musicmanager = musicManager()
class musicManager: NSObject {
    var modelArray = NSMutableArray()
    
//    单例最新的写法
    static let sharemanager = musicManager()
//    class var sharemanager:musicManager {
//        return musicmanager
//    }
    private override init() {
        
    }
    func resquestDatablock(frame frame:CGRect,view:UIView,returnArr:(NSMutableArray)->Void){
        let networkHud = networkHUD()
        let isnetwork = networkHud.isnetwork()
        if isnetwork{
            let arr = NSArray(contentsOfURL: NSURL(string: "http://project.lanou3g.com/teacher/UIAPI/MusicInfoList.plist")!)
           let hud = networkHud.showHUD(str: "正在加载网络", frame: frame, view: view)
            for index in 0...(arr?.count)! - 1{
                let model = musicInfoModel.modelWithDic(arr![index] as! NSDictionary)
                self.modelArray.addObject(model)
            }
            returnArr(modelArray)
            networkHud.hidden(hud)
        }else{
            networkHud.noNetworkShowHUB(str: "网络不好,请检查网络", isHidden: true, delay: 3, view: view)
        }
        
        
    }
    func returnMusicInfoModelCount()->NSInteger{
        return self.modelArray.count
    }
    func returnMusicInfomodel(index:NSInteger)->musicInfoModel{
        return self.modelArray[index] as! musicInfoModel
    }

}
