//
//  CollectionView.swift
//  Keys Community
//
//  Created by Ammar Masood on 28/07/2023.
//

import Foundation
import UIKit

extension UITableView{
    func register(_ name: String){
        self.register(UINib(nibName: name, bundle: nil), forCellReuseIdentifier: name)
    }
}

extension UITableViewCell {
    func clearBackground() {
        let bgColorView = UIView()
        bgColorView.backgroundColor = .clear
        self.selectedBackgroundView = bgColorView
    }
}
