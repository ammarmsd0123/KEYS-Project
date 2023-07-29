//
//  FeedDetailViewController.swift
//  Keys Community
//
//  Created by Haroon Shoukat on 08/06/2023.
//

import UIKit

class FeedDetailViewController: UIViewController {
    
    //MARK: - IbOutlets
    @IBOutlet weak var buttonBack: UIButton!
    @IBOutlet weak var buttonForward: UIButton!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imgUser: UIView!

    //MARK: - Private
    
    //MARK: - Public
    
    //MARK: - onCreate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViewController()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    //MARK: - Private Functions
    private func setUpViewController(){
        let image = UIImage(named: "icon_forward")?.withRenderingMode(.alwaysTemplate)
        buttonForward.setImage(image, for: .normal)
        buttonForward.tintColor = UIColor.white
        
        
        let imageBack = UIImage(named: "icon_back")?.withRenderingMode(.alwaysTemplate)
        buttonBack.setImage(imageBack, for: .normal)
        buttonBack.tintColor = UIColor.white
        
        containerView.clipsToBounds = true
        containerView.layer.cornerRadius = 12
        containerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        imgUser?.layer.cornerRadius = (imgUser?.frame.size.width ?? 0.0) / 2
        imgUser?.clipsToBounds = true
        imgUser?.layer.borderWidth = 2.0
        imgUser?.layer.borderColor = #colorLiteral(red: 1, green: 0.7570000291, blue: 0.00800000038, alpha: 1)
        
        
    }
    //MARK: - Public Functions
    
    //MARK: - Ib Actions
    
}

//MARK: - Api Methods

extension FeedDetailViewController {
    
}
