//
//  signUpViewController.swift
//  Vision H
//
//  Created by Devang Patel on 22/10/19.
//  Copyright © 2019 Devang Patel. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class signUpViewController: UIViewController {
    
    
    @IBOutlet weak var pass: UITextField!
    @IBOutlet weak var fname: UITextField!
    @IBOutlet weak var cpass: UITextField!
    @IBOutlet weak var phnum: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Setting up textFields
        textFieldDelegateSetUp()
        // Function for tap gesture
        hideKeyboardWhenTappedAround()
    }
    


    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    //MARK:- TextField Delegate Method
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    @IBAction func signUp(_ sender: Any) {
        let url = baseurl+"/newuser/\(fname.text!)/\(phnum.text!)"
        print(url)
        Alamofire.request(url, method: .get).responseJSON { (response) in
            if (response.result.isSuccess) {
                let json = JSON(response.result.value!)
                 print(json[0]["res"])
                if json[0]["res"].stringValue == "sucess"{
                    let alert = UIAlertController(title: "Sucess", message: "New account created!", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                    self.present(alert,animated: true,completion: nil)
                    self.fname.text = ""
                    self.phnum.text = ""
                    self.cpass.text = ""
                    self.pass.text = ""
                }
                else {
                    let alert = UIAlertController(title: "Alert", message: "New account creation failed!", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                     self.present(alert,animated: true,completion: nil)
                }
        }
            else {
                print(response.error as Any)
                let alert = UIAlertController(title: "Alert", message: "New account creation failed!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert,animated: true,completion: nil)
            }
    }
    }
    
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
}




//MARK: - Extensions
extension signUpViewController: UITextFieldDelegate {
    
    //Setup textfield delegates
    func textFieldDelegateSetUp() {
        pass.delegate = self
        cpass.delegate = self
        fname.delegate = self
        phnum.delegate = self
    }
}
