//
//  SignInViewModel.swift
//  JoMO-iOS
//
//  Created by 짜미 on 2023/01/14.
//

import Foundation

class SignInViewModel: ObservableObject {
    let getTokenService = GetTokenService()
    let userTokenService = UserTokenService()
    
    @Published var id: String = String()
    @Published var password: String = String()
    
    var invalidSignIn: Bool {
      get {
          let isIdValid = !id.isEmpty
          let isPasswordValid = !password.isEmpty
          
          return isIdValid && isPasswordValid
      }
      set {}
    }
    
    func getToken(_ completion: @escaping (() -> Void)) async {
        let result = await getTokenService.getToken(email: id, pw: password)
        
        switch result {
        case .success(let data):
            print(data.data.accessToken)
            UserDefaults.standard.set(data.data.accessToken, forKey: "accessToken8")
            await getUser(token: data.data.accessToken) {
                completion()
            }
        case .failure(let error):
            print(error)
        }
    }
    
    func getUser(token: String, _ completion: @escaping (() -> Void)) async {
        let result = await userTokenService.userToken(accessToken: token)
        
        switch result {
        case .success(let data):
            print(data.data)
            completion()
        case .failure(let error):
            print(error)
        }
    }
}
