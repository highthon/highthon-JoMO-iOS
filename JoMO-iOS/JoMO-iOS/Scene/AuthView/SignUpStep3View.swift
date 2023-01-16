//
//  SignUpStep3View.swift
//  JoMO-iOS
//
//  Created by 짜미 on 2023/01/15.
//

import SwiftUI

struct SignUpStep3View: View {
    @StateObject private var ViewModel = SignUpStep3ViewModel()
    
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        BackgroundTapKeyboardDismiss {
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Spacer()
                    
                    StepIndicator(count: 3)
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
                
                Text("이용을 위해\n전화번호를 입력해주세요.")
                    .fontSize(30)
                    .bold()
                    .multilineTextAlignment(.leading)
                
                TextFieldComponent("'-'구분 없이 적어주세요.", text: $ViewModel.phoneNumber, secure: false)
                    .keyboardType(.numberPad)
                
                Spacer()
                
                PrimaryButton(title: "완료", color: .mainYellow, enabled: $ViewModel.invalidPhoneNumber) {
                    print("회원가입 완료")
                    appState.refreshContentView()
                }
            }
            .padding()
            .ignoresSafeArea(.keyboard)
        }
    }
}

struct SignUpStep3View_Previews: PreviewProvider {
    static var previews: some View {
        SignUpStep3View()
    }
}
