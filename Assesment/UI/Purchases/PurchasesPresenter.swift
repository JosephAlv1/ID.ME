//
//  PurchasesPresenter.swift
//  Assesment
//
//  Created by Joseph on 23/01/2022.
//

import Foundation

// MARK: - Presentation Protocol
protocol PurchasesPresentationProtocol {
    func presentPurchases(viewData: PurchasesViewController.Purchases.ViewData)
    func presentError(errorString: String)
}

// MARK: - Presenter Class
class PurchasesPresenter {
    weak var viewController: PurchasesDisplayLogic?
    
    init(viewController: PurchasesDisplayLogic) {
        self.viewController = viewController
    }
}

// MARK: - Presenter Delegates
extension PurchasesPresenter: PurchasesPresentationProtocol {
    
    func presentPurchases(viewData: PurchasesViewController.Purchases.ViewData) {
        viewController?.displayPurchases(viewData: viewData)
    }
    
    func presentError(errorString: String) {
        viewController?.displayError(errorString: errorString)
    }
}
