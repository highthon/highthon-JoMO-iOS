//
//  GetTokenRouter.swift
//  JoMO-iOS
//
//  Created by 짜미 on 2023/01/15.
//

import Foundation
import Alamofire

enum GetTokenRouter: URLRequestConvertible {
    case getToken([String: String])
    
    var method: HTTPMethod {
        switch self {
        case .getToken: return .post
        }
        
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = URL(string: "http://172.20.64.116:8080/auth/login")!
        var request = URLRequest(url: url)
        request.method = method
        
        switch self {
        case let .getToken(parameters):
            request = try JSONParameterEncoder().encode(parameters, into: request)
            return request
        }
    }
}
