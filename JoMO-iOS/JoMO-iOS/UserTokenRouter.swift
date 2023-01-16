//
//  UserTokenRouter.swift
//  JoMO-iOS
//
//  Created by 짜미 on 2023/01/15.
//

import Foundation
import Alamofire

enum UserTokenRouter: URLRequestConvertible {
    case userToken([String: String], access: String)

    var method: HTTPMethod {
        switch self {
        case .userToken: return .get
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = URL(string: "http://172.20.64.116:8080/user/my")!
        var request = URLRequest(url: url)
        request.method = method
        switch self {
        case let .userToken(parameters, access):
            request.setValue("Bearer \(access)", forHTTPHeaderField: "Authorization")
            request = try JSONParameterEncoder().encode(parameters, into: request)

            return request
        }
    }
}
