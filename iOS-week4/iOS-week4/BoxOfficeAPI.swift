//
//  BoxOfficeAPI.swift
//  iOS-week4
//
//  Created by  정지원 on 2024/05/10.
//

import Foundation
import Moya

enum BoxOfficeAPI {
    case dailyBoxOfficeList(targetDt: String)
}

extension BoxOfficeAPI: TargetType {
    var baseURL: URL {
        return Key.Plist.baseURL
        }
    
    var path: String {
        switch self {
        case .dailyBoxOfficeList:
            return "/searchDailyBoxOfficeList.json"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Task {
        switch self {
        case .dailyBoxOfficeList(let targetDt):
            return .requestParameters(parameters: ["key": "f5eef3421c602c6cb7ea224104795888", "targetDt": targetDt], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
}
