//
//  AsiaContentAwardsModel.swift
//  iOS-Week3
//
//  Created by  정지원 on 2024/05/04.
//

import UIKit

struct AsiaContentAwardsModel {
    let seriesImage: UIImage
    let seriesName: String
}

extension AsiaContentAwardsModel {
    static func dummy() -> [AsiaContentAwardsModel] {
        return [
            AsiaContentAwardsModel(seriesImage: UIImage(named: "poster1")!, seriesName: "슬기로운 의사생활"),
            AsiaContentAwardsModel(seriesImage: UIImage(named: "poster2")!, seriesName: "이상한 변호사 우영우"),
            AsiaContentAwardsModel(seriesImage: UIImage(named: "poster3")!, seriesName: "미스터션사인"),
            AsiaContentAwardsModel(seriesImage: UIImage(named: "poster4")!, seriesName: "스물다섯 스물하나"),
            AsiaContentAwardsModel(seriesImage: UIImage(named: "poster5")!, seriesName: "사랑의 불시착")
        ]
    }
}
