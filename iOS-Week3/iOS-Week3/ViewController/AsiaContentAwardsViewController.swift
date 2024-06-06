//
//  AsiaContentAwardsViewController.swift
//  iOS-Week3
//
//  Created by  정지원 on 2024/05/04.
//

import UIKit
import SnapKit

final class AsiaContentAwardsViewController: UIViewController {
    
    private var asiaContentView = AsiaContentView()
    
    lazy var itemData = asiaContentView.itemData
    override func loadView() {
        view = asiaContentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        
        setDelegate()
        
        asiaContentView.collectionView.frame.size.width = asiaContentView.calculateTotalWidth()
    }
    
    /* extension에서 셀의 개수와 내용을 지정하기 위해 필요한 코드다.
    delegate는 아이템 개수고, dataSource 아이템 내용이다. */
    private func setDelegate() {
        asiaContentView.collectionView.delegate = self
        asiaContentView.collectionView.dataSource = self
    }
}

extension AsiaContentAwardsViewController: UICollectionViewDelegateFlowLayout {
    //각 셀의 크기 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: asiaContentView.AsiaWidth, height: asiaContentView.AsiaHeight)
    }
    //섹션의 가로 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return asiaContentView.ItemSpacing
    }
    //섹션의 여백
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return asiaContentView.ItemInset
    }
}

extension AsiaContentAwardsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AsiaContentAwardsViewCell.identifier, for: indexPath) as? AsiaContentAwardsViewCell else { return UICollectionViewCell() }
        cell.dataBind(itemData[indexPath.item])
        return cell
    }
}



