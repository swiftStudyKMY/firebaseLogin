//
//  DynamicLinkVC.swift
//  firebaseLogin
//
//  Created by 김민영 on 2020/07/02.
//  Copyright © 2020 MINYOUNGKIM. All rights reserved.
//

import Foundation
import UIKit

import Firebase

class DynamicLinkVC:UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //domainURL 찾지 못해서 아직 미완성
        let compoents = DynamicLinkComponents(link: URL(string: "https://naver.com")!, domainURIPrefix: "")
        
        let iOSParams = DynamicLinkIOSParameters(bundleID: "com.kmy.firebaseLogin")
        
        //https://apps.apple.com/kr/app/apple-store/id375380948
        iOSParams.appStoreID = "375380948"
        
        compoents?.iOSParameters = iOSParams
        print(">>>\(compoents?.url?.absoluteString)")
        
        let option = DynamicLinkComponentsOptions()
        option.pathLength = .short
        
        compoents?.options = option
        
        compoents?.shorten(completion: { (url, warning, error) in
            print(">>>>>>\(url)")
            
        })
    }
    
    
}
