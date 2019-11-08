
//
//  appointmentViewController.swift
//  Vision H
//
//  Created by Devang Patel on 25/10/19.
//  Copyright © 2019 Devang Patel. All rights reserved.
//

import UIKit
var DOCID = ""
class appointmentViewController: UIViewController {

    @IBOutlet weak var phnum: UITextField!

    @IBOutlet weak var lname: UITextField!
    @IBOutlet weak var fname: UITextField!
    
    
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
    override var prefersStatusBarHidden: Bool {
        return true
    }
    //MARK:- TextField Delegate Method
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func datec(_ sender: Any) {
        DOCID = lname.text!
    }
    

}

//MARK: - Extensions
extension appointmentViewController : UITextFieldDelegate {
    
    //Setup textfield delegates
    func textFieldDelegateSetUp() {
        fname.delegate = self
        lname.delegate = self
        phnum.delegate = self
    }
}
