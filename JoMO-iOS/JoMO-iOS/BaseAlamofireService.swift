//
//  BaseAlamofireService.swift
//  JoMO-iOS
//
//  Created by 짜미 on 2023/01/15.
//

import Foundation
import Alamofire

class BaseAlamofireService {
  let session = Session(eventMonitors: [NetworkLogger()])
}
