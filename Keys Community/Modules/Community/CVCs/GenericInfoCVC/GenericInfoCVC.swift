//
//  GenericInfoCVC.swift
//  Keys Community
//
//  Created by Mac Admin on 07/08/2023.
//

import UIKit

class GenericInfoCVC: UICollectionViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    @IBOutlet weak var imgVu: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func setupCell(title: String, subtitle: String? = nil, img: String? = nil) {
        
        self.title.text = title
        self.subtitle.text = subtitle ?? ""
//        self.title = title
    }

}
