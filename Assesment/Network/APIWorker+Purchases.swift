//
//  APIWorker+Purchases.swift
//  Assesment
//
//  Created by Joseph on 23/01/2022.
//

import Foundation

extension APIWorker {
    static func getPurchases(userId: String, page: Int ,onComplete: @escaping (_ result: NetworkResult<[PurchaseItemProtocol]?>) -> Void) {
        
        let endPoint = APIEndPoint.Purchases.purchases(userId: "U13023932", page: page).endPoint

        APIManager.shared.execute(endPoint) { (result: NetworkResult<[PurchaseItem]>) in
            switch result {
            case .success(let data):
                onComplete(.success(data))
            case .failure(let errorString):
                onComplete(.failure(errorString))
            }
        }
    }
}
