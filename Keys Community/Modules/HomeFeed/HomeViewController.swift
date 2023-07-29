//
//  HomeViewController.swift
//  Keys Community
//
//  Created by Haroon Shoukat on 05/06/2023.
//

import UIKit

class HomeViewController:  UIViewController {
    
    //MARK: - IbOutlets
    @IBOutlet weak var imgViewProfile: UIImageView!
    @IBOutlet weak var viewBorderProfile: UIView!
    @IBOutlet weak var labelUserName: UILabel!
    @IBOutlet weak var labelWelcome: UILabel!
    @IBOutlet weak var viewNotifications: UIView!
    @IBOutlet weak var viewChat: UIView!
    @IBOutlet weak var collectionViewTopBanner: UICollectionView!
    @IBOutlet weak var tableViewFeed: UITableView!
    
    //MARK: - Private
    
    //MARK: - Public
    
    //MARK: - onCreate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViewController()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    //MARK: - Private Functions
    private func setUpViewController(){
        registerAssetsCollectionView()
        
        
        imgViewProfile?.layer.cornerRadius = (imgViewProfile?.frame.size.width ?? 0.0) / 2
        imgViewProfile?.clipsToBounds = true
        imgViewProfile?.layer.borderWidth = 2.0
        imgViewProfile?.layer.borderColor = #colorLiteral(red: 1, green: 0.7570000291, blue: 0.00800000038, alpha: 1)
    }
    
    private func registerAssetsCollectionView(){
        self.collectionViewTopBanner.register(UINib(nibName: "HomeBannerCollectionCell", bundle: nil), forCellWithReuseIdentifier: "HomeBannerCollectionCell")
        self.collectionViewTopBanner.delegate = self
        self.collectionViewTopBanner.dataSource = self
        
        let layout = UICollectionViewFlowLayout()
                layout.scrollDirection = .horizontal
                self.collectionViewTopBanner.collectionViewLayout = layout
                self.collectionViewTopBanner!.contentInset = UIEdgeInsets(top: -10, left: 0, bottom:0, right: 0)
        
        self.collectionViewTopBanner.reloadData()
        
        
        self.tableViewFeed.delegate = self
        self.tableViewFeed.dataSource = self
        self.tableViewFeed.reloadData()
    }
    //MARK: - Public Functions
    
    //MARK: - Ib Actions
    
}

//MARK: - Api Methods

extension HomeViewController {
    
}

//MARK: - Api Methods

extension HomeViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = HomeBannerCollectionCell.cellForCollectionView(collectionView: collectionView, atIndexPath: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let defaultHeight: CGFloat = 70
        let cellWidth: CGFloat = UIScreen.main.bounds.size.width - 16
        // Logo image ratio.
        let logoHeight: CGFloat = cellWidth / 4.67
        let height: CGFloat = CGFloat(logoHeight + defaultHeight)
        let width: CGFloat = self.collectionViewTopBanner.frame.size.width - 1
        return CGSize(width: width, height: height)
    }
}

//MARK: - TableView Datasource & delegate
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = HomeUpdateTableViewCell.cellForTableView(tableView: tableView, atIndexPath: indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400.0
    }
    
}
