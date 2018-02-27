//
//  LoginViewController.swift
//  ParseChatApp
//
//  Created by Personal Projects on 2/21/18.
//  Copyright © 2018 Personal Projects. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func usernameDidBeginEditing(_ sender: Any) {
        if(usernameTextField.text == "username"){
            usernameTextField.text = ""
        }
        usernameTextField.textColor = UIColor.black
    }
    
    
    
    @IBAction func passwordDidBeginEditing(_ sender: Any) {
        if(passwordTextField.text == "password"){
            passwordTextField.text = ""
        }
        passwordTextField.textColor = UIColor.black
        
    }
    
    
    
    
    @IBAction func signUpButton(_ sender: Any) {
        let newUser = PFUser()
            
        // set user properties
        newUser.username = usernameTextField.text
        newUser.password = passwordTextField.text
            
        // call sign up function on the object
        newUser.signUpInBackground { (success: Bool, error: Error?) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("User Registered successfully")
                // manually segue to logged in view
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
        }
        if((usernameTextField.text?.isEmpty)! || (passwordTextField.text?.isEmpty)!){
            let alertController = UIAlertController(title: "No Field", message: "Need password or username", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                // handle response here.
            }
            // add the OK action to the alert controller
            alertController.addAction(OKAction)
            present(alertController, animated: true) {
                // optional code for what happens after the alert controller has finished presenting
            }
        }
        
    }
    
  
    @IBAction func loginButton(_ sender: Any) {
        
        let username = usernameTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (user: PFUser?, error: Error?) in
            if let error = error {
                print("User log in failed: \(error.localizedDescription)")
            } else {
                print("User logged in successfully")
                // display view controller that needs to shown after successful login
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
        }
        
        if((usernameTextField.text?.isEmpty)! || (passwordTextField.text?.isEmpty)!){
                let alertController = UIAlertController(title: "No Field", message: "Need password or username", preferredStyle: .alert)
                let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                    // handle response here.
                }
                // add the OK action to the alert controller
                alertController.addAction(OKAction)
                present(alertController, animated: true) {
                // optional code for what happens after the alert controller has finished presenting
            }
            
            
        }
       

        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
