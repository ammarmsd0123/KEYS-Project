//
//  EditProfileVC.swift
//  Keys Community
//
//  Created by Ammar Masood on 29/07/2023.
//

import UIKit

class EditProfileVC: UIViewController {

    @IBOutlet weak var detailsVu: UIView!
    
    @IBOutlet weak var descriptionTF1: UITextField!
    @IBOutlet weak var descriptionTF2: UITextField!
    @IBOutlet weak var descriptionTF3: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupViewController()

    }


    private func setupViewController() {
//        detailsVu.layer.borderColor = UIColor.black.cgColor
        
        descriptionTF1.borderStyle = .none
        descriptionTF2.borderStyle = .none
        descriptionTF3.borderStyle = .none
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(removeKeyboardOnOutsideClick))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func removeKeyboardOnOutsideClick() {
        // Dismiss the keyboard when a tap is detected outside of the keyboard area
        view.endEditing(true)
    }
}
