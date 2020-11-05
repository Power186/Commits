//
//  CommitViewController.swift
//  CommitsGM
//
//  Created by Scott on 10/8/20.
//

import UIKit

final class CommitViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Properties
    
    @IBOutlet weak var commitTableView: UITableView!
    
    let dataPresenter = DataPresenter()
    
    let commitRefreshControl = UIRefreshControl()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Table view conformance
        commitTableView.delegate = self
        commitTableView.dataSource = self
        
        // Load data
        dataPresenter.loadGitHubCommits(completion: {
            DispatchQueue.main.async {
                self.commitTableView.reloadData()
            }
        })
        
    }
    
    // MARK: - TableView Datasource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataPresenter.commits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using cell identifier
        let cellIdentifier = "CommitCell"
        
        // intialize tableview with CommitCell and cast as CommitCell to use behavior
        guard let cell = commitTableView.dequeueReusableCell(withIdentifier: cellIdentifier,
                                                             for: indexPath) as? CommitCell else {
            return UITableViewCell()
        }
        
        // Fetches appropriate commit for data source layout
        let commit = dataPresenter.commits[indexPath.row]
        
        // assign labels to selected data
        cell.authorLabel.text = commit.authorName
        cell.hashLabel.text = commit.sha
        cell.messageLabel.text = commit.message
        
        return cell
    }
    
}

class DataPresenter {
    var commits = [Commit]()
    
    struct Commit {
        let authorName: String
        let sha: String
        let message: String
    }
    
    @objc func loadGitHubCommits(completion: @escaping () -> Void) {
        
        if let data = (try? String(contentsOf: URL(string:"https://api.github.com/repos/apple/swift/commits?per_page=25")!)) ?? "failed to fetch data" {
            let jsonCommits = JSON(parseJSON: data)
            
            let jsonCommitArray = jsonCommits.arrayValue
            
            let commitModels = jsonCommitArray.compactMap {
                Commit(authorName: $0["commit"]["author"]["name"].stringValue,
                       sha: $0["sha"].stringValue,
                       message: $0["commit"]["message"].stringValue)
            }
            
            assert((jsonCommitArray.count != 0), "jsonCommits data is 0")
            
            self.commits = commitModels

            completion()
        }
    }
}
