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
    private var popularViewModel = PopularSeriesViewModel()
    
    override func loadView() {
        view = popularSeriesView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        
        setDelegate()
        loadView()
        
        //클로저를 통해 ViewModel에서 데이터가 변경될 때마다 컬렉션 뷰를 새로고침함.
        popularViewModel.reloadCollectionView = { [weak self] in
            self?.popularSeriesView.collectionView.reloadData()
        }
        
        
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
        return popularViewModel.numberOfItemsInSection(section: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularSeriesCell.identifier, for: indexPath) as? PopularSeriesCell else { return UICollectionViewCell() }
        let item = popularViewModel.itemAtIndex(indexPath.item)
        cell.dataBind(item)
        return cell
    }
}
