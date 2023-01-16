//
//  TokenUserResponse.swift
//  JoMO-iOS
//
//  Created by 짜미 on 2023/01/15.
//

import Foundation

struct UserTokenResponse: Decodable {
    let status: Int
    let message: String
    let data: UserTokenBody
}

struct UserTokenBody: Decodable {
    let name: String
    let email: String
    let phone: String
    let point: Int
}
