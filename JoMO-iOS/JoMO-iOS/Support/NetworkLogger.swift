//
//  NetworkLogger.swift
//  JoMO-iOS
//
//  Created by 짜미 on 2023/01/15.
//

import Foundation
import Alamofire

class NetworkLogger: EventMonitor {
  // Event called when any type of Request is resumed.
  func requestDidResume(_ request: Request) {
    print("Resuming: \(request.cURLDescription())")
  }

  // Event called whenever a DataRequest has parsed a response.
  func request<Value>(_ request: DataRequest, didParseResponse response: DataResponse<Value, AFError>) {
    print("Finished: \(response.debugDescription)")
  }
}
