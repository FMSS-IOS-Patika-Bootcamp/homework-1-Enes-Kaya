//
//  ViewController.swift
//  HW1-EnesKAYA
//
//  Created by Enes Kaya on 9.09.2022.
//

import UIKit

//This class is about first page when app starts

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    //TableView
    @IBOutlet weak var tableView: UITableView!
    var petArray = [String]()
    var pet = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addButtonClicked))
        
        NotificationCenter.default.addObserver(self, selector: #selector(petSubmit), name:
                .nameNotification, object: nil)
        
    }
    
    @objc func addButtonClicked(){
            performSegue(withIdentifier: "toSelectedVC", sender: nil)
        }
    @objc func petSubmit(_ notification:Notification){
        guard let nameFromForm = notification.userInfo?["name"] as? String else { return }
        pet = nameFromForm
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = pet
        return cell
    }
    
    
    
    
}

