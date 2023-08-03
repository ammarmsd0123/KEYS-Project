//
//  UpcomingCardsTVC.swift
//  Keys Community
//
//  Created by Mac Admin on 03/08/2023.
//

import UIKit

class UpcomingCardsTVC: UITableViewCell {

    // MARK: IBOutlets
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupCollectionView()
    }

    // MARK: Private Functions
    private func setupCollectionView(){
        self.collectionView.register(UINib(nibName: "HomeBannerCollectionCell", bundle: nil), forCellWithReuseIdentifier: "HomeBannerCollectionCell")
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
//        let layout = UICollectionViewFlowLayout()
//                layout.scrollDirection = .horizontal
//                self.collectionViewTopBanner.collectionViewLayout = layout
//                self.collectionViewTopBanner!.contentInset = UIEdgeInsets(top: -10, left: 0, bottom:0, right: 0)
//
//        self.collectionViewTopBanner.reloadData()
//
//
//        self.tableViewFeed.delegate = self
//        self.tableViewFeed.dataSource = self
//        self.tableViewFeed.reloadData()
    }
    
}

extension UpcomingCardsTVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
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
        let cell = HomeBannerCollectionCell.cellForCollectionView(collectionView: collectionView, atIndexPath: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let defaultHeight: CGFloat = 70
//        let cellWidth: CGFloat = UIScreen.main.bounds.size.width - 16
//        // Logo image ratio.
//        let logoHeight: CGFloat = cellWidth / 4.67
//        let height: CGFloat = CGFloat(logoHeight + defaultHeight)
//        let width: CGFloat = self.collectionViewTopBanner.frame.size.width - 1
        
        let height = collectionView.frame.height
        let width = collectionView.frame.width - 12 - 8 - 40
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 0)
    }
}
