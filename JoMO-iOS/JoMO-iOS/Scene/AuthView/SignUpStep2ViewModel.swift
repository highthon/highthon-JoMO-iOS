//
//  SignUpStep2ViewModel.swift
//  JoMO-iOS
//
//  Created by 짜미 on 2023/01/15.
//

import Foundation

class SignUpStep2ViewModel: ObservableObject {
    @Published var email: String = String()
    @Published var password: String = String()
    @Published var confirmPassword: String = String()
    
    var invalidInput: Bool {
      get {
          let isEmailValid = !email.isEmpty
          let isPasswordValid = !password.isEmpty
          let isConfirmPasswordValid = !confirmPassword.isEmpty
          
          return isEmailValid && isPasswordValid && isConfirmPasswordValid
      }
      set {}
    }
}
