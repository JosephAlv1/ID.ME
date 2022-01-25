//
//  HistoryPresenterTests.swift
//  AssesmentTests
//
//  Created by Joseph on 24/01/2022.
//

import XCTest
@testable import Assesment

class HistoryPresenterTests: XCTestCase {

    var sut: HistoryPresenterSpy!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = HistoryPresenterSpy()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPresentHistory_whenCalled_returnTrue() {
        // Act
        sut.presentHistory(viewData: .init(historyDetail: "Purchases history"))
        
        // Assert
        XCTAssert(sut.presentHistoryCalled, "func presentHistory(viewData: HistoryViewController.History.ViewData) should be called ")
    }

}

class HistoryPresenterSpy: HistoryPresentationProtocol {
    
    var presentHistoryCalled = false
    
    func presentHistory(viewData: HistoryViewController.History.ViewData) {
        presentHistoryCalled = true
    }
    
    
}
