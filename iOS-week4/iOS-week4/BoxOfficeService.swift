//
//  BoxOfficeService.swift
//  iOS-week4
//
//  Created by  정지원 on 2024/05/10.
//

import Foundation
import Moya
import SWXMLHash

class BoxOfficeService {
    let provider = MoyaProvider<BoxOfficeAPI>()
    
    func getDailyBoxOfficeList(targetDt: String, completion: @escaping (Result<BoxOfficeResult, Error>) -> ()) {
        provider.request(.dailyBoxOfficeList(targetDt: targetDt)) { result in
            switch result {
            case let .success(response):
                do {
                    let data = try response.map(BoxOfficeResult.self)
                    completion(.success(data))
                } catch {
                    completion(.failure(error))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
