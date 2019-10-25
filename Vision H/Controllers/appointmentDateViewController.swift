//
//  appointmentDateViewController.swift
//  Vision H
//
//  Created by Devang Patel on 25/10/19.
//  Copyright © 2019 Devang Patel. All rights reserved.
//

import UIKit

class appointmentDateViewController: UIViewController {

    @IBOutlet weak var sucessView: UIView!
    @IBOutlet weak var datelabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        sucessView.isHidden = true
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
        sucessView.isHidden = false
        
    }
    
    
    @IBAction func back(_ sender: Any) {
        let homeView = self.storyboard?.instantiateViewController(withIdentifier: "patientHomeViewController") as! patientHomeViewController
        self.present(homeView, animated: true, completion: nil)
        print("Success! to patient!")
    }
    
    
}
