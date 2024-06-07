//
//  AsiaContentViewModel.swift
//  iOS-Week3
//
//  Created by  정지원 on 6/7/24.
//
import UIKit

class AsiaContentViewModel {
    
    // 컬렉션 뷰에 표시될 요소들
    var itemData: [PopularSeriesModel] = [] {
        didSet {
            self.reloadCollectionView?()
        }
    }
    
    // 콜백을 통해 뷰에 데이터 변경을 알리고 UI를 업데이트함
    var reloadCollectionView: (() -> Void)?
    
    init() {
        loadItems()
    }
    
    func loadItems() {
        // 데이터를 로드함
        itemData = PopularSeriesModel.dummy()
    }
    
    func numberOfItemsInSection(section: Int) -> Int {
        return itemData.count
    }
    
    func itemAtIndex(_ index: Int) -> PopularSeriesModel {
        return itemData[index]
    }
}
