//
//  EventPostTVC.swift
//  Keys Community
//
//  Created by Mac Admin on 05/08/2023.
//

import UIKit

class EventPostTVC: UITableViewCell {

    @IBOutlet private weak var clubDetailsVu: UIStackView!
    @IBOutlet private weak var eventDetailsVu: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupCell(postType: Enum.PostType) {
        switch postType {
        case .club:
            setupClubView()
        default:
            setupEventView()
        }
    }
    
    private func setupClubView() {
        clubDetailsVu.isHidden = false
        eventDetailsVu.isHidden = true
    }
    
    private func setupEventView() {
        clubDetailsVu.isHidden = true
        eventDetailsVu.isHidden = false
    }
}
