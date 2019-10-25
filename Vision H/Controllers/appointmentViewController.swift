
//
//  appointmentViewController.swift
//  Vision H
//
//  Created by Devang Patel on 25/10/19.
//  Copyright © 2019 Devang Patel. All rights reserved.
//

import UIKit

class appointmentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
    

}
