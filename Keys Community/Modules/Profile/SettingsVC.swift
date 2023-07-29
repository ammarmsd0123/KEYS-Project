//
//  SettingsVC.swift
//  Keys Community
//
//  Created by Ammar Masood on 29/07/2023.
//

import UIKit

class SettingsVC: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!
    
    private var tableViewRows = [
        ImageLabelRow(imageName: "wallet", labelTitle: "Change Password"),
        ImageLabelRow(imageName: "notifications", labelTitle: "Notifications", nextScreen: NotificationsVC()),
        ImageLabelRow(imageName: "clubs", labelTitle: "Theme"),
        ImageLabelRow(imageName: "projects", labelTitle: "Terms & Conditions", nextScreen: DetailedLabelVC()),
        ImageLabelRow(imageName: "settings", labelTitle: "Tutorial"),
        ImageLabelRow(imageName: "settings", labelTitle: "Privacy Policy", nextScreen: DetailedLabelVC()),
        ImageLabelRow(imageName: "settings", labelTitle: "About us", nextScreen: DetailedLabelVC()),
    ]
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpViewController()
        
    }

    // MARK: - Private
    private func setUpViewController(){
        tableView.register(ImageLabelTVC.className)
        self.title = "Settings"

    }
    //MARK: - Public Functions
    
    //MARK: - Ib Actions
    
}

//MARK: - TableView Methods
extension SettingsVC : UITableViewDelegate, UITableViewDataSource {
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
        vc.title = tableViewRows[indexPath.row].labelTitle
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
