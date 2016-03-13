//
//  LoginViewController.swift
//  MyCareTeam
//
//  Created by Govin Vatsan on 3/13/16.
//  Copyright © 2016 Govin Vatsan. All rights reserved.
//

import Parse
import UIKit


class LoginViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBAction func login(sender: AnyObject) {

        let login = username.text ?? ""
        let pass = password.text ?? ""
        
        PFUser.logInWithUsernameInBackground(login, password: pass) { (user: PFUser?, error: NSError?) -> Void in
            if let error = error {
                print("User login failed.")
                print(error.localizedDescription)
            } else {
                print("User logged in successfully")
                self.performSegueWithIdentifier("loginSegue", sender: self)

                // display view controller that needs to shown after successful login
            }
        }

    }
    
    @IBAction func signUp(sender: AnyObject) {
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
