//
//  BoxOfficeService.swift
//  iOS-week4
//
//  Created by  정지원 on 2024/05/10.
//

import Foundation
import Moya

class BoxOfficeService {
    let provider = MoyaProvider<BoxOfficeAPI>()
    
    func getDailyBoxOfficeList(targetDt: String, completion: @escaping ([BoxOfficeModel]?, Error?) -> ()) {
        provider.request(.dailyBoxOfficeList(targetDt: targetDt)) { result in
            switch result {
            case let .success(response):
                do {
                    let movies = try response.map(BoxOfficeResult.self).dailyBoxOfficeList
                    completion(movies, nil)
                } catch let error {
                    completion(nil, error)
                }
            case let .failure(error):
                completion(nil, error)
            }
        }
    }
}

