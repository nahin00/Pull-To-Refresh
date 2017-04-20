//
//  TableViewController.swift
//  Pull To Refresh
//
//  Created by Silicon Orchard Ltd on 4/20/17.
//  Copyright © 2017 Nahin Ahmed. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var array = [1, 2, 3]
    
    var refresher = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refresher.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refresher.addTarget(self, action: #selector(TableViewController.populate), for: .valueChanged)
        tableView.addSubview(refresher)

    }
    
    
    func populate() {
        
        for i in 1...1000 {
            array.append(i)
        }
        
        refresher.endRefreshing()
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return array.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = String(array[indexPath.row])

        return cell
    }
 
}
