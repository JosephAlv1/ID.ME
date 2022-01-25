//
//  PurchasesCordinatorTests.swift
//  AssesmentTests
//
//  Created by Joseph on 24/01/2022.
//

import XCTest
@testable import Assesment

class PurchasesCordinatorTests: XCTestCase {
    
    var sut: PurchasesCordinatorSpy!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = PurchasesCordinatorSpy()
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
    
    func testShowHistory_whenCalled_returnTrue() {
        // Act
        sut.showHistory(vc: UIViewController.init())
        
        // Assert
        XCTAssert(sut.showHistoryCalled, "func showPurchases(vc: UIViewController) should be called ")
    }

}

class PurchasesCordinatorSpy: PurchasesRouter {
    
    var startCalled: Bool = false
    var showHistoryCalled: Bool = false
    
    func start(from source: UIViewController) {
        startCalled = true
    }
    
    func showHistory(vc: UIViewController) {
        showHistoryCalled = true
    }

}
