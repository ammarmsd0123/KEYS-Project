//
//  HomeUpdateTableViewCell.swift
//  Keys Community
//
//  Created by Haroon Shoukat on 08/06/2023.
//

import UIKit

class HomeUpdateTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    class func cellForTableView(tableView: UITableView, atIndexPath indexPath: IndexPath) -> HomeUpdateTableViewCell {
        let kTableViewCell = "HomeUpdateTableViewCell"
        tableView.register(UINib(nibName: "HomeUpdateTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: kTableViewCell)
        let cell = tableView.dequeueReusableCell(withIdentifier: kTableViewCell, for: indexPath) as! HomeUpdateTableViewCell
        return cell
    }
    
}
