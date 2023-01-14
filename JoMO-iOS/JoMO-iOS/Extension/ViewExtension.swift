//
//  ViewExtension.swift
//  JoMO-iOS
//
//  Created by 짜미 on 2022/04/12.
//

import SwiftUI

extension View {
  func padding(_ top: CGFloat, _ leading: CGFloat, _ trailing: CGFloat, _ bottom: CGFloat) -> some View {
    modifier(PaddingModifier(top: top, leading: leading, trailing: trailing, bottom: bottom))
  }

  func fillWidth() -> some View {
    modifier(FillWidthModifier(alignment: .center))
  }

  func fillWidth(_ textAlignment: TextAlignment) -> some View {
    modifier(FillWidthTextModifier(textAlign: textAlignment))
  }

  func fillHeight() -> some View {
    modifier(FillHeightModifier())
  }

  /// margin: 뷰를 스크린 가운데에 배치했을 때, 뷰 (왼/오)가장자리와 스크린 (왼/오)가장자리 사이의 간격.
  /// screenWidthMargin(7) = 스크린 너비가 414일 때, 뷰 너비는 400(414 - 7*2)으로 설정된다
  func screenWidthMargin(_ margin: CGFloat) -> some View {
    modifier(ScreenWidthModifier(horizontalMargin: margin))
  }

  func fontSize(_ size: CGFloat) -> some View {
    modifier(FontSizeModifier(size: size))
  }

  func hideKeyboard() {
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
  }

  /// 사용 예시: .cornerRadius(15, corners: [.topLeft, .topRight])
  func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
    clipShape(RoundedCorner(radius: radius, corners: corners))
  }

  func onLoad(perform action: (() -> Void)? = nil) -> some View {
    modifier(ViewDidLoadModifier(perform: action))
  }
  
  /// Present toast
  func showToast<T: View>(showToast: Binding<Bool>, content: T) -> some View {
    modifier(ToastModifier(showToast: showToast, content: content))
  }
}
