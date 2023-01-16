//
//  SignUpStep1View.swift
//  JoMO-iOS
//
//  Created by 짜미 on 2023/01/15.
//

import SwiftUI

struct SignUpStep1View: View {
    @StateObject private var viewModel = SignUpStep1ViewModel()
    
    @State private var isNextPresented = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Spacer()
                
                StepIndicator(count: 1)
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
            
            Text("이용을 위해\n이름을 입력해주세요.")
                .fontSize(30)
                .bold()
                .multilineTextAlignment(.leading)
                
            
            TextFieldComponent("이름(2-8자)", text: $viewModel.name, secure: false)
                .padding(.top, 60)
            
            Spacer()
            
            PrimaryButton(title: "다음", color: .mainYellow, enabled: $viewModel.invalidName) {
                isNextPresented = true
            }
        }
        .padding()
        .ignoresSafeArea(.keyboard)
        .background(NavigationLinkEmpty(isActive: $isNextPresented, {
            SignUpStep2View()
                .navigationBarHidden(true)
        }))
    }
}

struct SignUpStep1View_Previews: PreviewProvider {
    static var previews: some View {
        SignUpStep1View()
    }
}
