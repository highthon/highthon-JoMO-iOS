//
//  AppState.swift
//  JoMO-iOS
//
//  Created by 짜미 on 2023/01/15.
//

import Foundation

final class AppState: ObservableObject {
    @Published var contentViewId = UUID()
    
    func refreshContentView() {
        DispatchQueue.main.async {
            self.contentViewId = UUID()
        }
    }
}
