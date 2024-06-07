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
    private var asiaContentViewModel = AsiaContentViewModel()
    
    override func loadView() {
        view = asiaContentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        
        setDelegate()
        loadView()
        
        asiaContentView.collectionView.frame.size.width = asiaContentView.calculateTotalWidth()
    }

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
        return asiaContentViewModel.numberOfItemsInSection(section: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularSeriesCell.identifier, for: indexPath) as? PopularSeriesCell else { return UICollectionViewCell() }
        let item = asiaContentViewModel.itemAtIndex(indexPath.item)
        cell.dataBind(item)
        return cell
    }
}



