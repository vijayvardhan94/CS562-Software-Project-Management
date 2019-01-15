//
//  ViewController.swift
//  PlayPalAuth
//
//  Created by vijay_tadimeti on 1/15/19.
//  Copyright © 2019 vijay_tadimeti. All rights reserved.
//

import UIKit
import FirebaseUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func loginTapped(_ sender: UIButton) {
        
        //get the default auth ui object
        let authUI = FUIAuth.defaultAuthUI()
        guard  authUI != nil else {
            //log the error
            return
            
        }
        
        //set ourselves as the delegate
        authUI?.delegate = self
        
        //get a reference to the auth ui view controller
        
        //show it
    }
    
}

