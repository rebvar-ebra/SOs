//
//  CallViewController.swift
//  EmergencyApp
//
//  Created by Rebwar Ebrahimi on 6/24/22.
//

import UIKit
import Firebase

class CallViewController: UIViewController {

    
    var docRef: DatabaseReference!
    
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    
    @IBOutlet weak var messageTextField: UITextField!
    
    
    @IBOutlet weak var saveButton: UIButton!
    
    
    @IBOutlet weak var errorLable: UILabel!
    //var docRef: DatabaseReference!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElememts()
    }
    
    func setUpElememts(){
        //hide the lable
        
        errorLable.alpha=0
        
        //style
        
        Utilities.styleTextField(phoneNumberTextField)
        
        Utilities.styleTextField(messageTextField)
        
        Utilities.styleFilledButton(saveButton)
        
        
    }
    
    
    @IBAction func saveTapped(_ sender: Any) {
        
        /* let dataToSave :[String : Any]=["firstname":firstName,"lastname":lastName,"address":address,"birthplace":birthPlace,"bloodtype":bloodType,"medicalID":medicalId,"medications":medications,"phonenumber":phoneNumber,"sickness":sickness,"message":message]
        
        let db = Firestore.firestore()
        
        db.collection("users").getDocuments { (querySnapshot, err) in
            if err != nil{
             
             self.errorLable.text = err!.localizedDescription
             self.errorLable.alpha = 1
             //self.showError("Error sginin User")
            }else{
                
                for document in querySnapshot!.documents{
                    
                    
                }
                
            }
        }*/
        
    }
    
}
