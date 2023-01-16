//
//  ContentViewModel.swift
//  JoMO-iOS
//
//  Created by 짜미 on 2023/01/15.
//

import Foundation

class ContentViewModel: ObservableObject {
    enum ViewMode {
      case signIn
      case main
    }
    
    let userTokenService = UserTokenService()
    
    @Published var isValidAuthSession: Bool = false
    
    var viewMode: ViewMode {
        if isValidAuthSession {
            return .main
        } else {
            return .signIn
        }
    }
    
    func checkAuthSession() async {
        let token = UserDefaults.standard.string(forKey: "accessToken8") ?? ""
        
        let result = await userTokenService.userToken(accessToken: token)
        
        switch result {
        case .success(let data):
            print(data.data)
            DispatchQueue.main.async {
                self.isValidAuthSession = true
            }
        case .failure(let error):
            print(error)
            DispatchQueue.main.async {
                self.isValidAuthSession = false
            }
        }
    }
}
