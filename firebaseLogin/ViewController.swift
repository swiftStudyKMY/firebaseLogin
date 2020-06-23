//
//  ViewController.swift
//  firebaseLogin
//
//  Created by 김민영 on 6/22/20.
//  Copyright © 2020 MINYOUNGKIM. All rights reserved.
//

import UIKit

import Firebase
import GoogleSignIn
import FBSDKLoginKit


class ViewController: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var passwd: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        GIDSignIn.sharedInstance()?.presentingViewController = self
        
        let loginButton = FBLoginButton()
        
        loginButton.center = view.center
        
        view.addSubview(loginButton)

        if let token = AccessToken.current, !token.isExpired {
            // User is logged in, do work such as go to next view controller.
        }
            
        
        loginButton.permissions = ["public_profile", "email"]
        
    }
    
    func alert(_ msg: String, onClick: (()-> Void)? = nil){
        let controller = UIAlertController(title: nil, message: msg, preferredStyle: .alert)
        controller.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { (_) in
            onClick?()
        }))
        DispatchQueue.main.async {
            self.present(controller,animated: false)
        }
    }

    // email을 이용한 Firebase auth
    @IBAction func signInEmail(_ sender: Any) {
        print("signInEmail clicked")
        
        print("email : \(email.text)\n password : \(passwd.text)")
        
        Auth.auth().createUser(withEmail: email.text!, password: passwd.text!) { authResult, error in
            
             guard let user = authResult?.user else { return }
            
              if error == nil {
                self.alert("회원가입 완료")
                
                print(user) // FIRUser
                
              }else{
                self.alert("회원가입 실패")
              }
        }
    }
    
    
    // Google을 이용한 Firebase auth
    @IBAction func signIn(_ sender: Any) {
        GIDSignIn.sharedInstance().signIn()
    }
    
    
    


}




 // Add this to the body class ViewController: UIViewController { override func viewDidLoad() { super.viewDidLoad() let loginButton = FBLoginButton() loginButton.center = view.center view.addSubview(loginButton) } }

