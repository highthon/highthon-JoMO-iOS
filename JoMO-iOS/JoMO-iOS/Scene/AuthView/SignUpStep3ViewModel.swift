//
//  SignUpStep3ViewModel.swift
//  JoMO-iOS
//
//  Created by 짜미 on 2023/01/15.
//

import Foundation

class SignUpStep3ViewModel: ObservableObject {
    @Published var phoneNumber: String = String()
    
    var invalidPhoneNumber: Bool {
        get {
            return !phoneNumber.isEmpty
        }
        set {}
    }
}
