//
//  networkHUD.swift
//  musicPlay-SWIFT
//
//  Created by apple on 16/2/15.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class networkHUD: NSObject {
     func showHUD(str str:String,frame:CGRect,view:UIView)->MBProgressHUD {
        let hud = MBProgressHUD(frame: frame)
        hud.mode = MBProgressHUDModeIndeterminate
        hud.labelText = str
        hud.show(true)
        view.addSubview(hud)
        return hud
    }
    func hidden(hud:MBProgressHUD) {
        hud.hide(true)
    }
    func noNetworkShowHUB(str str:String,isHidden:Bool,delay:Double,view:UIView){
        let hud = MBProgressHUD.showHUDAddedTo(view, animated: true)
        hud.mode = MBProgressHUDModeText
        hud.labelText = str
        hud.show(true)
        hud.hide(isHidden, afterDelay: delay)
    }
     func isnetwork()->Bool {
        var isnetwork:Bool = true
        let reach = Reachability(hostName: "www.baidu.com")
//        switch reach.currentReachabilityStatus(){
//        case NotReachable:
//            isnetwork = false
//        case ReachableViaWiFi:
//            isnetwork = true
//        case ReachableViaWWAN:
//            isnetwork = true
//        default: break
//        }
        if reach.currentReachabilityStatus() == NotReachable
        {
            isnetwork = false
        }else{
            isnetwork = true
        }
        return isnetwork
    }
}
