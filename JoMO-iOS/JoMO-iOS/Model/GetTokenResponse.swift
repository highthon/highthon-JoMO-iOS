//
//  GetTokenResponse.swift
//  JoMO-iOS
//
//  Created by 짜미 on 2023/01/15.
//

import Foundation

struct GetTokenResponse: Decodable {
    let status: Int
    let message: String
    let data: GetTokenBody
}

struct GetTokenBody: Decodable {
    let accessToken: String
    let refreshToken: String
}
