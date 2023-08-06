//
//  OptionsHeader.swift
//  SpotifyClone
//
//  Created by Ammar Masood on 17/04/2023.
//

import UIKit

class FeedUpdatesOptionHFTVC: UITableViewHeaderFooterView {

    // MARK: IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: Variables
    private var items = [SelectedItem]()
    
    // MARK: Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.registerCell(type: LabelCVC.self)
        
    }
    
    // MARK: Public Functions
    public func setupCell(datasource : [SelectedItem]) {
        self.items = datasource
    }

}


// MARK: CollectionView Datasource Delegate
extension FeedUpdatesOptionHFTVC : UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return getLabelCVC(collectionView: collectionView, indexPath: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.makeItemSelected(index: indexPath.row, items: &items)
    }
    
    
}


//MARK: - CollectionView Flow Delegate
extension FeedUpdatesOptionHFTVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 25
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = indexPath.row == 0 ? 70.0 : 48.0
        return CGSize(width: width , height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}

// MARK: - CollectionView Cells
extension FeedUpdatesOptionHFTVC {
    private func getLabelCVC(collectionView : UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let labelCvc = collectionView.dequeueReusableCell(withReuseIdentifier: LabelCVC.className, for: indexPath) as? LabelCVC else {
            return UICollectionViewCell()
            
        }
        
        labelCvc.setupCell(data: items[indexPath.row])
        
        return labelCvc
        
    }
}

