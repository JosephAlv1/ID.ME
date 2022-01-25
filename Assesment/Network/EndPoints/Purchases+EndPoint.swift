//
//  Purchases+EndPoint.swift
//  Assesment
//
//  Created by Joseph on 23/01/2022.
//

import Foundation

extension APIEndPoint {
    
    enum Purchases {
        
        case purchases(userId: String, page: Int)
        
        var endPoint: Endpoint {
            
            switch self {
            case .purchases(let userId, let page):
                return APIEndPoint.init(method: .get, resourcePath: "purchases/\(userId)", parameters: ["page": page])
            }
        }
    }
    
}
