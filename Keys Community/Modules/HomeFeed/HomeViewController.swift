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
    @IBOutlet weak var tableViewFeed: UITableView!
    @IBOutlet weak var profileSuperVu: UIView!
    
    
    
    //MARK: - Private
    
    //MARK: - Public
    
    //MARK: - onCreate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViewController()
        

    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    //MARK: - Private Functions
    private func setUpViewController(){
                
        imgViewProfile?.layer.cornerRadius = 36
        imgViewProfile?.layer.borderWidth = 2.0
        imgViewProfile?.layer.borderColor = #colorLiteral(red: 1, green: 0.7570000291, blue: 0.00800000038, alpha: 1)
        
        let profileTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleProfileTap(_:)))
        profileSuperVu.addGestureRecognizer(profileTapGesture)
        profileSuperVu.isUserInteractionEnabled = true
        
        tableViewFeed.dataSource = self
        tableViewFeed.delegate = self
        
        tableViewFeed.register(UpcomingCardsTVC.className)
        
    }
    

    @objc func handleProfileTap(_ gesture: UITapGestureRecognizer) {
        self.navigationController?.pushViewController(ProfileVC(), animated: true)
    }
    

    //MARK: - Public Functions
    
    //MARK: - Ib Actions
    
}

//MARK: - Api Methods

extension HomeViewController {
    
}

//MARK: - Api Methods



//MARK: - TableView Datasource & delegate
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return getUpcomingCards(tablleView: tableView, indexPath: indexPath)
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 400.0
//    }
    
}

// MARK: Tableview Cells
extension HomeViewController {
    private func getUpcomingCards(tablleView: UITableView, indexPath: IndexPath) -> UITableViewCell {
//        let kTableViewCell = "HomeUpdateTableViewCell"
//        tableView.register(UINib(nibName: "HomeUpdateTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: kTableViewCell)
//        let cell = tableView.dequeueReusableCell(withIdentifier: kTableViewCell, for: indexPath) as! HomeUpdateTableViewCell
//
        
        guard let cell = tablleView.dequeueReusableCell(withIdentifier: UpcomingCardsTVC.className, for: indexPath) as? UpcomingCardsTVC else {return UITableViewCell()}
        
        return cell
    }
}
