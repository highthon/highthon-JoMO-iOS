//
//  BackgroundTapKeyboardDismiss.swift
//  JoMO-iOS
//
//  Created by 짜미 on 2023/01/15.
//

import SwiftUI

struct BackgroundTapKeyboardDismiss<Content: View>: View {
  private var content: Content
  
  init(@ViewBuilder content: @escaping () -> Content) {
    self.content = content()
  }
  
  var body: some View {
    Color.background
      .overlay(content)
      .onTapGesture {
        UIApplication.shared.endEditing()
      }
  }
}
