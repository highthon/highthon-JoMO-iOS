//
//  SignUpStep2View.swift
//  JoMO-iOS
//
//  Created by 짜미 on 2023/01/15.
//

import SwiftUI

struct SignUpStep2View: View {
    @StateObject private var viewModel = SignUpStep2ViewModel()
    
    @State private var isDuplicateCheck = false
    @State private var isNextPresented = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Spacer()
                
                StepIndicator(count: 2)
            }
            .padding(.top, 100)
            
            HStack(alignment: .top, spacing: 5) {
                Image("JomoYellow")
                    .resizable()
                    .frame(width: 48, height: 15)
                
                Text("가 처음이신가요?")
                    .foregroundColor(.gray4)
                
                Spacer()
            }
            .padding(.top, 60)
            
            Text("이용을 위해\n아이디와 비밀번호를\n입력해주세요.")
                .fontSize(30)
                .bold()
                .multilineTextAlignment(.leading)
            
            VStack(spacing: 16) {
                VStack(alignment: .leading, spacing: 0) {
                    ZStack(alignment: .trailing) {
                        TextFieldComponent("아이디(이메일)", text: $viewModel.email, secure: false)
                            .keyboardType(.emailAddress)
                        
                        PrimaryButton(title: "중복확인", color: .mainYellow) {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                isDuplicateCheck = true
                            }
                        }
                        .frame(width: 100)
                    }
                    
                    if isDuplicateCheck {
                        Text("사용 가능한 아이디입니다.")
                            .foregroundColor(.green)
                            .fontSize(15)
                            .opacity(0.7)
                            .padding(.leading, 10)
                    }
                }
                
                TextFieldComponent("비밀번호", text: $viewModel.password, secure: true)
                    .keyboardType(.numbersAndPunctuation)
                
                TextFieldComponent("비밀번호 확인", text: $viewModel.confirmPassword, secure: true)
                    .keyboardType(.numbersAndPunctuation)
            }
            .padding(.top, 24)
            
            Spacer()
            
            PrimaryButton(title: "다음", color: .mainYellow, enabled: $viewModel.invalidInput) {
                isNextPresented = true
            }
        }
        .padding()
        .background(NavigationLinkEmpty(isActive: $isNextPresented, {
            SignUpStep3View()
                .navigationBarHidden(true)
        }))
    }
}

struct SignUpStep2View_Previews: PreviewProvider {
    static var previews: some View {
        SignUpStep2View()
    }
}
