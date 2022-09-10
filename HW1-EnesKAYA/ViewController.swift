//
//  ViewController.swift
//  HW1-EnesKAYA
//
//  Created by Enes Kaya on 9.09.2022.
//

import UIKit



class ViewController: UIViewController {
    
    
    //ViewController components are defined and connected according to the camelCase rule
    @IBOutlet weak var subtypeLabel : UILabel!
    @IBOutlet weak var speciesLabel : UILabel!
    @IBOutlet weak var ageLabel     : UILabel!
    @IBOutlet weak var genderLabel  : UILabel!
    
    //Designed to define the pet name from the 2nd VC as a title to the first VC
    @IBOutlet weak var petNameTitleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Added add button to topbar with Navigation Control. Segue is defined to reach the second VC on the Add button
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addButtonClicked))
        
        //Observer of Notification Center
        NotificationCenter.default.addObserver(self, selector: #selector(petNameSubmit), name: .newPet, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(petSubtypeSubmit), name: .newPet, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(petSpeciesSubmit), name: .newPet, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(petAgeSubmit), name: .newPet, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(petGenderSubmit), name: .newPet, object: nil)
    }
    
    // Add Button Segue
    @objc func addButtonClicked() {
        
        performSegue(withIdentifier: "toSelectedVC", sender: nil)
    }
    
    ///When the user submits after entering the second VC Pet information, the first VC is updated according to the entered information
    @objc func petNameSubmit(_ notification:Notification) {
        
        if let getPetName = notification.userInfo?["petName"] as? String {
            
            //If the pet name is empty default title is going to use
            if getPetName.isEmpty == true {
                petNameTitleLabel.text = "Pet Name"
            } else {
                petNameTitleLabel.text = "\(getPetName)'s Detail"
            }
        } else {
            return
        }
    }
    
    @objc func petSubtypeSubmit(_ notification:Notification) {
        
        if let getPetSubtype = notification.userInfo?["petSubtype"] as? String {
            subtypeLabel.text = "Subtype: \(getPetSubtype)"
        } else {
            return
        }
    }
    
    @objc func petSpeciesSubmit(_ notification:Notification) {
        
        if let getPetSpecies = notification.userInfo?["petSpecies"] as? String {
            speciesLabel.text = "Species: \(getPetSpecies)"
        } else {
            return
        }
    }
    
    @objc func petAgeSubmit(_ notification:Notification) {
        
        if let getPetAge = notification.userInfo?["petAge"] as? String {
            ageLabel.text = "Age: \(getPetAge)"
        } else {
            return
        }
    }
    
    @objc func petGenderSubmit(_ notification:Notification) {
        
        if let getPetGender = notification.userInfo?["petGender"] as? String {
            genderLabel.text = "Gender: \(getPetGender)"
        } else {
            return
        }
    }
}

