//
//  APIWorker+UserProfile.swift
//  Assesment
//
//  Created by Joseph on 23/01/2022.
//

import Foundation

extension APIWorker {
 
    static func getUserProfileBy(userId: String, onComplete: @escaping (_ result: NetworkResult<UserProfileProtocol?>) -> Void) {
        
        let endPoint = APIEndPoint.UserProfile.profile(userId: "U13023932").endPoint
        
        APIManager.shared.execute(endPoint) { (result: NetworkResult<UserProfile>) in
            switch result {
            case .success(let data):
                onComplete(.success(data))
            case .failure(let errorString):
                onComplete(.failure(errorString))
            }
        }
    }
}
