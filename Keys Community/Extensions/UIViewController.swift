//
//  UIViewController.swift
//  Keys Community
//
//  Created by Haroon Shoukat on 01/06/2023.
//

import Foundation
import UIKit

extension UIViewController  {

    func setPresentationStyle() {
        self.modalPresentationStyle = .fullScreen
    }
    
    func addCustomBackButton(shouldDismissOnBack: Bool = false) {
        let selector = shouldDismissOnBack ?  #selector(barCancelButtonTapped(button:)) : #selector(backButton(sender:))
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "back-arrow"), style: .plain, target: self, action: selector)
    }
    

    func addCustomCrossButton() {
        let crossButton: UIButton = UIButton (type: UIButton.ButtonType.custom)
        crossButton.setImage(UIImage(named: "cancel"), for: UIControl.State.normal)

        crossButton.addTarget(self, action: #selector(self.barCancelButtonTapped(button:)), for: UIControl.Event.touchUpInside)

        crossButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        let barButton = UIBarButtonItem(customView: crossButton)

        navigationItem.rightBarButtonItem = barButton
    }

    @objc func backButtonPressed(button : UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func backButton(sender : UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    

    @objc func barCancelButtonTapped(button: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }



        
        


}
