//
//  LabelHeaderHFTVC.swift
//  Keys Community
//
//  Created by Mac Admin on 07/08/2023.
//

import UIKit

class LabelHeaderHFTVC: UITableViewHeaderFooterView {

    // MARK: IBOutlets
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var seeDetails: UILabel!
    
    // MARK: Variables

    // MARK: Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    // MARK: Public Functions
    public func setupCell(title: String) {
        self.title.text = title
    }


}
