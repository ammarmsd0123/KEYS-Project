//
//  WalletScreenViewController.swift
//  Keys Community
//
//  Created by Haroon Shoukat on 02/06/2023.
//

import UIKit

class AddCardVC: UIViewController {
    
    //MARK: - IbOutlets
    
    //MARK: - Private
    
    @IBOutlet private weak var bankCard: UIView!
    //MARK: - Public
    
    //MARK: - onCreate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViewController()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    @IBAction private func continuePressed(_ sender: Any) {
        
        self.navigationController?.pushViewController(RegConfirmationVC(), animated: true)
    }
    //MARK: - Private Functions
    private func setUpViewController(){
        self.title = "Add Card"
        bankCard.layer.borderWidth = 2
        bankCard.layer.cornerRadius = 12
        bankCard.layer.borderColor = UIColor(named: "primary")?.cgColor
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(removeKeyboardOnOutsideClick))
        self.view.addGestureRecognizer(tapGesture)
        
    }
    
    @objc private func removeKeyboardOnOutsideClick() {
        // Dismiss the keyboard when a tap is detected outside of the keyboard area
        view.endEditing(true)
    }
    
    //MARK: - Public Functions
    
}
