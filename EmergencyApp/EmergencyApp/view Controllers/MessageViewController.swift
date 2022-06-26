//
//  MessageViewController.swift
//  EmergencyApp
//
//  Created by Rebwar Ebrahimi on 6/24/22.
//

import UIKit
import MessageUI
import CoreData
import AudioToolbox


class MessageViewController: UIViewController , MFMessageComposeViewControllerDelegate{
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        controller.dismiss(animated: true, completion: nil)
    }


    @IBOutlet weak var displaylbl: UILabel!
    @IBOutlet weak var sendMessageBtn: UIButton!
    //var counter = 0
    //var timer :Timer?
    //let defaults = UserDefaults.standard
    //var person:[NSManagedObject] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpElements()
      /* displaylbl.text = "Push the Button"
        sendMessageBtn.addTarget(self, action: #selector(self.messageButtonClicked), for: .touchUpInside)
        person = getContactsFromStore()*/

        
    }
   /* @objc private func messageButtonClicked() {
        
        if(defaults.bool(forKey: "vibrateOnMessage")){
            vibrate()
        }
        UIView.animate(withDuration: 1.0,
                       delay: 0,
                       options: [.autoreverse],
                       animations: {
                        UIView.setAnimationRepeatCount(5)
                        
                        self.sendMessageBtn.transform = CGAffineTransform(scaleX: 0.45, y: 0.45)
                        self.sendMessageBtn.backgroundColor = UIColor(red: 249.0 / 255.0, green: 105.0 / 255.0, blue: 14.0 / 255.0, alpha: 1.0)
        },
                       completion: { _ in
                        self.sendMessageBtn.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                        self.sendMessageBtn.backgroundColor = UIColor(red: 211.0 / 255.0, green: 84.0 / 255.0, blue: 0.0 / 255.0, alpha: 1.0)
        })
        sendMessage()
        
    }
    func sendMessage(){
        let currentLocation = LocationHelper.sharedInstance.currentLocation
        let messageVC = MFMessageComposeViewController()
        messageVC.body = "I need help. Here are my current coordinates: \(String(describing: currentLocation!.coordinate.latitude)) / \(String(describing: currentLocation!.coordinate.longitude))"
        messageVC.recipients = person.map({(contact: NSManagedObject ) -> String in
            let cnt = contact as! EmergencyContact
            print("\(cnt.phonenumber!)")
            return cnt.phonenumber!
        })
        messageVC.messageComposeDelegate = self
        present(messageVC, animated: true, completion: nil)
    }
    //Vibration
    func vibrate() {
        counter = 0
        timer = Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(self.vibratePhone), userInfo: nil, repeats: true)
    }
    
    //Custom Pattern for vibration
    @objc private func vibratePhone() {
        counter+=1
        switch counter {
        case 1,3,5:
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
        default:
            timer?.invalidate()
        }
    }
    
    
    
    func getContactsFromStore() -> [NSManagedObject] {
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return []
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        // Initialize Fetch Request
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>()
        // Create Entity Description
        let entityDescription = NSEntityDescription.entity(forEntityName: "EmergencyContact", in: managedContext)
        // Configure Fetch Request
        fetchRequest.entity = entityDescription
        // Load from storage
        var result: [EmergencyContact] = []
        do {
            result = try managedContext.fetch(fetchRequest) as! [EmergencyContact]
            // fill list with result
        } catch {
            let fetchError = error as NSError
            print(fetchError)
        }
        return result
    }*/
    

    
        func setUpElements() {
        // hide error lable
        
        //style Elements
        
        Utilities.styleFilledButton(sendMessageBtn)
        
    }


}
