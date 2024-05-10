//
//  BoxOfficeModel.swift
//  iOS-week4
//
//  Created by  정지원 on 2024/05/10.
//

import Foundation
import SWXMLHash

struct BoxOfficeModel: Codable {
    let rnum: Int
    let rank: Int
    let rankInten: Int
    let rankOldAndNew: String
    let movieCd: Int
    let movieNm: String
    let openDt: String
    let salesAmt: Int
    let salesShare: Double
    let salesInten: Int
    let salesChange: Double
    let salesAcc: Int
    let audiCnt: Int
    let audiInten: Int
    let audiChange: Double
    let audiAcc: Int
    let scrnCnt: Int
    let showCnt: Int
}

