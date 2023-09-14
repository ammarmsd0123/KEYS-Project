//
//  PostCodeViewController.swift
//  Keys Community
//
//  Created by Haroon Shoukat on 02/06/2023.
//

import UIKit

class PostCodeVC: UIViewController {
    
    //MARK: - IbOutlets
    
    //MARK: - Private
    
    //MARK: - Public
    
    //MARK: - onCreate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViewController()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    @IBAction func verifyPressed(_ sender: UIButton) {
        self.navigationController?.pushViewController(UserDetailsVC(), animated: true)
    }
    //MARK: - Private Functions
    private func setUpViewController(){
        self.title = "PostCode"
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(removeKeyboardOnOutsideClick))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func removeKeyboardOnOutsideClick() {
        // Dismiss the keyboard when a tap is detected outside of the keyboard area
        view.endEditing(true)
    }
    
    //MARK: - Public Functions
    
}
