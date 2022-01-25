//
//  UserProfileCordinatorTests.swift
//  AssesmentTests
//
//  Created by Joseph on 24/01/2022.
//

import XCTest
@testable import Assesment

class UserProfileCordinatorTests: XCTestCase {
    
    var sut: UserProfileCordinatorSpy!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = UserProfileCordinatorSpy()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testStart_whenCalled_returnTrue() {
        // Act
        sut.start()
        
        // Assert
        XCTAssert(sut.startCalled, "func start() should be called ")
    }
    
    func testShowPurchases_whenCalled_returnTrue() {
        // Act
        sut.showPurchases(vc: UIViewController.init())
        
        // Assert
        XCTAssert(sut.showPurchasesCalled, "func showPurchases(vc: UIViewController) should be called ")
    }

}

class UserProfileCordinatorSpy: UserProfileRouter {
    
    var startCalled: Bool = false
    var showPurchasesCalled: Bool = false
    
    func start() {
        startCalled = true
    }
    func showPurchases(vc: UIViewController) {
        showPurchasesCalled = true
    }

}
