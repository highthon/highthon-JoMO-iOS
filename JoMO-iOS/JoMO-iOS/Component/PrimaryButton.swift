//
//  PrimaryButton.swift
//  JoMO-iOS
//
//  Created by 짜미 on 2023/01/14.
//

import SwiftUI

struct PrimaryButton: View {
    var title: String
    var color: Color
    var action: (() -> Void)?
    @Binding var enabled: Bool
    
    init(title: String, color: Color, action: (() -> Void)? = nil, enabled: Binding<Bool> = .constant(true)) {
        self.title = title
        self.color = color
        self.action = action
        self._enabled = enabled
    }
    
    var body: some View {
        Button {
            action?()
        } label: {
            Text(title)
                .foregroundColor(enabled ? .black : .gray4)
                .fillWidth()
                .padding()
                .background(color)
                .opacity(enabled ? 1 : 0.7)
                .cornerRadius(12)
        }
        .disabled(!enabled)
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(title: "버튼", color: .gray2, enabled: .constant(false))
    }
}
