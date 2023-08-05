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
        tableViewFeed.register(AlertsTVC.className)
        tableViewFeed.register(ImagePostTVC.className)
        tableViewFeed.register(EventPostTVC.className)
        
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
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 10
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            return getUpcomingCards(tableView: tableView, indexPath: indexPath)
        case 1:
            return getFeedPostDataSource(tableView: tableView, indexPath: indexPath)
        default:
            return UITableViewCell()
        }
    }
    
    
}

// MARK: Tableview Cells
extension HomeViewController {
    
    private func getFeedPostDataSource(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            return getAlertCards(tableView: tableView, indexPath: indexPath)
        case 1:
            return getImagePostTVC(tableView: tableView, indexPath: indexPath)
        default:
            return getEventPostTVC(tableView: tableView, indexPath: indexPath)//UITableViewCell()
        }
    }
    
    private func getUpcomingCards(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UpcomingCardsTVC.className, for: indexPath) as? UpcomingCardsTVC else {return UITableViewCell()}
        
        return cell
    }
    
    private func getAlertCards(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AlertsTVC.className, for: indexPath) as? AlertsTVC else {return UITableViewCell()}
        
        return cell
    }
    
    private func getImagePostTVC(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ImagePostTVC.className, for: indexPath) as? ImagePostTVC else {return UITableViewCell()}
        
        return cell
    }
    
    private func getEventPostTVC(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EventPostTVC.className, for: indexPath) as? EventPostTVC else {return UITableViewCell()}
        
        return cell
    }
}
