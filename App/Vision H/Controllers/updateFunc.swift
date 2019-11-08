//
//  updateFunc.swift
//  Vision H
//
//  Created by Devang Patel on 06/11/19.
//  Copyright © 2019 Devang Patel. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

let baseurl = "http://192.168.43.41:3000"
extension UIViewController
{
func update()
{
    let url = baseurl+"/attendAppointment/PID001)"
    print(url)
    Alamofire.request(url, method: .get).responseJSON { (response) in
        if (response.result.isSuccess) {
            let json = JSON(response.result.value!)
            print(json)
            if json[0]["res"].stringValue == "sucess"{
                let alert = UIAlertController(title: "Sucess", message: "New account created!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert,animated: true,completion: nil)
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
}
