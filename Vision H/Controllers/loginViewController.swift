//
//  loginViewController.swift
//  Vision H
//
//  Created by Devang Patel on 22/10/19.
//  Copyright © 2019 Devang Patel. All rights reserved.
//

import UIKit
import Firebase

class loginViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var pass: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    //MARK: - Login button action
    @IBAction func loginButton(_ sender: Any) {
        
        if email.text == "PID001" {
            let homeView = self.storyboard?.instantiateViewController(withIdentifier: "patientHomeViewController") as! patientHomeViewController
            self.present(homeView, animated: true, completion: nil)
            print("Success! to patient!")
        }
        else {
            let homeView = self.storyboard?.instantiateViewController(withIdentifier: "doctorHomeViewController") as! doctorHomeViewController
            self.present(homeView, animated: true, completion: nil)
            print("Success! to doctor")
        }
        
    }
    
}
