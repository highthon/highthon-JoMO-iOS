//
//  SignUpRouter.swift
//  JoMO-iOS
//
//  Created by 짜미 on 2023/01/15.
//

import Foundation
import Alamofire

enum SignUpRouter: URLRequestConvertible {
    case signUp([String: String])

    var method: HTTPMethod {
        switch self {
        case .signUp: return .post
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = URL(string: "http://172.20.64.116:8080/user/join")!
        var request = URLRequest(url: url)
        request.method = method
        switch self {
        case let .signUp(parameters):
            request = try JSONParameterEncoder().encode(parameters, into: request)
            return request
        }
    }
}
