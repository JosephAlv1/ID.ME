//
//  HistoryPresenter.swift
//  Assesment
//
//  Created by Joseph on 24/01/2022.
//

import Foundation

// MARK: - Presentation Protocol
protocol HistoryPresentationProtocol {
    func presentHistory(viewData: HistoryViewController.History.ViewData)
}

// MARK: - Presenter Class
class HistoryPresenter {
    weak var viewController: HistoryDisplayLogic?
    
    init(viewController: HistoryDisplayLogic) {
        self.viewController = viewController
    }
}

// MARK: - Presenter Delegates
extension HistoryPresenter: HistoryPresentationProtocol {
    
    func presentHistory(viewData: HistoryViewController.History.ViewData) {
        viewController?.displayHistory(viewData: viewData)
    }
    
    
}
