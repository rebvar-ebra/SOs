//
//  SignUpViewController.swift
//  EmergencyApp
//
//  Created by Rebwar Ebrahimi on 6/23/22.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore
import FirebaseDatabase

class SignUpViewController: UIViewController {
    

    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBOutlet weak var medicalIDTextField: UITextField!
    
    @IBOutlet weak var birthPlaceTextField: UITextField!
    
    @IBOutlet weak var addressTextField: UITextField!
    
    @IBOutlet weak var sicknessTextField: UITextField!
    
    @IBOutlet weak var medicationTextField: UITextField!
    
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    @IBOutlet weak var messageTextField: UITextField!
    
    @IBOutlet weak var bloodTypeTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    
    @IBOutlet weak var errorLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

            // Do any additional setup after loading the view.
        setUpElements()
    }
    
    func setUpElements() {
        // hide error lable
        errorLable.alpha=0
        
        //style Elements
        Utilities.styleTextField(firstNameTextField)
        Utilities.styleTextField(lastNameTextField)
        Utilities.styleTextField(medicalIDTextField)
        Utilities.styleTextField(birthPlaceTextField)
        Utilities.styleTextField(bloodTypeTextField)
        Utilities.styleTextField(addressTextField)
        Utilities.styleTextField(sicknessTextField)
        Utilities.styleTextField(lastNameTextField)
        Utilities.styleTextField(medicationTextField)
        Utilities.styleTextField(phoneNumberTextField)
        Utilities.styleTextField(messageTextField)
        Utilities.styleTextField(passwordTextField)
        
        Utilities.styleFilledButton(signUpButton)
        
    }
    


    //check the fields and validate that the data is correct.otherwise return Error
    func validateFields() -> String? {
        //check all fields are filled in
        
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            medicalIDTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            birthPlaceTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            bloodTypeTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            addressTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            sicknessTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            medicationTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            phoneNumberTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            messageTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
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

    @IBAction func signUpTapped(_ sender: Any) {
        
        //validation
        
        let error = validateFields()
        if error != nil {
            showError(error!)
            
        }
        else{
            //create cleaned version of data
            
            let firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let medicalId = medicalIDTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let birthPlace = birthPlaceTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let bloodType = bloodTypeTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let address = addressTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let sickness = sicknessTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let medications = medicationTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let phoneNumber = phoneNumberTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let message = messageTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            //create user
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
               if err != nil{
                
                self.showError("Error creating User")
                }
               else {
                //user was created successfully,now store the firstname and last name
                
                
            
                let db = Firestore.firestore()
                
                    
                
                db.collection("users").addDocument(data: ["firstname":firstName,"lastname":lastName,"address":address,"birthplace":birthPlace,"bloodtype":bloodType,"medicalID":medicalId,"medications":medications,"phonenumber":phoneNumber,"sickness":sickness,"message":message,"uid" :result!.user.uid]) { (error) in
                    if error != nil {
                        //show error
                        self.showError("Error saving user data")
                    }
                }
                    
                //transation to the Home screen
                
                self.transitionToHome()
                
                
               }
                
            }
            
        }

        
        
    }
    func showError(_ message:String){
        errorLable.text = message
        errorLable.alpha = 1
    }
    
    //func transitionToHome() {
      // let homeViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
        
        //view.window?.rootViewController = homeViewController
        //view.window?.makeKeyAndVisible()
    //}
    func transitionToHome() {
       let homeTabController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeTabController) as? HomeTabViewController
        
        view.window?.rootViewController = homeTabController
        view.window?.makeKeyAndVisible()
    }
    
}
