//
//  AsiaContentView.swift
//  iOS-Week3
//
//  Created by  정지원 on 6/6/24.
//

import UIKit

import SnapKit

final class AsiaContentView: UIView {
    
    final let AsiaWidth: CGFloat = 98
    final let AsiaHeight: CGFloat = 170
    final let ItemSpacing: CGFloat = 8
    final let ItemInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    
    let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .black
        layout.scrollDirection = .horizontal
        return collectionView
    }()
    
    var itemData = AsiaContentAwardsModel.dummy() {
        didSet {
            collectionView.reloadData()
        }
    }
    
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

extension AsiaContentView {
    
    func calculateTotalWidth() -> CGFloat {
            let count = CGFloat(itemData.count)
            return AsiaWidth * count + ItemSpacing * (count-1)
        }
    
    //VC에 collectionView 추가
    private func setAddSubview() {
        addSubview(collectionView)
    }
    
    private func setupLayout() {
        let count = CGFloat(itemData.count)
        collectionView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(safeAreaLayoutGuide)
            $0.height.equalTo(AsiaHeight)
            $0.width.equalTo(AsiaWidth * count + ItemSpacing * (count-1))
        }
    }
    
    private func register() {
        collectionView.register(
            AsiaContentAwardsViewCell.self,
            forCellWithReuseIdentifier: AsiaContentAwardsViewCell.identifier
        )
    }
}
