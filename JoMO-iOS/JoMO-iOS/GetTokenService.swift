//
//  GetTokenService.swift
//  JoMO-iOS
//
//  Created by 짜미 on 2023/01/15.
//

import Foundation
import Alamofire

class GetTokenService: BaseAlamofireService {
    func getToken(email: String, pw: String) async -> Result<GetTokenResponse, AFError> {
        let parameter: [String: String] = [
            "email": "\(email)",
            "pw": "\(pw)"
        ]
        
        return await session.request(GetTokenRouter.getToken(parameter))
            .serializingDecodable(GetTokenResponse.self).result
    }
}
