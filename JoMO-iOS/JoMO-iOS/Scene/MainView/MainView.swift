//
//  MainView.swift
//  JoMO-iOS
//
//  Created by 짜미 on 2023/01/14.
//

import SwiftUI

struct MainView: View {
    @StateObject private var viewModel = MainViewModel()
    
    @State private var ispresented = false
    @State private var isProfilePresented = false
    @State private var isPointsPresented = false
    
    let demoName = "최정현"
    
    var body: some View {
        NavigationView {
            VStack {
                if $viewModel.data.isEmpty {
                    ZStack(alignment: .topLeading) {
                        Image("Money")
                            .resizable()
                            .frame(width: 329, height: 206)
                        titles()
                    }.padding(200,30,0,100)
                    makes()
                        .padding(0,10,10,20)
                    formBtn()
                } else {
                    ZStack(alignment: .topLeading) {
                        Image("Chicken")
                            .resizable()
                            .frame(width: 329, height: 206)
                        validTitles()
                    }.padding(200,30,0,0)
                    makes()
                        .padding(0,10,10,20)
                    formBtn()
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image("JomoYellow")
                        .resizable()
                        .frame(width : 63, height: 20)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isProfilePresented = true
                    }, label: {
                        Image("Profiles")
                            .resizable()
                            .frame(width: 28, height: 28)
                    })
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isPointsPresented = true
                    }, label: {
                        Image("Points")
                            .resizable()
                            .frame(width: 28, height: 28)
                    })
                }
            }
            .background(NavigationLinkEmpty(isActive: $isProfilePresented, {
                MyPageView()
                    .navigationBarHidden(true)
            }))
        }
    }
    
    @ViewBuilder
    private func validTitles() -> some View {
        VStack(alignment: .leading) {
            Text("\(demoName)님,")
                .bold()
                
            Text("오늘의 소비가")
                .bold()
            ZStack(alignment: .bottomLeading) {
                Rectangle()
                    .foregroundColor(Color.mainYellow)
                    .frame(width: 120, height: 20)
                    .padding(.leading, 30)
                Text("총 140,000원이 입력되었어요!")
                    .bold()
            }
            
            Text("후라이드 치킨 7마리를\n먹을 수 있는 돈이네요! ")
                .frame(height: 50)
                .fontSize(15)
                .foregroundColor(.gray5)
                .padding(.bottom, 100)
        }.font(.title)
    }
    
    @ViewBuilder
    private func titles() -> some View {
        VStack(alignment: .leading) {
            Text("\(demoName)님,")
                .bold()
            ZStack(alignment: .bottom) {
                Rectangle()
                    .fill(Color.mainYellow)
                    .frame(width: 150, height: 10)
                Text("오늘의 소비가")
                    .bold()
            }
            Text("입력되어 있지 않아요!")
                .bold()
        }.font(.title)

    }
    
    @ViewBuilder
    private func makes() -> some View {
        VStack(alignment: .center) {
            Text("아래를 눌러")
            Text("오늘의 소비를 입력해보세요")
        }.foregroundColor(Color.gray4)
    }
    
    @ViewBuilder
    private func formBtn() -> some View {
        Button {
            ispresented = true
        } label: {
            ZStack {
                Circle()
                    .fill(Color.mainSkyblue)
                    .frame(width: 65, height: 65)
                Image(systemName: "plus")
                    .foregroundColor(Color.gray5)
            }
        }
        .sheet(isPresented: $ispresented, onDismiss: {
            viewModel.data = LossData.shared.data
        }) {
            FormView()
                .presentationDetents([.height(560)])
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
