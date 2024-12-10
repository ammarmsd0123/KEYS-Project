//
//  ProjectsTVC.swift
//  Keys Community
//
//  Created by Mac Admin on 11/08/2023.
//

import UIKit

class ProjectsTVC: UITableViewCell {

    @IBOutlet weak var topCollectionView: UICollectionView!
    @IBOutlet weak var projectsCollectionView: UICollectionView!
    @IBOutlet weak var projectsCollectionViewHeight: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        topCollectionView.registerCell(type: GenericInfoCVC.self)
        topCollectionView.dataSource = self
        topCollectionView.delegate = self
        
        projectsCollectionView.registerCell(type: ProjectCVC.self)
        projectsCollectionView.dataSource = self
        projectsCollectionView.delegate = self
        

        

    }
    
    
}

extension ProjectsTVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return collectionView == topCollectionView ? 8 : 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == topCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GenericInfoCVC.className, for: indexPath) as? GenericInfoCVC else {return UICollectionViewCell()}
            
            return cell
        }
        else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProjectCVC.className, for: indexPath) as? ProjectCVC else {return UICollectionViewCell()}
            
            self.projectsCollectionViewHeight.constant = self.projectsCollectionView.collectionViewLayout.collectionViewContentSize.height
            
            return cell
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let height = collectionView.frame.height
        let width = collectionView == topCollectionView ? (collectionView.frame.width - 12 - 8 - 12)/2 : (collectionView.frame.width - 8 - 12 - 40)
        
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return collectionView == topCollectionView ? UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12) : UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 12)
        
    }
}

