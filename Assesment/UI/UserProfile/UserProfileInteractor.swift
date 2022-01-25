//
//  UserProfileInteractor.swift
//  Assesment
//
//  Created by Joseph on 22/01/2022.
//

import Foundation

// MARK: - UserProfileInteractorProtocol
protocol UserProfileInteractorProtocol {
    func viewDidLoad()
    var presenter: UserProfilePresentationProtocol? { get set }
}

// MARK: - UserProfileInteractor
class UserProfileInteractor {
    var presenter: UserProfilePresentationProtocol?
    init(presenter: UserProfilePresentationProtocol) {
        self.presenter = presenter
    }
    
    private func getUserProfile() {
        
        APIWorker.getUserProfileBy(userId: "U13023932") { [weak self] (result) in
            switch result {
            case .success(let profile):
                guard let userpProfile = profile as? UserProfile else {
                    self?.presenter?.presentError(errorString: "Something went wrong");return
                }
                self?.populateData(with: userpProfile)
                break
            case .failure(let errorString):
                self?.presenter?.presentError(errorString: errorString)
                break
            }
        }
    }
    
    private func populateData(with userProfile: UserProfile) {
        
        var rows = [UserProfileViewController.UserProfile.Row]()
        rows.append(.init(profileCellData: .init(title: "Username", value: userProfile.userName ?? "")))
        rows.append(.init(profileCellData: .init(title: "Full name", value: userProfile.fullName ?? "")))
        rows.append(.init(profileCellData: .init(title: "Phone number", value: userProfile.phoneNumber ?? "")))
        rows.append(.init(profileCellData: .init(title: "Registration date", value: userProfile.registration?.getGMTDate?.localDate ?? "")))
        
        let viewData = UserProfileViewController.UserProfile.ViewData.init(name: userProfile.name ?? "", image: userProfile.image ?? "", section: .init(title: "Personal", rows: rows))
        presenter?.presentProfile(viewData: viewData)
        
    }
}

// MARK: - UserProfileInteractor delegates
extension UserProfileInteractor: UserProfileInteractorProtocol {
    
    func viewDidLoad() {
        getUserProfile()
    }
    
    
}
