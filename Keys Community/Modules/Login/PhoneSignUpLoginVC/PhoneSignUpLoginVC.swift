//
//  PhoneLoginVc.swift
//  Keys Community
//
//  Created by Ammar Masood on 21/07/2023.
//

import UIKit

class PhoneSignUpLoginVC: UIViewController {
    
    //MARK: - IbOutlets
    
    @IBOutlet private weak var verifyBtn: UIButton!
    //MARK: - Private
    
    //MARK: - Public
    var isSigningUp : Bool = false
    
    //MARK: - onCreate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViewController()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    //MARK: - Private Functions
    private func setUpViewController(){
        print(isSigningUp)
        self.title = isSigningUp == true ? "Sign up with Mobile" : "Login with mobile"
        
        self.verifyBtn.layer.cornerRadius = 10
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(removeKeyboardOnOutsideClick))
        self.view.addGestureRecognizer(tapGesture)

    }
    //MARK: - Public Functions
    @objc private func removeKeyboardOnOutsideClick() {
        // Dismiss the keyboard when a tap is detected outside of the keyboard area
        view.endEditing(true)
    }
    
    //MARK: - Ib Button Actions
    
    @IBAction func didTapVerify(_ sender: Any) {
        let vc = VerifyOTPVC()
        vc.isSigningUp = self.isSigningUp
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

