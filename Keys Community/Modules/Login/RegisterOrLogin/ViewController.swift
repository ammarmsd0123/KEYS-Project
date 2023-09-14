//
//  ViewController.swift
//  Keys Community
//
//  Created by Haroon Shoukat on 01/06/2023.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - IbOutlets
    
    @IBOutlet private weak var alreadyHaveAnAccountBTn: UIButton!
    //MARK: - Private
    
    //MARK: - Public
    
    //MARK: - onCreate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    //MARK: - Private Functions
    private func setupView() {
        if traitCollection.userInterfaceStyle == .dark {
            self.alreadyHaveAnAccountBTn.layer.borderColor = UIColor(named: "gray_color")?.cgColor

        } else {
            print("Light mode is enabled.")
        }
    }

    //MARK: - Public Functions
    
    
    //MARK: - Ib Button Actions
    
    @IBAction func didTapHaveAccount(_ sender: Any) {
        //        self.showActionSheet()
        let authOptionsVC = AuthOptionsVC()
        authOptionsVC.selectedOption = { [weak self] loginSignupBy in
            switch loginSignupBy {
                case AuthOptions.byMobile:
                    self?.navigationController?.pushViewController(PhoneSignUpLoginVC(), animated: true)
                default:
                    break
            }
        }
        authOptionsVC.modalPresentationStyle = .overFullScreen
        self.present(authOptionsVC, animated: true)
        

    }
    @IBAction func didTapCreateAccount(_ sender: Any) {
        
        let authOptionsVC = AuthOptionsVC()
        authOptionsVC.isSigningUp = true
        authOptionsVC.selectedOption = { [weak self] loginSignupBy in
            switch loginSignupBy {
                case AuthOptions.byMobile:
                    let vc = PhoneSignUpLoginVC()
                    vc.isSigningUp = true
                    self?.navigationController?.pushViewController(vc, animated: true)
            case AuthOptions.byEmail:
                    let vc = EmailSignupVC()
                    self?.navigationController?.pushViewController(vc, animated: true)

                default:
                    break
            }
        }
        authOptionsVC.modalPresentationStyle = .overFullScreen
        self.present(authOptionsVC, animated: true)
        
    }
}

//MARK: - API Methods

// MARK: Unused Code
//private func showActionSheet() {
//    let actionSheet = UIAlertController(title: "\n\n\n\n\n\n", message: nil, preferredStyle: .actionSheet)
//
//    let view = UIView(frame: CGRect(x: 8.0, y: 8.0, width: actionSheet.view.bounds.size.width - 8.0 * 4.5, height: 50.0))
//    view.backgroundColor = UIColor.green
//    let button = UIButton()
//    button.backgroundColor = .gray
//    button.setTitle("Test Button", for: .normal)
//    view.addSubview(button)
//    actionSheet.view.addSubview(view)
//
//    actionSheet.addAction(UIAlertAction(title: "Add to a Playlist", style: .default, handler: nil))
//    actionSheet.addAction(UIAlertAction(title: "Create Playlist", style: .default, handler: nil))
//    actionSheet.addAction(UIAlertAction(title: "Remove from this Playlist", style: .default, handler: nil))
//
//    actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
//    present(actionSheet, animated: true, completion: nil)
//}
