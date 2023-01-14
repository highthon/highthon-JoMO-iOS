//
//  NavigationLinkComponent.swift
//  JoMO-iOS
//
//  Created by 짜미 on 2022/04/29.
//

import SwiftUI

struct NavigationLinkEmpty<Content>: View where Content: View {
  @Binding var isActive: Bool
  let destination: () -> Content

  init(isActive: Binding<Bool>,
       @ViewBuilder _ destination: @escaping () -> Content)
  {
    _isActive = isActive
    self.destination = destination
  }

  var body: some View {
    NavigationLink(isActive: $isActive) {
      destination()
    } label: {
      EmptyView()
    }
  }
}
