//
//  FormView.swift
//  JoMO-iOS
//
//  Created by 홍태희 on 2023/01/15.
//

import SwiftUI

struct FormView: View {
    @Environment(\.dismiss) var dismiss
    
    @StateObject private var viewModel = FormViewModel()
        
    @State var categories = ""
    @State var demoCate = ["유행비용", "전자제품", "화장품/이너", "외식/배달", "시발비용", "의류/신발", "인테리어/가구"]
    let demoMoney = 30000
    
    var body: some View {
        VStack {
            chooseForm()
            allMoney()
            successBtn()
        }
    }
    
    @ViewBuilder
    private func chooseForm() -> some View {
        BackgroundTapKeyboardDismiss {
        VStack(alignment: .leading) {
            Text("소비 카테고리는")
                .font(.system(size: 20, weight: .bold))
                .padding(10,30,30,10)
            Picker(categories, selection: $categories) {
                ForEach($demoCate, id: \.self) { $item in
                    Button {
                        categories = item
                    } label: {
                        Text("\(item)")
                            .foregroundColor(.black)
                    }
                }
            }
            .foregroundColor(.black)
            .frame(width: 320, height: 76)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.gray, lineWidth: 1)
            )
            .padding(10,30,30,30)
            
            Text("소비 이유는")
                .padding(10,30,30,10)
                .font(.system(size: 20, weight: .bold))
            TextFieldComponent("~~를 하기 위해서", text: $viewModel.reasons, secure: false)
                .padding(10,30,30,40)
        }
    }
    }
    
    @ViewBuilder
    private func allMoney() -> some View {
        HStack {
            Text("소비 금액은")
                .font(.system(size: 20, weight: .medium))
            
            ZStack(alignment: .bottom) {
                Rectangle()
                    .foregroundColor(Color.mainYellow)
                
                TextField("금액입력", text: $viewModel.price)
                    .font(.system(size: 24, weight: .bold))
                    .keyboardType(.numberPad)
            }
            .frame(width: 100, height: 10)
            
            Text("원")
                .font(.system(size: 20, weight: .medium))
        }.padding(20,0,0,75)
    }
    
    @ViewBuilder
    private func successBtn() -> some View {
        PrimaryButton(title: "입력완료", color: .mainYellow, enabled: $viewModel.invalidReasons) {
            LossData.shared.data.append(Loss(title: "애플팬슬", price: "140,000", category: "전자제품", reason: "그림을 그리고 싶어서"))
            dismiss()
        }.padding(0,30,30,0)
    }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView()
    }
}
