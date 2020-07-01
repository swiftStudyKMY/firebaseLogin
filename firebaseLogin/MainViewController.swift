//
//  MainViewController.swift
//  firebaseLogin
//
//  Created by 김민영 on 2020/07/01.
//  Copyright © 2020 MINYOUNGKIM. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class MainViewController:UIViewController{

    //deprecated
//    var remoteConfig : FirebaseRemoteConfig!
    var remoteConfig : RemoteConfig!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "MainViewController"
        
        //remoteConfig 초기 설정.
        remoteConfig = RemoteConfig.remoteConfig()
        remoteConfig.setDefaults(fromPlist: "firebaseSwiftRemoteConfigDefault")
        
//        DispatchQueue.main.async {
//            self.dpMSG()
//        }
        
        self.fetchConfig()
        
    }
    
    func fetchConfig(){

        let remoteConfigSettings = RemoteConfigSettings()
        
        remoteConfigSettings.minimumFetchInterval = 0
        
        
        //deprecated
//        let remoteConfigSettings = RemoteConfigSettings(developerModeEnabled: true)
        
//        remoteConfig.configSettings = remoteConfigSettings
        
        
        remoteConfig.fetch(withExpirationDuration: 0) { (state, error) in
            if state == .success {
                //deprecated
//                self.remoteConfig.activateFetched()
                
                self.remoteConfig.activate(completion: nil)
            }
            self.dpMSG()
        }
        
    }

    
    func dpMSG(){
        
        let msg = remoteConfig["welcome_msg"].stringValue
        let caps = remoteConfig["welcome_msg_caps"].boolValue
        let bgColor = remoteConfig["bgColor"].numberValue
        
        // 서버에서 세팅하는 값 확인용
        print("msg = \(msg) \n caps = \(caps)\n bgColor = \(bgColor)")
        
        if (bgColor == 1) {
            self.view.backgroundColor = UIColor.black
        }
        
        if caps {
            
            let alert = UIAlertController(title: "공지사항", message: msg, preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "확인", style: .default, handler: {(flag) in
                exit(0)
            }))
            self.present(alert, animated: true, completion: nil)
            
        }
        
        
    }
    
}
