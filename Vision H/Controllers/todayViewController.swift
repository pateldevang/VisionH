//
//  todayViewController.swift
//  Vision H
//
//  Created by Devang Patel on 26/10/19.
//  Copyright © 2019 Devang Patel. All rights reserved.
//

import UIKit

class todayViewController: UIViewController{
    
    
    
    
    let name = ["Aditya Parmar","Yash Agarwal","Narayan Moorthy","Urmila Pawar","Vasant Hegde"]
     private let sectionTitles: [String] = ["  Morning","  Evening"]
    

    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.table.tableFooterView = UIView()
        table.reloadData()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension todayViewController: UITableViewDelegate,UITableViewDataSource {
   
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = #colorLiteral(red: 0.2072719336, green: 0.5849757791, blue: 0.4913259745, alpha: 1)
        headerView.tintColor = .white
        let label = UILabel()
        label.text = sectionTitles[section]
        label.textColor = UIColor.black
        label.font = UIFont.init(name: "SF Pro Text-Medium", size: 10.0)
        label.frame = CGRect(x: 0, y: 0, width: 100, height: 35)
        headerView.addSubview(label)
        return headerView
    }
    
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = name[indexPath.row]
        return cell
    
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "toScan", sender: self)
    }
    


}
