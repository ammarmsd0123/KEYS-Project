//
//  ProfileViewController.swift
//  Keys Community
//
//  Created by Haroon Shoukat on 08/06/2023.
//

import UIKit

struct ImageLabelRow {
    let imageName : String
    let labelTitle : String
    var nextScreen : UIViewController? = nil
}

class ProfileVC: UIViewController {
    
    //MARK: - IbOutlets
    
    @IBOutlet private weak var tableView: UITableView!
    //MARK: - Private
    
    private var tableViewRows = [
        ImageLabelRow(imageName: "wallet", labelTitle: "Wallet", nextScreen: nil),
        ImageLabelRow(imageName: "subscriptions", labelTitle: "Subscriptions", nextScreen: nil),
        ImageLabelRow(imageName: "clubs", labelTitle: "Clubs", nextScreen: nil),
        ImageLabelRow(imageName: "projects", labelTitle: "Projects", nextScreen: nil),
        ImageLabelRow(imageName: "settings", labelTitle: "Settings", nextScreen: SettingsVC())
    ]
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
        tableView.register(ImageLabelTVC.className)
        
        self.title = "Profile"
    }
    //MARK: - Public Functions
    
    //MARK: - Ib Actions
    
}

//MARK: - TableView Methods
extension ProfileVC : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableViewRows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let rowTvc = tableView.dequeueReusableCell(withIdentifier: ImageLabelTVC.className, for: indexPath) as? ImageLabelTVC else { return UITableViewCell()}
        
        rowTvc.setupCell(data: tableViewRows[indexPath.row])
        
        rowTvc.clearBackground()
        return rowTvc
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = tableViewRows[indexPath.row].nextScreen else {return}
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
