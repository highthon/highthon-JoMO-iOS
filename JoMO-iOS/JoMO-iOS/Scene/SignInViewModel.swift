//
//  SignInViewModel.swift
//  JoMO-iOS
//
//  Created by 짜미 on 2023/01/14.
//

import Foundation

class SignInViewModel: ObservableObject {
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
}
