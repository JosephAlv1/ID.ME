//
//  HistoryCordinator.swift
//  Assesment
//
//  Created by Joseph on 24/01/2022.
//

import Foundation
import UIKit

// MARK: - History Router Protocol
protocol HistoryRouter: AnyObject {
    func start(from source: UIViewController)
}

// MARK: - HistoryCoordinator Class
class HistoryCoordinator {
    
}

// MARK: - Routing
extension HistoryCoordinator: HistoryRouter {
    
    func start(from source: UIViewController) {
        let viewController = HistoryViewController.initiateFrom(Storybaord: .main)
        viewController.interactor = HistoryInteractor(presenter: HistoryPresenter(viewController: viewController))
        viewController.router = self
        source.present(viewController, animated: true) {
            
        }
    }
}

