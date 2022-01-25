//
//  PurchasesCordinator.swift
//  Assesment
//
//  Created by Joseph on 23/01/2022.
//

import Foundation
import UIKit

// MARK: - Purchases Router Protocol
protocol PurchasesRouter: AnyObject {
    func start(from source: UIViewController)
    func showHistory(vc: UIViewController)
}

// MARK: - PurchasesCoordinator Class
class PurchasesCoordinator {
    
}

// MARK: - Routing
extension PurchasesCoordinator: PurchasesRouter {
    
    func start(from source: UIViewController) {
        let viewController = PurchasesViewController.initiateFrom(Storybaord: .main)
        viewController.interactor = PurchasesInteractor(presenter: PurchasesPresenter(viewController: viewController))
        viewController.router = self
        source.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func showHistory(vc: UIViewController) {
        let purchasesCoordinator = HistoryCoordinator()
        purchasesCoordinator.start(from: vc)
    }
}
