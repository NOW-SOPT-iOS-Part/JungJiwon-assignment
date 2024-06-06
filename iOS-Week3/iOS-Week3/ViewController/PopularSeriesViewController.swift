//
//  PopularSeriesViewController.swift
//  iOS-Week3
//
//  Created by  정지원 on 2024/05/04.
//

import UIKit
import SnapKit

class PopularSeriesViewController: UIViewController {
    
    private var popularSeriesView = PopularSeriesView()
    
    lazy var itemData = popularSeriesView.itemData //필요할 때까지 선언되지 않도록. lazy를 쓰지 않으면 초기화 전에 불러지므로 오류가 생김.
    
    override func loadView() {
        view = popularSeriesView
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black

        setDelegate()
        loadView()
        
        popularSeriesView.collectionView.frame.size.width = popularSeriesView.calculateTotalWidth()
    }
    
    /* extension에서 셀의 개수와 내용을 지정하기 위해 필요한 코드다.
    delegate는 아이템 개수고, dataSource 아이템 내용이다. */
    private func setDelegate() {
        popularSeriesView.collectionView.delegate = self
        popularSeriesView.collectionView.dataSource = self
    }
    
}

extension PopularSeriesViewController: UICollectionViewDelegateFlowLayout {
    //각 셀의 크기 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: popularSeriesView.PopularWidth, height: popularSeriesView.PopularHeight)
    }
    //섹션의 가로 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return popularSeriesView.ItemSpacing
    }
    //섹션의 여백
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return popularSeriesView.ItemInset
    }
}

extension PopularSeriesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularSeriesCell.identifier, for: indexPath) as? PopularSeriesCell else { return UICollectionViewCell() }
        cell.dataBind(itemData[indexPath.item])
        return cell
    }
}
