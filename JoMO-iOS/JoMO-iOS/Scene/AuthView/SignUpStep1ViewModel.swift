//
//  SignUpStep1ViewModel.swift
//  JoMO-iOS
//
//  Created by 짜미 on 2023/01/15.
//

import Foundation

class SignUpStep1ViewModel: ObservableObject {
    @Published var name: String = String()
    
    var invalidName: Bool {
        get {
            return !name.isEmpty
        }
        set {}
    }
}
