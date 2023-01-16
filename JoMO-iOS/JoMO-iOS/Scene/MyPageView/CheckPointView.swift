//
//  CheckPointView.swift
//  JoMO-iOS
//
//  Created by 홍태희 on 2023/01/15.
//

import SwiftUI

struct CheckPointView: View {
    let demoPoint = 61
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack(alignment: .bottom) {
                    topStacks()
                        .padding(.bottom, 160)
                    MyPoints()
                }
                
                Spacer()
                
                GoPointShop()
                    .padding(0,0,0,180)
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
        ZStack {
            Image("top")
                .resizable()
                .frame(width: .infinity, height: 245, alignment: .top)
        }
    }
    
    @ViewBuilder
    private func MyPoints() -> some View {
        ZStack {
            Rectangle()
                .fill(Color.white)
                .frame(width: 343, height: 237)
            VStack {
                Text("포모님의")
                    .font(.system(size: 16, weight: .regular))
                Text("조모포인트는")
                    .font(.system(size: 16, weight: .regular))
                    .padding(0,0,0,10)
                Text("\(demoPoint)p")
                    .font(.system(size: 48, weight: .bold))
            }
        }
    }
    
    @ViewBuilder
    private func GoPointShop() -> some View {
        VStack {
            Text("조모포인트는")
            Text("포인트 상점에서 이용가능해요!")

            Button(action: {
                
            }, label: {
                Text("바로가기")
                    .foregroundColor(Color.black)
                    .frame(width: 91, height: 34)
                    .background(Color.mainYellow)
                    .padding(40,0,0,0)
            })
        }
    }
}

struct CheckPointView_Previews: PreviewProvider {
    static var previews: some View {
        CheckPointView()
    }
}
