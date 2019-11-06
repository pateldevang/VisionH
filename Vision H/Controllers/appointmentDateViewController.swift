//
//  appointmentDateViewController.swift
//  Vision H
//
//  Created by Devang Patel on 25/10/19.
//  Copyright © 2019 Devang Patel. All rights reserved.
//

import UIKit

class appointmentDateViewController: UIViewController {

    @IBOutlet weak var qrimage: UIImageView!
    @IBOutlet weak var sucessView: UIView!
    @IBOutlet weak var datelabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    private var qrcodeImage: CIImage!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sucessView.isHidden = true
        let rsa : RSAWrapper? = RSAWrapper()
        let success : Bool = (rsa?.generateKeyPair(keySize: 2048, privateTag: "in.devangpatel", publicTag: "in.devangpatel"))!
        if (!success) {
            print("Failed")
            return
        }
        let test : String = "PID001"
        let encryption = rsa?.encryptBase64(text: test)
        print(encryption)
        qrimage.image = generateQRCode(from: "\(encryption)")
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
    
    func generateQRCode(from string: String) -> UIImage? {
        let data = string.data(using: String.Encoding.ascii)
        
        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 3, y: 3)
            
            if let output = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: output)
            }
        }
        
        return nil
    }
    


    
    
}
