//
//  SignUpService.swift
//  JoMO-iOS
//
//  Created by 짜미 on 2023/01/15.
//

import Foundation
import Alamofire

class SignUpService: BaseAlamofireService {
    func signUp(name: String, email: String, pw: String, phone: String) async -> Result<SignUpResponse, AFError> {
        let parameter: [String: String] = [
            "name": "\(name)",
            "email": "\(email)",
            "pw": "\(pw)",
            "phone": "\(phone)"
        ]
        
        return await session.request(SignUpRouter.signUp(parameter))
            .serializingDecodable(SignUpResponse.self).result
    }
}
