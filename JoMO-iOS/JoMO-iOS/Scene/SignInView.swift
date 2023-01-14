//
//  SignInView.swift
//  JoMO-iOS
//
//  Created by 짜미 on 2023/01/14.
//

import SwiftUI

struct SignInView: View {
    @StateObject private var viewModel = SignInViewModel()
    
    var body: some View {
        VStack(spacing: 45) {
            Image("JomoYellow")
                .padding(.bottom, 15)
            
            VStack(spacing: 16) {
                TextFieldComponent("아이디", text: $viewModel.id, secure: false)
                
                TextFieldComponent("비밀번호", text: $viewModel.password, secure: true)
            }
            
            PrimaryButton(title: "로그인", color: .mainYellow, enabled: $viewModel.invalidSignIn)
            
            HStack {
                Button("회원가입") {
                    print("회원가입 navigation")
                }
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
