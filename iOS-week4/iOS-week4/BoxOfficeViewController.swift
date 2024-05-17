//
//  BoxOfficeViewController.swift
//  iOS-week4
//
//  Created by  정지원 on 2024/05/10.
//

import UIKit
import SnapKit

import UIKit

class BoxOfficeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchDailyBoxOfficeList()
    }

    func fetchDailyBoxOfficeList() {
        let targetDt = "20240509"
        BoxOfficeService.shared.dailyBoxOfficeList(targerDt: targetDt) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                if let boxOfficeResponse = data as? BoxOfficeResponse {
                    // 성공적으로 데이터를 받아온 경우 처리
                    self.handleBoxOfficeResponse(boxOfficeResponse)
                } else {
                    // 받아온 데이터 형식이 올바르지 않은 경우 처리
                    self.showError(message: "Received data is not in expected format.")
                }
            case .requestErr:
                // 요청 에러 처리
                self.showError(message: "Request error occurred.")
            case .decodedErr:
                // 디코딩 에러 처리
                self.showError(message: "Decoding error occurred.")
            case .pathErr:
                // 경로 에러 처리
                self.showError(message: "Path error occurred.")
            case .serverErr:
                // 서버 내부 에러 처리
                self.showError(message: "Server error occurred.")
            case .networkFail:
                // 네트워크 연결 실패 처리
                self.showError(message: "Network connection failed.")
            }
        }
    }

    func handleBoxOfficeResponse(_ response: BoxOfficeResponse) {
        // 받아온 데이터를 활용하여 UI 업데이트 등 필요한 작업 수행
        let dailyBoxOfficeList = response.boxOfficeResult.dailyBoxOfficeList
        // 예시: 받아온 데이터를 테이블 뷰에 표시
        print("Daily Box Office List: \(dailyBoxOfficeList)")
    }

    func showError(message: String) {
        print("Error: \(message)")
    }
}
