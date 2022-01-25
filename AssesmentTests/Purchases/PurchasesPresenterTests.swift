//
//  PurchasesPresenterTests.swift
//  AssesmentTests
//
//  Created by Joseph on 24/01/2022.
//

import XCTest
@testable import Assesment

class PurchasesPresenterTests: XCTestCase {

    var sut: PurchasesPresenterSpy!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = PurchasesPresenterSpy()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPresentPurchases_whenCalled_returnTrue() {
        // Act
        sut.presentPurchases(viewData: .init(section: .init(rows: [PurchasesViewController.Purchases.Row.init(purchaseCellData: .init(image: "", purchaseDate: "", itemName: "", price: "", serial: "", feedDescription: ""))])))
        
        // Assert
        XCTAssert(sut.presentPurchasesCalled, "func func presentPurchases(viewData: PurchasesViewController.Purchases.ViewData) should be called ")
    }
    
    func testPresentError_whenCalled_returnTrue() {
        // Act
        sut.presentError(errorString: "server error")
        
        // Assert
        XCTAssert(sut.presentErrorCalled, "func presentError(errorString: String) should be called ")
    }

}


class PurchasesPresenterSpy: PurchasesPresentationProtocol {
    
    var presentPurchasesCalled = false
    var presentErrorCalled = false
    
    func presentPurchases(viewData: PurchasesViewController.Purchases.ViewData) {
        presentPurchasesCalled = true
    }
    
    func presentError(errorString: String) {
        presentErrorCalled = true
    }

}
