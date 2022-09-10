//
//  SelectedVC.swift
//  HW1-EnesKAYA
//
//  Created by Enes Kaya on 9.09.2022.
//

import UIKit


extension NSNotification.Name{
    static let newPet = Notification.Name.init(rawValue: "newPet")
}


class SelectedVC: UIViewController {
    
    @IBOutlet weak var subtypeText: UITextField!
    @IBOutlet weak var speciesText: UITextField!
    @IBOutlet weak var ageText: UITextField!
    @IBOutlet weak var genderText: UITextField!
    @IBOutlet weak var petNameText: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    @IBAction func submitButtonClicked(_ sender: Any) {
        
        let petName     = petNameText.text
        let petSubtype  = subtypeText.text
        let petSpecies  = speciesText.text
        let petAge      = ageText.text
        let petGender   = genderText.text
        
        NotificationCenter.default.post(name: .newPet, object: nil, userInfo: ["petName":petName])
        NotificationCenter.default.post(name: .newPet, object: nil, userInfo: ["petSubtype":petSubtype])
        NotificationCenter.default.post(name: .newPet, object: nil, userInfo: ["petSpecies":petSpecies])
        NotificationCenter.default.post(name: .newPet, object: nil, userInfo: ["petAge":petAge])
        NotificationCenter.default.post(name: .newPet, object: nil, userInfo: ["petGender":petGender])
        
        
        self.dismiss(animated: true, completion: nil)
        
        
    }
}


