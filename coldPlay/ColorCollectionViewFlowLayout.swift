//
//  ColorCollectionViewFlowLayout.swift
//  coldPlay
//
//  Created by Yuriy Holovatskyi on 25.05.17.
//  Copyright © 2017 ThinkMobiles. All rights reserved.
//

import UIKit

class ColorCollectionViewFlowLayout: UICollectionViewFlowLayout {
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let originalAttributes = super.layoutAttributesForElements(in: rect) else {
            return nil
        }
        
        guard let baseAttributes = NSArray.init(array: originalAttributes, copyItems: true) as? [UICollectionViewLayoutAttributes] else {
            return nil
        }
        
        if (baseAttributes.count > 0) {
            var attributesForElementsInRow:[UICollectionViewLayoutAttributes] = []
            
            let attribute = baseAttributes.first!
            
            attributesForElementsInRow.append(attribute)
            
            var previousYPosition = attribute.frame.maxY
            
            for i in 1..<baseAttributes.count {
                let currentAttribute = baseAttributes[i]
                
                let currentYPosition = currentAttribute.frame.maxY
                
                if fabs(previousYPosition - currentYPosition) < 2.0 {
                    attributesForElementsInRow.append(currentAttribute)
                } else {
                    realignElementsInRowWithAttributes(attributes: attributesForElementsInRow)
                    attributesForElementsInRow.removeAll()
                    attributesForElementsInRow.append(baseAttributes[i])
                }
                
                previousYPosition = currentYPosition
            }
            
            return baseAttributes
        }
        
        return nil
    }
    
    fileprivate func realignElementsInRowWithAttributes(attributes: [UICollectionViewLayoutAttributes]) {
        minimumInteritemSpacing = 0
        minimumLineSpacing = 0
        
        var freeSpace = collectionView!.frame.width
        
        for elementAttributes in attributes {
            freeSpace -= elementAttributes.frame.width
        }
        
        let leftMargin = (freeSpace - minimumInteritemSpacing * (CGFloat)(attributes.count - 1)) / 2.0
                
        guard let firstAttribute = attributes.first else {
            return
        }
        
        var leftmostElementFrame = firstAttribute.frame
        leftmostElementFrame.origin.x = leftMargin
        attributes.first?.frame = leftmostElementFrame

        for i in 1..<attributes.count {
            leftmostElementFrame = attributes[i].frame
            leftmostElementFrame.origin.x = attributes[i - 1].frame.maxX + self.minimumInteritemSpacing
            attributes[i].frame = leftmostElementFrame
        }
    }
}
