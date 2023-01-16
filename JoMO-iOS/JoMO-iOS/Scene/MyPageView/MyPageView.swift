//
//  MyPageView.swift
//  JoMO-iOS
//
//  Created by 홍태희 on 2023/01/15.
//

import SwiftUI

struct MyPageView: View {
    let demoName = "최정현님"
    
    var body: some View {
            VStack {
                ZStack(alignment: .bottom) {
                    topStacks()
                        .padding(.bottom, 100)
                    customList1()
                        .padding(.bottom, 15)
                        .shadow(radius: 15)
                        
                        
                }
                customList2()
                    .padding(.bottom, 15)
                    .shadow(radius: 15)
                
                Spacer()
            }
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
    
    @ViewBuilder
    private func topStacks() -> some View {
        ZStack {
            Image("top")
                .resizable()
                .frame(width: .infinity, height: 245, alignment: .top)
            VStack {
                Button(action: {
                    
                }, label: {
                    Image("Profile")
                        .resizable()
                        .frame(width: 48, height: 48)
                        .padding(50,0,0,10)
                })
                
                Button(action: {
                    
                }, label: {
                    Button(action: {
                        
                    }, label: {
                        Text("\(demoName) >")
                            .foregroundColor(Color.black)
                    })
                })
            }
        }
    }
    
    @ViewBuilder
    private func customList1() -> some View {
        VStack(alignment: .leading) {
            Button(action: {
                
            }, label: {
                HStack {
                    Image("MyPoint")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding(20,20,20,10)
                    Text("내 조모포인트 확인하기")
                        .foregroundColor(.black)
                        .padding(20,0,0,10)
                }
            })
            
            Divider()
            
            Button(action: {
                
            }, label: {
                HStack {
                    Image("UsePoint")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding(20,20,20,10)
                    Text("내 포인트 사용 내역")
                        .foregroundColor(.black)
                        .padding(20,0,0,20)
                }
            })
        }
        .frame(width: 343, height: 116)
        .background(Color.white)
        .overlay(
            RoundedRectangle(cornerRadius: 5)
            .stroke(Color.white, lineWidth: 2)
        )
    }
    
    @ViewBuilder
    private func customList2() -> some View {
        VStack(alignment: .leading) {
            Button(action: {
                
            }, label: {
                HStack {
                    Image("Fix")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding(20,20,20,10)
                    Text("계정 설정")
                        .foregroundColor(.black)
                        .padding(20,0,0,10)
                }
            })
            
            Divider()
            
            Button(action: {
                
            }, label: {
                HStack {
                    Image("StaffCall")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding(20,20,20,10)
                    Text("문의하기")
                        .foregroundColor(.black)
                        .padding(20,0,0,20)
                }
            })
        }
        .frame(width: 343, height: 116)
        .background(Color.white)
        .overlay(
            RoundedRectangle(cornerRadius: 5)
            .stroke(Color.white, lineWidth: 2)
        )
    }
}

struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageView()
    }
}
