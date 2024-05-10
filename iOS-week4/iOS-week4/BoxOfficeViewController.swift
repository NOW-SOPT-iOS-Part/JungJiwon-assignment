//
//  BoxOfficeViewController.swift
//  iOS-week4
//
//  Created by  정지원 on 2024/05/10.
//

import UIKit

class BoxOfficeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let service = BoxOfficeService()
        
        service.getDailyBoxOfficeList(targetDt: "20240509") { movies, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            } else if let movies = movies {
                for movie in movies {
                    print("Rank: \(movie.rank), Title: \(movie.movieNm), Open Date: \(movie.openDt)")
                }
            }
        }
    }
}

