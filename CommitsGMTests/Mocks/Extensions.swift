//
//  File.swift
//  CommitsGMTests
//
//  Created by Scott on 10/8/20.
//

import UIKit

@testable import CommitsGM

extension CommitCellTests {
    
    class MockCellDataSource: NSObject, UITableViewDataSource {
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            return UITableViewCell()
        }
    }
}

extension CommitsGMViewControllerTests {
    
    class MockAPI {
        
        var commits = [JSON]()
        
        func loadGitHubCommits() {
            // Fetch data with SwiftyJSON from GitHub API, if error returns message
            if let data = (try? String(contentsOf: URL(string:"https://api.github.com/repos/apple/swift/commits?per_page=25")!)) ?? "failed to fetch data" {
                let jsonCommits = JSON(parseJSON: data)
                
                // read the commits back out
                let jsonCommitArray = jsonCommits.arrayValue
                
                // Debug: return if array is less than the request param of 25
                assert(jsonCommitArray.count <= 25, "array is returning less than 25")
                
                // Debug: return if data from JSON fetched from GitHub is 0
                assert((jsonCommitArray.count != 0), "jsonCommits data is 0")
                
                // add data to array
                commits = jsonCommitArray
            }
        }
        
    }
    
}


