//
//  FormViewModel.swift
//  JoMO-iOS
//
//  Created by 홍태희 on 2023/01/15.
//

import Foundation

class FormViewModel : ObservableObject {
    @Published var reasons : String = ""
    @Published var price : String = ""
    
    var invalidReasons: Bool {
        get {
            let resonsInvalied = !reasons.isEmpty
            let moneyInvalied = !price.isEmpty
            return resonsInvalied && moneyInvalied
            
        }
        set {}
    }
}
