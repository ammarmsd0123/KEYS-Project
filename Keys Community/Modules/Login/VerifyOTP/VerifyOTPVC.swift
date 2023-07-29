//
//  VerifyOTPVC.swift
//  Keys Community
//
//  Created by Ammar Masood on 21/07/2023.
//

import UIKit
import Foundation
import DPOTPView

class VerifyOTPVC: UIViewController {
    
    //MARK: - IbOutlets
    
    //MARK: - Private
    @IBOutlet weak var otpView: DPOTPView!
    //MARK: - Public
    var isSigningUp : Bool = false
    
    //MARK: - onCreate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViewController()
        
//        otpView.dpOTPViewDelegate
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    //MARK: - Private Functions
    private func setUpViewController(){
        self.title = "Verification Code"
        self.otpView.dpOTPViewDelegate = self
        self.otpView.keyboardType = .numberPad
    }
    //MARK: - Public Functions
    
    
    //MARK: - Ib Button Actions
    
    @IBAction func didTapVerify(_ sender: Any) {
        if isSigningUp {
            self.navigationController?.pushViewController(PostCodeVC(), animated: true)
        }
    }
    
}


extension VerifyOTPVC: DPOTPViewDelegate {
    
    func dpOTPViewAddText(_ text: String, at position: Int) {
        if text.count == 5 {
            // verifyButton.isUserInteractionEnabled = true
//            self.validateOneTimePasscodeForm(inputCode: text)
//            self.otpPosition?(text.count)
            // verifyButton.backgroundColor = UIColor(red: 0.16, green: 0.75, blue: 0.96, alpha: 1.00)
            
        }
        else{
//            self.otpPosition?(text.count)
            //verifyButton.isUserInteractionEnabled = false
            //verifyButton.backgroundColor = .lightGray
        }
    }
    
    func dpOTPViewRemoveText(_ text: String, at position: Int) {

    }
    
    func dpOTPViewChangePositionAt(_ position: Int) {

    }
    func dpOTPViewBecomeFirstResponder() {
 
    }
    func dpOTPViewResignFirstResponder() {
        
    }
}
