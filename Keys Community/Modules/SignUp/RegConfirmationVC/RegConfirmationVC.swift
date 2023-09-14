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
//        let newNavigationController = UINavigationController(rootViewController: HomeViewController())
//        newNavigationController.prese
//        self.present(newNavigationController, animated: true, completion: nil)
//        self.navigationController?.pushViewController(newNavigationController, animated: true)
        
//        let viewController = YourViewController(nibName: "YourViewController", bundle: nil)
        
        // Create the navigation controller and set the view controller as the root view controller
//        let navigationController = UINavigationController(rootViewController: HomeViewController())
//
//
//        var window = UIWindow(frame: UIScreen.main.bounds)
//        window.rootViewController = navigationController
//        window.makeKeyAndVisible()
        
        self.navigationController?.pushViewController(HomeViewController(), animated: true)
    }
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    //MARK: - Private Functions
    private func setUpViewController(){
        self.title = "Registration confirmation"
    }
    //MARK: - Public Functions
    
}
