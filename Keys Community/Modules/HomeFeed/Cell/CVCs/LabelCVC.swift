//
//  LabelCVC.swift
//  SpotifyClone
//
//  Created by Ammar Masood on 16/04/2023.
//

import UIKit

class LabelCVC: UICollectionViewCell {

    // MARK: IBOutlets
    @IBOutlet private weak var title: UILabel!
    @IBOutlet private weak var bottomLine: UIView!
    
    // MARK: Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: Public Functions
    public func setupCell(data: SelectedItem) {
        self.title.text = data.title
        bottomLine.isHidden = !data.isSelected
    }

}
