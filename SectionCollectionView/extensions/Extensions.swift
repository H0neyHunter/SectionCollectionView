//
//  Extensions.swift
//  SectionCollectionView
//
//  Created by Ümit Örs on 21.12.2023.
//

import Foundation
import UIKit


extension UICollectionView {
    func threeColumns(){
        let screenWidth = UIScreen.main.bounds.width
        let width = (screenWidth - 20) / 3
        let layout = self.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: width)
    }
}
