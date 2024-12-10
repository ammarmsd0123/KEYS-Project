//
//  AlertsTVC.swift
//  Keys Community
//
//  Created by Mac Admin on 04/08/2023.
//

import UIKit

class AlertsTVC: UITableViewCell {

    @IBOutlet private weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
    }

    // MARK: Private Functions
    private func setupCollectionView(){
        self.collectionView.register(UINib(nibName: AlertCVC.className, bundle: nil), forCellWithReuseIdentifier: AlertCVC.className)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
    }
    
}

extension AlertsTVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
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
//        let kHomeBannerCollectionCelldentifier = "HomeBannerCollectionCell"
//        collectionView.register(UINib(nibName: "HomeBannerCollectionCell", bundle: Bundle.main), forCellWithReuseIdentifier: kHomeBannerCollectionCelldentifier)
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlertCVC.className, for: indexPath) as? AlertCVC else {return UICollectionViewCell()}
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let height = collectionView.frame.height
        let width = collectionView.frame.width - 12
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 0)
    }
}
