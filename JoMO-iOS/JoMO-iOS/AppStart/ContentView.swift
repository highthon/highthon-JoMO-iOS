//
//  ContentView.swift
//  JoMO-iOS
//
//  Created by 짜미 on 2023/01/14.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()
    
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        VStack {
          switch viewModel.viewMode {
          case .main:
            MainView()
          case .signIn:
            SplashView()
          }
        }
        .onAppear {
          Task {
            await viewModel.checkAuthSession()
          }
        }
        .id(appState.contentViewId)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
