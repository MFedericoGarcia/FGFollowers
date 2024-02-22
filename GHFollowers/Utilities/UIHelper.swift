//
//  UIHelper.swift
//  GHFollowers
//
//  Created by Fede Garcia on 08/03/2024.
//

import UIKit

struct UIHelper {
    
    static func createColumnFlowLayout(numberOfColumns: Int, in view: UIView) -> UICollectionViewFlowLayout {
        let columns = CGFloat(numberOfColumns - 1)
        let width = view.bounds.width
        let padding: CGFloat = 12
        let minimumItemSpacing: CGFloat = 10
        let availableWidth = width - (padding * columns) - (minimumItemSpacing * columns)
        let itemWidth = availableWidth / (columns + 1)
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 40)
        
        return flowLayout
    }
}
