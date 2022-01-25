//
//  UserProfile.swift
//  Assesment
//
//  Created by Joseph on 22/01/2022.
//

import Foundation

protocol UserProfileProtocol {
    var name: String? { get }
    var userName: String? { get }
    var fullName: String? { get }
    var phoneNumber: String? { get }
    var registration: String? { get }
    var image: String? { get }

}

struct UserProfile: Codable, UserProfileProtocol {
    var name, userName, fullName, phoneNumber: String?
    var registration: String?
    var image: String?

    enum CodingKeys: String, CodingKey {
        case name
        case userName = "user_name"
        case fullName = "full_name"
        case phoneNumber = "phone_number"
        case registration, image
    }
}
