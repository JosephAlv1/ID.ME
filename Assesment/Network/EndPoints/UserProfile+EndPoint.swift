//
//  UserProfile+EndPoint.swift
//  Assesment
//
//  Created by Joseph on 11/01/2022.
//

import Foundation

extension APIEndPoint {
    
    enum UserProfile {
        case profile(userId: String)
        
        var endPoint: Endpoint {
            
            switch self {
            case .profile(let userId):
                return APIEndPoint.init(method: .get, resourcePath: "profile/\(userId)")
            }
        }
    }
    
}
