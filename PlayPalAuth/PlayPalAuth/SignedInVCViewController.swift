//
//  SignedInVCViewController.swift
//  PlayPalAuth
//
//  Created by vijay_tadimeti on 1/21/19.
//  Copyright © 2019 vijay_tadimeti. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class SignedInVCViewController: UIViewController {
    
    
    //outlets
    
    @IBOutlet weak var emailOu: UILabel!
    
    //variables
    
    //constants
    let userDefault = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let email = Auth.auth().currentUser?.email else{ return }
        emailOu.text = email + ", Welcome to PlayPal!"
    }
        // Do any additional setup after loading the view.
    
    

  //actions
    @IBAction func signOutPressed(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            try GIDSignIn.sharedInstance()?.signOut()
            userDefault.removeObject(forKey: "usersignedin")
            userDefault.synchronize()
            self.dismiss(animated: true, completion: nil)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    
}
