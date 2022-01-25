//
//  AppCoordinator.swift
//  Assessment
//
//  Created by Joseph on 11/01/2022.
//

import Foundation
import UIKit

// MARK: - AppRouter Protocol
protocol AppRouter: AnyObject {
    func start()
}

final class AppCoordinator {
    
    private var window: UIWindow
    private var loginCoordinator: UserProfileCoordinator?
    
    init(window: UIWindow) {
        self.window = window
    }
    
    // MARK: - Private Methods
    private func showLogin() {
        self.loginCoordinator = UserProfileCoordinator.init(window: window)
        self.loginCoordinator?.start()
    }
}

// MARK: - AppRouter Delegates
extension AppCoordinator: AppRouter {
    
    func start() {
        self.window.backgroundColor = .white
        self.window.overrideUserInterfaceStyle = .light
        self.window.makeKeyAndVisible()
        showLogin()
    }
}
