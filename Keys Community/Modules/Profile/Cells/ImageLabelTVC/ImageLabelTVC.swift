//
//  ImageLabelTVC.swift
//  Keys Community
//
//  Created by Ammar Masood on 28/07/2023.
//

import UIKit

class ImageLabelTVC: UITableViewCell {

    
    @IBOutlet private weak var imageVu: UIImageView!
    
    @IBOutlet private weak var titleLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    public func setupCell(data: ImageLabelRow) {
        
        self.titleLbl.text = data.labelTitle
    }
    
}
