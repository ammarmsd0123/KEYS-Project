//
//  ExtCollectionVu.swift
//  Keys Community
//
//  Created by Mac Admin on 06/08/2023.
//

import Foundation
import UIKit

extension UICollectionView {
    
    func registerCell(type: UICollectionViewCell.Type, identifier: String? = nil) {
        let cellId = String(describing: type)
        register(UINib(nibName: cellId, bundle: nil), forCellWithReuseIdentifier: identifier ?? cellId)
    }
    
    func makeItemSelected(index: Int, items : inout [SelectedItem]) {
        var i = 0
        while (i<items.count) {
            
            items[i].isSelected = false
            if i == index {
                items[i].isSelected = true
            }
            
            i+=1
        }
        
        self.reloadData()
        
    }
}
