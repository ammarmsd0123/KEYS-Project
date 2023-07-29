//
//  RegConfirmationViewController.swift
//  Keys Community
//
//  Created by Haroon Shoukat on 05/06/2023.
//

import UIKit

class RegConfirmationVC:  UIViewController {
    
    //MARK: - IbOutlets
    
    //MARK: - Private
    
    //MARK: - Public
    
    //MARK: - onCreate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViewController()
    }
    
    @IBAction func startPressed(_ sender: UIButton) {
        self.navigationController?.pushViewController(ProfileVC(), animated: true)
    }
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    //MARK: - Private Functions
    private func setUpViewController(){
        self.title = "Registration confirmation"
    }
    //MARK: - Public Functions
    
}
