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
        // Do any additional setup after loading the view, typically from a nib.
        
        setupTwitterLogInButton()
    }
    
    func setupTwitterLogInButton() {
        let twitterLogInButton = TWTRLogInButton { (session, error) in
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
        
        twitterLogInButton.center = self.view.center
        view.addSubview(twitterLogInButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

