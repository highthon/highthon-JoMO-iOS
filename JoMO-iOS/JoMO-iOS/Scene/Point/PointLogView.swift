//
//  PointLogView.swift
//  JoMO-iOS
//
//  Created by 홍태희 on 2023/01/15.
//

import SwiftUI

enum tapInfo : String, CaseIterable {
    case plus = "적립 내역"
    case use = "사용 내역"
}

struct PointLogView: View {
    
    let demoPoint = 61
    
    @State private var selectPick : tapInfo = .plus
    @Namespace private var animation
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    topStacks()
                        .padding(0,0,0,10)
                    myPoints()
                        .padding(40,0,0,0)
                }
                animate()
                Text("90일이 지난 적립 포인트 내역은 사라집니다.")
                    .frame(width: UIScreen.main.bounds.width, height: 40)
                    .background(Color.gray2)
                    .foregroundColor(Color.gray4)
                Spacer()
            }
            .navigationBarTitleDisplayMode(.inline)
            .ignoresSafeArea()
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image("JomoWhite")
                        .resizable()
                        .frame(width : 63, height: 20)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        
                    }, label: {
                        Image("Profiles")
                            .resizable()
                            .frame(width: 28, height: 28)
                    })
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        
                    }, label: {
                        Image("Points")
                            .resizable()
                            .frame(width: 28, height: 28)
                    })
                }
            }
        }
    }
    
    @ViewBuilder
    private func topStacks() -> some View {
        Image("top")
            .resizable()
            .frame(width: .infinity, height: 245)
    }
    
    @ViewBuilder
    private func myPoints() -> some View {
        VStack {
            Text("내 보유 포인트")
                .font(.system(size: 16, weight: .regular))
            Text("\(demoPoint)p")
                .font(.system(size: 24, weight: .bold))
        }
    }
    
    @ViewBuilder
    private func animate() -> some View {
        HStack {
            ForEach(tapInfo.allCases, id: \.self) { item in
                VStack {
                    Text(item.rawValue)
                        .font(.title3)
                        .frame(maxWidth: .infinity, maxHeight: 30)
                        .foregroundColor(selectPick == item ? .black : .gray)

                    if selectPick == item {
                        Capsule()
                            .foregroundColor(.black)
                            .frame(height: 3)
                            .matchedGeometryEffect(id: "info", in: animation)
                    }
                    
                }
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        self.selectPick = item
                    }
                }
            }
        }
        .frame(height: 30)
    }

}

struct PointLogView_Previews: PreviewProvider {
    static var previews: some View {
        PointLogView()
    }
}
