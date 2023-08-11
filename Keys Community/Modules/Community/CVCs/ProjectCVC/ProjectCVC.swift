//
//  ProjectCVC.swift
//  Keys Community
//
//  Created by Mac Admin on 11/08/2023.
//

import UIKit

class ProjectCVC: UICollectionViewCell {

    @IBOutlet private weak var clubDetailsVu: UIStackView!
    @IBOutlet private weak var eventDetailsVu: UIView!
    @IBOutlet private weak var projectDetailsVu: UIView!
    @IBOutlet private weak var raisingMoneyVu: UIView!
    
    override func awakeFromNib() {
//        self.raisingMoneyVu.layer.borderWidth = 1
//        self.raisingMoneyVu.layer.borderColor = UIColor(named: "gray_color")?.cgColor
    }

    func setupCell(postType: Enum.PostType) {
        switch postType {
        case .club:
            setupClubView()
        case .project:
            setupProjectView()
        default:
            setupEventView()
        }
    }
    
    private func setupClubView() {
        clubDetailsVu.isHidden = false
        eventDetailsVu.isHidden = true
        projectDetailsVu.isHidden = true
    }
    
    private func setupEventView() {
        clubDetailsVu.isHidden = true
        projectDetailsVu.isHidden = true
        eventDetailsVu.isHidden = false
    }
    
    private func setupProjectView() {
        clubDetailsVu.isHidden = true
        eventDetailsVu.isHidden = true
        projectDetailsVu.isHidden = false
    }

}
