//
//  PopularSeriesModel.swift
//  iOS-Week3
//
//  Created by  정지원 on 2024/05/04.
//

import UIKit

struct PopularSeriesModel {
    let seriesImage: UIImage
    let seriesName: String
}

extension PopularSeriesModel {
    static func dummy() -> [PopularSeriesModel] {
        return [
            PopularSeriesModel(seriesImage: UIImage(named: "SignalImage")!, seriesName: "시그널"),
            PopularSeriesModel(seriesImage: UIImage(named: "HarryImage")!, seriesName: "해리포터와 마법사의 돌"),
            PopularSeriesModel(seriesImage: UIImage(named: "LordOfRingImage")!, seriesName: "반지의 제왕"),
            PopularSeriesModel(seriesImage: UIImage(named: "SuzumeImage")!, seriesName: "스즈메의 문단속")
        ]
    }
}
