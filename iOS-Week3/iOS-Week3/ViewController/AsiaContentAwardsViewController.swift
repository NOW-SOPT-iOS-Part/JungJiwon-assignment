//
//  AsiaContentAwardsViewController.swift
//  iOS-Week3
//
//  Created by  정지원 on 2024/05/04.
//

import UIKit
import SnapKit

class AsiaContentAwardsViewController: UIViewController {
    
    final let AsiaWidth: CGFloat = 98
    final let AsiaHeight: CGFloat = 170
    final let ItemSpacing: CGFloat = 8
    final let ItemInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)

    private var itemData = AsiaContentAwardsModel.dummy() {
        didSet {
            self.collectionView.reloadData()
        }
    }
    //then을 사용하는 이유가 뭘까? 단지 코드의 길이 줄어들어서 편리함 때문인가?
    private let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .black
        layout.scrollDirection = .horizontal
        return collectionView
    }()
    
    private func calculateTotalWidth() -> CGFloat {
            let count = CGFloat(itemData.count)
            return AsiaWidth * count + ItemSpacing * (count-1)
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        
        setLayout()
        register()
        setDelegate()
        
        collectionView.frame.size.width = calculateTotalWidth()
    }
    
    //VC에 collectionView 추가
    private func setLayout() {
        self.view.addSubview(collectionView)
        let count = CGFloat(itemData.count)
        collectionView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            $0.height.equalTo(AsiaHeight)
            $0.width.equalTo(AsiaWidth * count + ItemSpacing * (count-1))
        }
    }
    
    //사용할 셀 등록
    private func register() {
        collectionView.register(
            AsiaContentAwardsViewCell.self,
            forCellWithReuseIdentifier: AsiaContentAwardsViewCell.identifier
        )
    }
    /* extension에서 셀의 개수와 내용을 지정하기 위해 필요한 코드다.
    delegate는 아이템 개수고, dataSource 아이템 내용이다. */
    private func setDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension AsiaContentAwardsViewController: UICollectionViewDelegateFlowLayout {
    //각 셀의 크기 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: AsiaWidth, height: AsiaHeight)
    }
    //섹션의 가로 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return ItemSpacing
    }
    //섹션의 여백
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return ItemInset
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



