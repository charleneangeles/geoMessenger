//
//  TablesViewController.swift
//  geoMessenger
//
//  Created by Charlene Angeles on 11/1/17.
//  Copyright © 2017 deHao. All rights reserved.
//

import UIKit
import Firebase

class TablesViewController: UIViewController {

    @IBOutlet weak var txtFirstName: UITextField!


    @IBOutlet weak var txtLastName: UITextField!
    

    @IBAction func btnAddButton(_ sender: CustomButton) {
        var ref : DatabaseReference!
        
        ref = Database.database().reference()
        
        let userTable : [String : Any] =
            ["FirstName": txtFirstName.text!,
             "LastName": txtLastName.text!,
             "IsApproved": false]
        
        ref.child("MyUsers").childByAutoId().setValue(userTable)
        
        let ac = UIAlertController(title: "User Saved!", message:"The user information  was saved successfully!", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
        
        txtLastName.text = nil
        txtFirstName.text = nil
    }
}

