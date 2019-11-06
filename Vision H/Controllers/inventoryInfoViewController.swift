//
//  inventoryInfoViewController.swift
//  Vision H
//
//  Created by Devang Patel on 06/11/19.
//  Copyright © 2019 Devang Patel. All rights reserved.
//

import UIKit

class inventoryInfoViewController: UIViewController {
    
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var qty: UILabel!
    @IBOutlet weak var cost: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var inv: UILabel!
    @IBOutlet weak var obj: UILabel!
    
    
    internal var name1 : String?
    internal var qty1 : String?
    internal var cost1 : String?
    internal var type1 : String?
    internal var inv1 : String?
    internal var obj1 : String?
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

       name.text = name1
        qty.text = qty1
        cost.text = cost1
        type.text = type1
        inv.text = inv1
        obj.text = obj1
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
