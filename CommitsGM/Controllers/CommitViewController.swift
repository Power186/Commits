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
            
            // DEBUG: return if data from JSON fetched from GitHub is 0
            assert((jsonCommitArray.count != 0), "jsonCommits data is empty")
            
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
        // intialize tableview with CommitCell and cast as CommitCell to use behavior
        let cell = commitTableView.dequeueReusableCell(withIdentifier: "CommitCell") as! CommitCell
        
        // assign each commit a row
        let commit = commits[indexPath.row]
        
        // loop through commits array and fetch selected commit data
        for _ in commits {
            let author = commit["commit"]["author"]["name"].stringValue
            let sha = commit["sha"].stringValue
            let message = commit["commit"]["message"].stringValue
            
            // assign labels to selected data
            cell.authorLabel.text = author
            cell.hashLabel.text = sha
            cell.messageLabel.text = message
        }
        
        return cell
    }

}
