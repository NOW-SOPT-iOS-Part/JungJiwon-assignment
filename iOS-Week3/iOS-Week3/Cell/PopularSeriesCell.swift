//
//  PopularSeriesCellCollectionViewCell.swift
//  iOS-Week3
//
//  Created by  정지원 on 2024/05/04.
//

import UIKit

class PopularSeriesCell: UICollectionViewCell {
    static let identifier = "PopularSeriesCell"
    
    private let seriesImageView = UIImageView()
    
    private let seriesLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Medium", size: 10)
        return label
    }()
    
    @available(*, unavailable)
     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }

     private func setLayout() {
         [seriesLabel, seriesImageView].forEach {contentView.addSubview($0)}

         seriesImageView.snp.makeConstraints {
             $0.top.equalToSuperview()
             $0.width.equalTo(98)
             $0.height.equalTo(146)
         }

         seriesLabel.snp.makeConstraints {
             $0.top.equalTo(seriesImageView.snp.bottom).offset(10)
             $0.leading.equalToSuperview()
         }
     }
 }

extension PopularSeriesCell {
    func dataBind(_ popularData: PopularSeriesModel) {
        seriesImageView.image = popularData.seriesImage
        seriesLabel.text = popularData.seriesName
    }
}

