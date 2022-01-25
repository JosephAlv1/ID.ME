//
//  HistoryCordinatorTests.swift
//  AssesmentTests
//
//  Created by Joseph on 24/01/2022.
//

import XCTest
@testable import Assesment

class HistoryCordinatorTests: XCTestCase {
    
    
    var sut: HistoryCordinatorSpy!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = HistoryCordinatorSpy()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testStart_whenCalled_returnTrue() {
        // Act
        sut.start(from: UIViewController.init())
        
        // Assert
        XCTAssert(sut.startCalled, "func start() should be called ")
    }
}

class HistoryCordinatorSpy: HistoryRouter {
    
    var startCalled = false
    
    func start(from source: UIViewController) {
        startCalled = true
    }
    
    
}
