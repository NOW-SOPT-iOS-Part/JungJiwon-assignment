//
//  BoxOfficeViewController.swift
//  iOS-week4
//
//  Created by  정지원 on 2024/05/10.
//

import UIKit


class BoxOfficeViewController: UIViewController {

    let service = BoxOfficeService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        service.getDailyBoxOfficeList(targetDt: "20240509") { result in
            switch result {
            case .success(let boxOfficeResult):
                for movie in boxOfficeResult.dailyBoxOfficeList {
                    print("Rank: \(movie.rank), Title: \(movie.movieNm), Open Date: \(movie.openDt)")
                }
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}
