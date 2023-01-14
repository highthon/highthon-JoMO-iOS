//
//  TextFieldComponent.swift
//  JoMO-iOS
//
//  Created by 짜미 on 2023/01/14.
//

import SwiftUI

struct TextFieldComponent: View {
    init(_ placeholder: String, text: Binding<String>, secure: Bool) {
        self.placeholder = placeholder
        self._text = text
        self.secure = secure
    }
    
    var placeholder: String
    var secure: Bool
    @Binding var text: String
    
    
    var body: some View {
        if secure {
            SecureField(placeholder, text: $text)
                .padding(15, 20, 20, 15)
                .background(Color.gray1)
                .cornerRadius(12)
        } else {
            TextField(placeholder, text: $text)
                .padding(15, 20, 20, 15)
                .background(Color.gray1)
                .cornerRadius(12)
        }
    }
}

struct TextFieldComponent_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldComponent("아이디", text: .constant(""), secure: false)
    }
}
