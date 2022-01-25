//
//  PurchasesInteractorTests.swift
//  AssesmentTests
//
//  Created by Joseph on 24/01/2022.
//

import XCTest
@testable import Assesment

class PurchasesInteractorTests: XCTestCase {
    
    var sut: PurchasesInteractorSpy!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = PurchasesInteractorSpy()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testViewDidLoad_whenCalled_returnTrue() {
        // Act
        sut.viewDidLoad()
        
        // Assert
        XCTAssert(sut.viewDidLoadCalled, "func viewDidLoad() should be called ")
    }

}

class PurchasesInteractorSpy: PurchasesInteractorProtocol {
    
    var viewDidLoadCalled = false
    var presenter: PurchasesPresentationProtocol?
    
    func viewDidLoad() {
        viewDidLoadCalled = true
    }
    

}
