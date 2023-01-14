//
//  SplashView.swift
//  JoMO-iOS
//
//  Created by 짜미 on 2023/01/14.
//

import SwiftUI

struct SplashView: View {
    @State private var isSignInPresented = false
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                Image("JomoWhite")
                
                Spacer()
                
                PrimaryButton(title: "로그인", color: .white) {
                    isSignInPresented = true
                }
            }
            .padding()
            .background(Color.mainYellow)
            .background(NavigationLinkEmpty(isActive: $isSignInPresented, {
                SignInView()
                    .navigationBarHidden(true)
            }))
            .navigationBarHidden(true)
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
