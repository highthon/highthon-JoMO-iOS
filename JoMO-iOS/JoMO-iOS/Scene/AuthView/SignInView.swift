//
//  SignInView.swift
//  JoMO-iOS
//
//  Created by 짜미 on 2023/01/14.
//

import SwiftUI

struct SignInView: View {
    @EnvironmentObject var appState: AppState
    
    @StateObject private var viewModel = SignInViewModel()
    
    var body: some View {
        VStack(spacing: 45) {
            Image("JomoYellow")
                .padding(.bottom, 15)
            
            VStack(spacing: 16) {
                TextFieldComponent("아이디(이메일)", text: $viewModel.id, secure: false)
                    .keyboardType(.emailAddress)
                
                TextFieldComponent("비밀번호", text: $viewModel.password, secure: true)
                    .keyboardType(.numbersAndPunctuation)
            }
            
            PrimaryButton(title: "로그인", color: .mainYellow, enabled: $viewModel.invalidSignIn) {
                Task {
                    await viewModel.getToken {
                        appState.refreshContentView()
                    }
                }
            }
            
            HStack {
                NavigationLink("회원가입", destination: {
                    SignUpStep1View()
                        .navigationBarHidden(true)
                })
                .foregroundColor(.gray4)
            }
        }
        .padding()
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
