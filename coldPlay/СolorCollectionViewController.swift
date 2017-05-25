//
//  СolorCollectionViewController.swift
//  coldPlay
//
//  Created by Yuriy Holovatskyi on 25.05.17.
//  Copyright © 2017 ThinkMobiles. All rights reserved.
//

import UIKit

class СolorCollectionViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

//MARK: - UICollectionViewDelegate
extension СolorCollectionViewController:UICollectionViewDelegate {
    
}

//MARK: - UICollectionViewDataSource
extension СolorCollectionViewController:UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ColorCollectionViewCell.self), for: indexPath) as! ColorCollectionViewCell
        if indexPath.row == 0 {
            cell.colorBack = UIColor.green
        } else {
            let index = indexPath.row % 4
            
            switch index {
            case 0:
                cell.colorBack = UIColor.gray
            case 1:
                cell.colorBack = UIColor.gray
            case 2:
                cell.colorBack = UIColor.yellow
            case 3:
                cell.colorBack = UIColor.yellow
            default:
                cell.colorBack = UIColor.gray
            }
        }
        
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension СolorCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.size.width
        
        if indexPath.row == 0 {
            return CGSize(width: screenWidth, height: (screenWidth/2)*1.5)
        } else {
            return CGSize(width: screenWidth/2, height: screenWidth/2)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}
