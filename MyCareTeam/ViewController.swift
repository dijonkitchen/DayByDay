//
//  ViewController.swift
//  MyCareTeam
//
//  Created by Govin Vatsan on 3/12/16.
//  Copyright © 2016 Govin Vatsan. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    
    @IBAction func login(sender: AnyObject) {
        // initialize a user object
        let newUser = PFUser()
        
        // set user properties
        newUser.username = username.text
        newUser.password = password.text
        
        // call sign up function on the object
        newUser.signUpInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("User Registered successfully")
                // manually segue to logged in view
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
}

