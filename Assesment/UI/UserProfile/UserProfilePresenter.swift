//
//  UserProfilePresenter.swift
//  Assesment
//
//  Created by Joseph on 22/01/2022.
//

import Foundation

// MARK: - Presentation Protocol
protocol UserProfilePresentationProtocol {
    func presentProfile(viewData: UserProfileViewController.UserProfile.ViewData)
    func presentError(errorString: String)
}

// MARK: - Presenter Class
class UserProfilePresenter {
    weak var viewController: UserProfileDisplayLogic?
    
    init(viewController: UserProfileDisplayLogic) {
        self.viewController = viewController
    }
}

// MARK: - Presenter Delegates
extension UserProfilePresenter: UserProfilePresentationProtocol {
    
    func presentProfile(viewData: UserProfileViewController.UserProfile.ViewData) {
        viewController?.displayUserProfile(viewData: viewData)
    }
    
    func presentError(errorString: String) {
        viewController?.displayError(errorString: errorString)
        
    }
}
