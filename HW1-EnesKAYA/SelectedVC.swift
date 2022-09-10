//
//  SelectedVC.swift
//  HW1-EnesKAYA
//
//  Created by Enes Kaya on 9.09.2022.
//

import UIKit

//Define Notification Center
extension NSNotification.Name {
    
    static let newPet = Notification.Name.init(rawValue: "newPet")
}


class SelectedVC: UIViewController {
    
    
    //SelectedVC components are defined and connected according to the camelCase rule
    @IBOutlet weak var subtypeText  : UITextField!
    @IBOutlet weak var speciesText  : UITextField!
    @IBOutlet weak var ageText      : UITextField!
    @IBOutlet weak var genderText   : UITextField!
    @IBOutlet weak var petNameText  : UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Gesture recognizer for keybord dismiss
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(gestureRecognizer)
        
    }
    
    //Hide keyboard function
    @objc func hideKeyboard() {
          view.endEditing(true)
      }
      
    
    
    @IBAction func submitButtonClicked(_ sender: Any) {
        
        //Get Pet informations
        let petName     = petNameText.text
        let petSubtype  = subtypeText.text
        let petSpecies  = speciesText.text
        let petAge      = ageText.text
        let petGender   = genderText.text
        
        //Push notifications
        NotificationCenter.default.post(name: .newPet, object: nil, userInfo: ["petName":petName])
        NotificationCenter.default.post(name: .newPet, object: nil, userInfo: ["petSubtype":petSubtype])
        NotificationCenter.default.post(name: .newPet, object: nil, userInfo: ["petSpecies":petSpecies])
        NotificationCenter.default.post(name: .newPet, object: nil, userInfo: ["pe tAge":petAge])
        NotificationCenter.default.post(name: .newPet, object: nil, userInfo: ["petGender":petGender])
        
        // SelectedVC close and move the first vc
        self.dismiss(animated: true, completion: nil)
        
        
    }
}


