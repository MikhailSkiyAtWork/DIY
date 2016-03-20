//
//  DIYLayout.swift
//  DIY
//
//  Created by Михаил Валуйский on 20.03.16.
//  Copyright © 2016 Razeware LLC. All rights reserved.
//

import UIKit
class DIYLayout : UICollectionViewFlowLayout {
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let insets = collectionView!.contentInset
        let layoutAttributes = super.layoutAttributesForElementsInRect(rect) as [UICollectionViewLayoutAttributes]!
        let offset = collectionView!.contentOffset
        
        let minY = -insets.top
       if (offset.y < minY) {
           let deltaY = fabs(offset.y - minY)
            for attributes in layoutAttributes {
                if let elementKind = attributes.representedElementKind{
                    if elementKind == UICollectionElementKindSectionHeader{
                        var frame = attributes.frame
                        frame.size.height = max(minY, headerReferenceSize.height + deltaY)
                        frame.origin.y = CGRectGetMinY(frame) - deltaY
                        attributes.frame = frame
                    }
                }
                
            }
        }
        
        return layoutAttributes
        
    }
    
    override func shouldInvalidateLayoutForBoundsChange(newBounds: CGRect) -> Bool {
        return true
    }
}
