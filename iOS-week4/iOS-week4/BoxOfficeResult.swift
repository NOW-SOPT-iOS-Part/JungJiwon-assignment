//
//  BoxOfficeResult.swift
//  iOS-week4
//
//  Created by  정지원 on 2024/05/10.
//

import Foundation
import SWXMLHash

struct BoxOfficeResult: Codable {
    let boxOfficeType: String
    let showRange: String
    let dailyBoxOfficeList: [BoxOfficeModel]
}

