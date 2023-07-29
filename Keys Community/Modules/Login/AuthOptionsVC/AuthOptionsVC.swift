//
//  AuthOptionsVC.swift
//  Keys Community
//
//  Created by Ammar Masood on 21/07/2023.
//

import UIKit

enum AuthOptions {
    case byMobile
    case byEmail
    case byMac
    case byFb
    case byGoogle
}

class AuthOptionsVC: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet private weak var mobileLogin: UIView!
    @IBOutlet private weak var emailLogin: UIView!
    @IBOutlet private weak var appleLogin: UIView!
    @IBOutlet private weak var facebookLogin: UIView!
    @IBOutlet private weak var googleLogin: UIView!
    @IBOutlet private weak var outerVu: UIView!
    
    // MARK: Public
    var selectedOption: ((_: AuthOptions)->())?

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mobileLogin.layer.cornerRadius = 10
        emailLogin.layer.cornerRadius = 10
        appleLogin.layer.cornerRadius = 10
        facebookLogin.layer.cornerRadius = 10
        googleLogin.layer.cornerRadius = 10
        outerVu.layer.cornerRadius = 14
        
        let mobileTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleMobileTap(_:)))
        mobileLogin.addGestureRecognizer(mobileTapGesture)
        mobileLogin.isUserInteractionEnabled = true

    }
    
    @IBAction private func dismissVC(){
        self.dismiss(animated: true)
    }
    
    @objc func handleMobileTap(_ gesture: UITapGestureRecognizer) {
        dismiss(animated: true, completion: {
            self.selectedOption?(AuthOptions.byMobile)
        })
    }


}
