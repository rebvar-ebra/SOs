//
//  LoginViewController.swift
//  EmergencyApp
//
//  Created by Rebwar Ebrahimi on 6/23/22.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var errorLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpElememts()
    }
    
    func setUpElememts(){
        //hide the lable
        
        errorLable.alpha=0
        
        //style
        
        Utilities.styleTextField(emailTextField)
        
        Utilities.styleTextField(passwordTextField)
        
        Utilities.styleFilledButton(loginButton)
        
        
    }
    
    //check the fields and validate that the data is correct.otherwise return Error
    func validateFields() -> String? {
        //check all fields are filled in
        
        if 
            emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
            return "Please fill in all fields"
        }
        
        //check password secure
        
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if Utilities.isPasswordValid(cleanedPassword) == false{
            // password isn't secure enogh
            
            return "Please make sure your password is at least 8 characters ,contain speacil characters and numbers"
        }
        
        return nil
    }

    
    @IBAction func loginTapped(_ sender: Any) {
        
        //validation
        
        let error = validateFields()
        if error != nil {
            showError(error!)
            
        }
        else{
            //create cleaned version of data
            
           
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            //signing user
            Auth.auth().signIn(withEmail: email, password: password) { (result, err) in
               if err != nil{
                
                self.errorLable.text = err!.localizedDescription
                self.errorLable.alpha = 1
                //self.showError("Error sginin User")
                }
               else {
                
                self.transitionToHome()
                
                
               }
            }
            
        }

    }
    func showError(_ message:String){
            errorLable.text = message
            errorLable.alpha = 1
        }
        
    func transitionToHome() {
       let homeTabController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeTabController) as? HomeTabViewController
        
        view.window?.rootViewController = homeTabController
        view.window?.makeKeyAndVisible()
    }


    
}
