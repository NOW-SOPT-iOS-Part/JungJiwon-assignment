//
//  PopularSeriesView.swift
//  iOS-Week3
//
//  Created by  정지원 on 6/6/24.
//

import UIKit

import SnapKit

final class PopularSeriesView: UIView {
    final let PopularWidth: CGFloat = 98
    final let PopularHeight: CGFloat = 170
    final let ItemSpacing: CGFloat = 8
    final let ItemInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    
    //Q. 얘를 VM으로 빼야하는데..setuplayout에서 itemdata.count를 이용하고 있어서 어떻게 해야할 지 모르겠음
    var itemData = PopularSeriesModel.dummy() {
        didSet {
            collectionView.reloadData()
        }
    }
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .black
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setAddSubview()
        setupLayout()
        register()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension PopularSeriesView {
    func calculateTotalWidth() -> CGFloat {
            let count = CGFloat(itemData.count)
            return PopularWidth * count + ItemSpacing * (count-1)
        }
    
    //VC에 collectionView 추가
    private func setAddSubview() {
        addSubview(collectionView)
    }
    
    private func setupLayout() {
        let count = CGFloat(itemData.count)
        collectionView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(safeAreaLayoutGuide)
            $0.height.equalTo(PopularHeight)
            $0.width.equalTo(PopularWidth * count + ItemSpacing * (count-1))
        }
    }
    
    //사용할 셀 등록
    private func register() {
        collectionView.register(
            PopularSeriesCell.self,
            forCellWithReuseIdentifier: PopularSeriesCell.identifier
        )
    }
}
