//
//  User.swift
//  JoMO-iOS
//
//  Created by 짜미 on 2023/01/15.
//

import Foundation

public struct User: Decodable {
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case email = "email"
        case password = "pw"
        case phone = "phone"
        case point = "point"
    }
    
    var name: String?
    var email: String?
    var password: String?
    var phone: String?
    var point: Int?
}
