//
//  CommitViewController.swift
//  CommitsGM
//
//  Created by Scott on 10/8/20.
//

import UIKit

class CommitViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Properties
    @IBOutlet weak var commitTableView: UITableView!
    
    var commits = [JSON]()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Table view conformance
        commitTableView.delegate = self
        commitTableView.dataSource = self
        
        // Fetch data with SwiftyJSON from GitHub API
        if let data = try? String(contentsOf: URL(string:"https://api.github.com/repos/apple/swift/commits?per_page=25")!) {
            let jsonCommits = JSON(parseJSON: data)
            
            // read the commits back out
            let jsonCommitArray = jsonCommits.arrayValue
            print("Received \(jsonCommitArray.count) new commits.")
            
            // update tableview with data
            DispatchQueue.main.async {
                self.commits = jsonCommitArray
                self.commitTableView.reloadData()
            }
        }
        
    }
    
    // MARK: - UITableView Delegate and Datasource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        // assign each commit a row
        let commit = commits[indexPath.row]
        
        // loop through commits array and fetch selected commit data to display in label
        for _ in commits {
            let sha = commit["commit"]["author"]["name"].stringValue
            
            cell.textLabel?.text = sha
        }
        
        return cell
    }

}
