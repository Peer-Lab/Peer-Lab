//
//  ViewController.swift
//  Peer Lab
//
//  Created by Slava Nehria on 12.06.2017.
//  Copyright © 2017 Slava Nehria. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import TwitterKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func facebookButtonDidTapped(_ sender: UIButton) {
        // Facebook Auth
    }
    
    @IBAction func twitterButtonDidTapped(_ sender: UIButton) {
        Twitter.sharedInstance().logIn { (session, error) in
            if session != nil {
                let authToken = session?.authToken
                let authTokenSecret = session?.authTokenSecret
                
                let credential = TwitterAuthProvider.credential(withToken: authToken!, secret: authTokenSecret!)
                Auth.auth().signIn(with: credential, completion: { (user, error) in
                    if error != nil {
                        return
                    }
                })
            }
        }
    }
    
    @IBAction func gPlusButtonDidTapped(_ sender: UIButton) {
        // Google Plush Auth
    }
    
}

