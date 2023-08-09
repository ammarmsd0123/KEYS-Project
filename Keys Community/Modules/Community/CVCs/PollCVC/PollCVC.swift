//
//  PollCVC.swift
//  Keys Community
//
//  Created by Mac Admin on 08/08/2023.
//

import UIKit

class PollCVC: UICollectionViewCell {

    @IBOutlet private weak var tableView: UITableView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PollResultTVC.className)
    }

}


//MARK: - TableView Datasource & delegate
extension PollCVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return getPollResultRow(tableView: tableView, indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 0
    }
        
    
}

// MARK: Tableview Cells
extension PollCVC {
    
    private func getPollResultRow(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PollResultTVC.className, for: indexPath) as? PollResultTVC else {return UITableViewCell()}
        
        return cell
    }
    
}

