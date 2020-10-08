//
//  CommitsGMTests.swift
//  CommitsGMTests
//
//  Created by Scott on 10/8/20.
//

import XCTest

@testable import CommitsGM
class CommitsGMViewControllerTests: XCTestCase {
    
    var sut = CommitViewController()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = (UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "CommitViewController") as! CommitViewController)
        _ = sut.view
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // MARK: - Nil Checks
    func testCommitVC_TableViewShouldNotBeNil() {
        XCTAssertNotNil(sut.commitTableView)
    }
    
    // MARK: - Data Source
    func testDataSource_ViewDidLoad_SetsTableViewDataSource() {
        XCTAssertNotNil(sut.commitTableView.dataSource)
    }
    
    // MARK: - Delegate
    func testDelegate_ViewDidLoad_SetsTableViewDelegate() {
        XCTAssertNotNil(sut.commitTableView.delegate)
    }

}
