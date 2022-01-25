//
//  HistoryInteractor.swift
//  Assesment
//
//  Created by Joseph on 24/01/2022.
//

import Foundation

// MARK: - HistoryInteractorProtocol
protocol HistoryInteractorProtocol {
    func viewDidLoad()
    var presenter: HistoryPresentationProtocol? { get set }
}

// MARK: - HistoryInteractor
class HistoryInteractor {
    var presenter: HistoryPresentationProtocol?
    init(presenter: HistoryPresentationProtocol) {
        self.presenter = presenter
    }
}

// MARK: - HistoryInteractor delegates
extension HistoryInteractor: HistoryInteractorProtocol {
    
    func viewDidLoad() {
        presenter?.presentHistory(viewData: .init(historyDetail: "This screen contains your entire purchases history. You can sort it by date of purchase. And you can filter it with the search bar."))
        
    }
}


