//
//  ScrollableHorizontalTableView.swift
//  iOS-Week3
//
//  Created by  정지원 on 2024/04/30.
//

import UIKit

class ScrollableHorizontalTableView: UITableView {
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.isScrollEnabled = true
        self.showsHorizontalScrollIndicator = true
        self.separatorStyle = .none
        self.backgroundColor = .clear
        self.rowHeight = UITableView.automaticDimension
        self.estimatedRowHeight = 50
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

