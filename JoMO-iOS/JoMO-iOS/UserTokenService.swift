//
//  UserTokenService.swift
//  JoMO-iOS
//
//  Created by 짜미 on 2023/01/15.
//

import Foundation
import Alamofire

class UserTokenService: BaseAlamofireService {
//    func userToken(accessToken: String) async -> Result<UserTokenResponse, AFError> {
//        return await session.request(UserTokenRouter.userToken(access: accessToken))
//            .serializingDecodable(UserTokenResponse.self).result
//    }
    
    func userToken(accessToken: String) async -> Result<UserTokenResponse, AFError> {
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(accessToken)"
        ]
        
        let result = await AF.request("http://172.20.64.116:8080/user/my", method: .get, headers: headers).serializingDecodable(UserTokenResponse.self).result
        
        return result
    }
}
