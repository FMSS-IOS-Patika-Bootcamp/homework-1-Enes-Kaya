//
//  SelectedVC.swift
//  HW1-EnesKAYA
//
//  Created by Enes Kaya on 9.09.2022.
//

import UIKit

class SelectedVC: UIViewController {

    @IBOutlet weak var subtypeText: UITextField!
    @IBOutlet weak var speciesText: UITextField!
    @IBOutlet weak var ageText: UITextField!
    @IBOutlet weak var genderText: UITextField!
    @IBOutlet weak var petNameText: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func submitButtonClicked(_ sender: Any) {
        
        let petName = "\(self.petNameText.text ?? "Noname")"
        
        
        NotificationCenter.default.post(name: .nameNotification, object: nil, userInfo: ["name":petName])
        
        self.dismiss(animated: true, completion: nil)                                                               //for closing second page and go back first

          
        
    }
}


///extension for identifiying the notification center
extension NSNotification.Name{
    static let nameNotification = Notification.Name.init(rawValue: "nameNotification")
}
