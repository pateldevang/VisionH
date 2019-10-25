//
//  appointmentDateViewController.swift
//  Vision H
//
//  Created by Devang Patel on 25/10/19.
//  Copyright © 2019 Devang Patel. All rights reserved.
//

import UIKit

class appointmentDateViewController: UIViewController {

    @IBOutlet weak var datelabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBAction func pickerAction(_ sender: Any) {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.timeStyle = DateFormatter.Style.short
        
        let strDate = dateFormatter.string(from: datePicker.date)
        datelabel.text = strDate
    }
    
    @IBAction func datePickerChanged(_ sender: Any) {
        
    }
    
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
