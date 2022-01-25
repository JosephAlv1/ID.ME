//
//  UserProfileCoordinator.swift
//  Assesment
//
//  Created by Joseph on 22/01/2022.
//

import Foundation
import UIKit

// MARK: - UserProfile Router Protocol
protocol UserProfileRouter: AnyObject {
    func start()
    func showPurchases(vc: UIViewController)
}

// MARK: - UserProfileCoordinator Class
class UserProfileCoordinator {
    private var window: UIWindow
    private var navigationController: UINavigationController?
    
    init(window: UIWindow) {
        self.window = window
    }
}

// MARK: - Routing
extension UserProfileCoordinator: UserProfileRouter {
    
    func start() {
        let viewController = UserProfileViewController.initiateFrom(Storybaord: .main)
        viewController.interactor = UserProfileInteractor(presenter: UserProfilePresenter(viewController: viewController))
        viewController.router = self
        self.window.rootViewController = UINavigationController(rootViewController: viewController)
    }
    
    func showPurchases(vc: UIViewController) {
        let purchasesCoordinator = PurchasesCoordinator()
        purchasesCoordinator.start(from: vc)
    }
}
