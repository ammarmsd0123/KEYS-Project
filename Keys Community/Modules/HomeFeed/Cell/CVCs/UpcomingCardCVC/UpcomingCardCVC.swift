//
//  HomeBannerCollectionCell.swift
//  Keys Community
//
//  Created by Haroon Shoukat on 05/06/2023.
//

import UIKit

class UpcomingCardCVC: UICollectionViewCell {

    @IBOutlet weak var imgViewBanner: UIImageView!
    @IBOutlet weak var imgIcon: UIImageView!
    @IBOutlet weak var buttonStatus: UIButton!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDay: UILabel!
    @IBOutlet weak var imgViewCalendar: UIImageView!
    @IBOutlet weak var labelTime: UILabel!
    @IBOutlet weak var imgViewLocation: UIImageView!
    @IBOutlet weak var labelAddress: UILabel!
    @IBOutlet weak var viewTopCorner: UIView!
    @IBOutlet weak var outerVu: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        viewTopCorner.clipsToBounds = true
        viewTopCorner.layer.cornerRadius = 10
        self.layer.cornerRadius = 10
        viewTopCorner.layer.maskedCorners = [.layerMaxXMaxYCorner]
        
        outerVu.layer.shadowColor = UIColor.black.cgColor
//        outerVu.layer.shadowOpacity = 1
        outerVu.layer.shadowOffset = .zero
//        outerVu.layer.shadowRadius = 10
    }

    
    @IBAction func didTapButtonStatus(_ sender: Any) {
    }
}
