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

    

