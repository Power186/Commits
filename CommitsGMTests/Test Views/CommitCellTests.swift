//
//  CommitCellTests.swift
//  CommitsGMTests
//
//  Created by Scott on 10/8/20.
//

import XCTest

@testable import CommitsGM
class CommitCellTests: XCTestCase {
    
    var tableView: UITableView!
    var mockDataSource: MockCellDataSource!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let commitVC = (UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "CommitViewController") as! CommitViewController)
        _ = commitVC.view
        
        tableView = commitVC.commitTableView
        mockDataSource = MockCellDataSource()
        tableView.dataSource = mockDataSource
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCell_Config_ShouldSetLabelsToCommitData() {
        // label tests here
    }

}
