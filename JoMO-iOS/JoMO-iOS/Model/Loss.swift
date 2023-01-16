//
//  loss.swift
//  JoMO-iOS
//
//  Created by 짜미 on 2023/01/15.
//

import Foundation

struct Loss {
    let title: String
    let price: String
    let category: String
    let reason: String
}

public class LossData {
    public static let shared = LossData()
    
    var data: [Loss] = []
}
