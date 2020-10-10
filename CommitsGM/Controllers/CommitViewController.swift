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
        
        // Load data
        loadGitHubCommits()
    }
    
    // MARK: - TableView Datasource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using cell identifier
        let cellIdentifier = "CommitCell"
        
        // intialize tableview with CommitCell and cast as CommitCell to use behavior
        guard let cell = commitTableView.dequeueReusableCell(withIdentifier: cellIdentifier,
                                                             for: indexPath) as? CommitCell else {
            fatalError("The dequeued cell is not an instance of CommitCell")
        }
        
        // Fetches appropriate commit for data source layout
        let commit = commits[indexPath.row]
        
        // loop through commits array for selected commit data
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
    
    // MARK: - Private Methods
    
    private func loadGitHubCommits() {
        // Fetch data with SwiftyJSON from GitHub API, if error returns nil
        if let data = try? String(contentsOf: URL(string:"https://api.github.com/repos/apple/swift/commits?per_page=25")!) {
            let jsonCommits = JSON(parseJSON: data)
            
            // read the commits back out
            let jsonCommitArray = jsonCommits.arrayValue
            
            // Debug: return if array is less than the request param of 25
            assert(jsonCommitArray.count >= 25, "array is returning less than 25")
            
            // Debug: return if data from JSON fetched from GitHub is 0
            assert((jsonCommitArray.count != 0), "jsonCommits data is 0")
            
            // update tableview with data
            DispatchQueue.main.async {
                self.commits = jsonCommitArray
                self.commitTableView.reloadData()
            }
        }
    }

}
