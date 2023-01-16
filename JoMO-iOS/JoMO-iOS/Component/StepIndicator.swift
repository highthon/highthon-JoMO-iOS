//
//  StepIndicator.swift
//  JoMO-iOS
//
//  Created by 짜미 on 2023/01/15.
//

import SwiftUI

struct StepIndicator: View {
    var count: Int
    var body: some View {
        HStack {
            Circle()
                .foregroundColor(Color.mainSkyblue)
                .frame(width: 10, height: 10)
            
            HStack(spacing: 0) {
                Text("STEP \(count)")
                    .foregroundColor(.gray5)
                
                Text("/3")
                    .foregroundColor(.gray4)
            }
        }
    }
}

struct StepIndicator_Previews: PreviewProvider {
    static var previews: some View {
        StepIndicator(count: 1)
    }
}
