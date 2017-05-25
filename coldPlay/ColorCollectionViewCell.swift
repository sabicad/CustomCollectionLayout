//
//  ColorCollectionViewCell.swift
//  coldPlay
//
//  Created by Yuriy Holovatskyi on 25.05.17.
//  Copyright © 2017 ThinkMobiles. All rights reserved.
//

import Foundation
import UIKit

class ColorCollectionViewCell:UICollectionViewCell {
    @IBOutlet weak var insideView: UIView!
    
    public var colorBack: UIColor? {
        didSet {
            insideView.backgroundColor = colorBack
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        backgroundColor = nil
        colorBack = nil
    }
}
