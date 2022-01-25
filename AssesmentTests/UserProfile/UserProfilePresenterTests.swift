//
//  UserProfilePresenterTests.swift
//  AssesmentTests
//
//  Created by Joseph on 24/01/2022.
//

import XCTest
@testable import Assesment

class UserProfilePresenterTests: XCTestCase {

    var sut: UserProfilePresenterSpy!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = UserProfilePresenterSpy()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPresentProfile_whenCalled_returnTrue() {
        // Act
        sut.presentProfile(viewData: .init(name: "Jennifer Smith", image: "", section: .init(title: "Personal", rows: [UserProfileViewController.UserProfile.Row.init(profileCellData: .init(title: "Username", value: "@jennsmith"))])))
        
        // Assert
        XCTAssert(sut.presentProfileCalled, "func presentProfile(viewData: UserProfileViewController.UserProfile.ViewData) should be called ")
    }
    
    func testPresentError_whenCalled_returnTrue() {
        // Act
        sut.presentError(errorString: "server error")
        
        // Assert
        XCTAssert(sut.presentErrorCalled, "func presentError(errorString: String) should be called ")
    }

}

class UserProfilePresenterSpy: UserProfilePresentationProtocol {
    
    var presentProfileCalled: Bool = false
    var presentErrorCalled: Bool = false
    
    func presentProfile(viewData: UserProfileViewController.UserProfile.ViewData) {
        presentProfileCalled = true
    }
    func presentError(errorString: String) {
        presentErrorCalled = true
    }
    
}
