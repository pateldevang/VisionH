//
//  inventoryViewController.swift
//  Vision H
//
//  Created by Devang Patel on 06/11/19.
//  Copyright © 2019 Devang Patel. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
var t = 0

class inventoryViewController: UIViewController {

    
    private var name : [String?] = []
    private var cost : [String?] = []
    private var location : [String?] = []
    private var INVID : [String?] = []
    private var obID : [String?] = []
    private var qty : [String?] = []
    private var indexPathForPrepareSegue : IndexPath?
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var table: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.table.tableFooterView = UIView()
        
        networking()
        table.reloadData()
        
        
    }
    
    
    func networking() {
        Alamofire.request(baseurl+"/getInventory", method: .get).responseJSON { (response) in
            
            if (response.result.isSuccess) {
                let json = JSON(response.result.value!)
                var number = 0
                while (number < json.count) {
                   
//                    print(json[number])
                        self.name.append(json[number]["Inv type"].stringValue)
                        self.cost.append(json[number]["cost"].stringValue)
                        self.location.append(json[number]["location"].stringValue)
                        self.INVID.append(json[number]["INV-ID"].stringValue)
                        self.obID.append(json[number]["_id"].stringValue)
                        self.qty.append(json[number]["qty"].stringValue)
        
                    
                    number += 1
                    
                }
                self.table.reloadData()
            }
            else if((response.error) != nil)
            {
                print(response.error?.localizedDescription as Any)
            }
        }
    }
    

    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
}

extension inventoryViewController: UITableViewDelegate,UITableViewDataSource {
    

    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = name[indexPath.row]
        cell.textLabel?.textColor = .black
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        indexPathForPrepareSegue = indexPath
        print(indexPath.row)
        t=indexPath.row
        performSegue(withIdentifier: "toInfo", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destinationVC = segue.destination as! inventoryInfoViewController
        destinationVC.name1 = name[t]
        destinationVC.cost1 = cost[t]
        destinationVC.qty1 = qty[t]
        destinationVC.inv1 = INVID[t]
        destinationVC.type1 = location[t]
        destinationVC.obj1 = obID[t]
    }
}
