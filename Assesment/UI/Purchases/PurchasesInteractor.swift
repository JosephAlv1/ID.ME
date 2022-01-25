//
//  PurchasesInteractor.swift
//  Assesment
//
//  Created by Joseph on 23/01/2022.
//

import Foundation

// MARK: - PurchasesInteractorProtocol
protocol PurchasesInteractorProtocol {
    func viewDidLoad()
    var presenter: PurchasesPresentationProtocol? { get set }
}

// MARK: - PurchasesInteractor
class PurchasesInteractor {
    var presenter: PurchasesPresentationProtocol?
    init(presenter: PurchasesPresentationProtocol) {
        self.presenter = presenter
    }
    
    private func getPurchases() {
        
        APIWorker.getPurchases(userId: "", page: 1) { [weak self] (result) in
            switch result {
            case .success(let purchases):
                guard let _purchases = purchases as? [PurchaseItem] else {
                    self?.presenter?.presentError(errorString: "Something went wrong");return
                }
                self?.populateData(with: _purchases)
                break
            case .failure(let errorString):
                self?.presenter?.presentError(errorString: errorString)
                break
            }
        }
        
    }
    
    private func populateData(with purchases: [PurchaseItem]) {
        
        var rows = [PurchasesViewController.Purchases.Row]()
        for item in purchases {
            rows.append(.init(purchaseCellData: .init(image: item.image, purchaseDate: item.purchaseDate, itemName: item.itemName, price: item.price, serial: item.serial, feedDescription: item.feedDescription)))
        }
        let viewData = PurchasesViewController.Purchases.ViewData.init(section: .init(rows: rows))
        presenter?.presentPurchases(viewData: viewData)
    }
}

// MARK: - PurchasesInteractor delegates
extension PurchasesInteractor: PurchasesInteractorProtocol {
    
    func viewDidLoad() {
        getPurchases()
    }
}
