//
//  CommitViewController.swift
//  CommitsGM
//
//  Created by Scott on 10/8/20.
//

import UIKit

class CommitViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var commitTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        commitTableView.delegate = self
        commitTableView.dataSource = self
    }
    
    // MARK: - Table view delegate and datasource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 25
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.textLabel?.text = "row: \(indexPath.row)"
        
        return cell
    }

}
