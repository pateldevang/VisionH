//
//  keyboard+hide.swift
//  Vision H
//
//  Created by Devang Patel on 22/10/19.
//  Copyright © 2019 Devang Patel. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    // Function for tap gesture
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    // Calling dismiss selector actions
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}

