//
//  LoginViewController.swift
//  lostandfound
//
//  Created by Timothée Arnauld on 16/05/2017.
//  Copyright © 2017 Lost And Found. All rights reserved.
//

import UIKit
import FacebookLogin

class LoginViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loginButton = LoginButton(readPermissions:[ .publicProfile, .email, .userFriends ])
        loginButton.center = view.center
            
        view.addSubview(loginButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
