//
//  CommunityVC.swift
//  Keys Community
//
//  Created by Mac Admin on 07/08/2023.
//

import UIKit

class CommunityVC: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpViewController()
    }

    //MARK: - Private Functions
    private func setUpViewController(){
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UINib(nibName: LabelHeaderHFTVC.className, bundle: nil), forHeaderFooterViewReuseIdentifier: LabelHeaderHFTVC.className)
        
        tableView.register(BudgetTVC.className)
        tableView.register(PollTVC.className)
        tableView.register(ProjectsTVC.className)
        
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.registerCell(type: ImageCVC.self)
    }

}


//MARK: - TableView Datasource & delegate
extension CommunityVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            return self.setupBudgetSection(tableView: tableView, indexPath: indexPath)
        case 1:
            return self.setupPollSection(tableView: tableView, indexPath: indexPath)
        default:
            return self.setupProjectsSection(tableView: tableView, indexPath: indexPath)

        }

    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        guard let labelHFTVC = tableView.dequeueReusableHeaderFooterView(withIdentifier: LabelHeaderHFTVC.className) as? LabelHeaderHFTVC else {return nil}
        
        switch section {
            case 0:
                labelHFTVC.setupCell(title: "Budget")
            case 1:
                labelHFTVC.setupCell(title: "Polls")
            default:
                labelHFTVC.setupCell(title: "Projects")
                
        }
        
        return labelHFTVC
        
    }
    
    
}

// MARK: Tableview Cells
extension CommunityVC {
    
    private func setupBudgetSection(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BudgetTVC.className, for: indexPath) as? BudgetTVC else {return UITableViewCell()}
        
        return cell
    }
    
    private func setupPollSection(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PollTVC.className, for: indexPath) as? PollTVC else {return UITableViewCell()}
        
        cell.collectionViewHeight.constant =  cell.collectionView.collectionViewLayout.collectionViewContentSize.height

        return cell
    }
    
    private func setupProjectsSection(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProjectsTVC.className, for: indexPath) as? ProjectsTVC else {return UITableViewCell()}
        
        cell.projectsCollectionViewHeight.constant = cell.projectsCollectionView.collectionViewLayout.collectionViewContentSize.height

        return cell
    }
    
}

// MARK: Top CollectionView
extension CommunityVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCVC.className, for: indexPath) as? ImageCVC else {return UICollectionViewCell()}
        
        return cell

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let height = collectionView.frame.height
        let width = collectionView.frame.width // - 12 - 8 - 12)/2
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}


