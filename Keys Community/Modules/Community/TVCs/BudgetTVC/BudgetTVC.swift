//
//  BudgetTVC.swift
//  Keys Community
//
//  Created by Mac Admin on 07/08/2023.
//

import UIKit

class BudgetTVC: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var emptyStateVu: UIView!
    @IBOutlet weak var emptyStateLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.registerCell(type: GenericInfoCVC.self)
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    
}

extension BudgetTVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GenericInfoCVC.className, for: indexPath) as? GenericInfoCVC else {return UICollectionViewCell()}
        
        return cell

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let height = collectionView.frame.height
        let width = (collectionView.frame.width - 12 - 8 - 12)/2
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
    }
}

