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
    var commitTableView: UITableView!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = (UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "CommitViewController") as! CommitViewController)
        _ = sut.view
        
        commitTableView = sut.commitTableView
        commitTableView.dataSource = sut
        commitTableView.delegate = sut
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
    
    // MARK: - Sections
    func testTableViewSections_Count_ReturnsOne() {
        let sections = commitTableView.numberOfSections
        XCTAssertEqual(sections, 1)
    }
    
    // MARK: - Rows
    func testTableViewRows_SectionOne_ReturnsCommitsCount() {
        let count = sut.commits.count
        XCTAssertEqual(commitTableView.numberOfRows(inSection: 0), count)
    }
    
    // MARK: - Performance
    func testAPI_LoadCommits() {
        measure {
            _ = MockAPI()
        }
    }
    
}
