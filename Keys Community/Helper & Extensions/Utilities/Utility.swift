//
//  Utility.swift
//  Keys Community
//
//  Created by Haroon Shoukat on 07/06/2023.
//

import Foundation
import UIKit

class Utility{
    static var tabController = UITabBarController()
    static var innerTabController = UITabBarController()
    
    class func setUpNavDrawerController() {
        
        tabController = UITabBarController()
        
        let homeViewController = HomeViewController()
        let communityViewController = CommunityVC()
        let servicesViewController = ServicesViewController()
        let eventsViewController = EventsViewController()
        
        homeViewController.tabBarItem = UITabBarItem(title: "Home", image: #imageLiteral(resourceName: "home"), selectedImage: #imageLiteral(resourceName: "home"))
        communityViewController.tabBarItem = UITabBarItem(title: "Notifications", image: #imageLiteral(resourceName: "notification"), selectedImage: #imageLiteral(resourceName: "notification"))
        servicesViewController.tabBarItem = UITabBarItem(title: "My Orders", image: #imageLiteral(resourceName: "order-history"), selectedImage: #imageLiteral(resourceName: "order-history"))
        eventsViewController.tabBarItem = UITabBarItem(title: "Profile", image: #imageLiteral(resourceName: "profile"), selectedImage: #imageLiteral(resourceName: "profile"))
        
        let homeNavigationController = UINavigationController()
        homeNavigationController.navigationBar.isHidden = true
        homeNavigationController.viewControllers = [homeViewController]
        
        let notificationNavigationController = UINavigationController()
        notificationNavigationController.navigationBar.isHidden = true
        notificationNavigationController.viewControllers = [communityViewController]
        
        let orderNavigationController = UINavigationController()
        orderNavigationController.navigationBar.isHidden = true
        orderNavigationController.viewControllers = [servicesViewController]
        
        let profileNavigationController = UINavigationController()
        profileNavigationController.navigationBar.isHidden = true
        profileNavigationController.viewControllers = [eventsViewController]
        
        tabController.viewControllers =
        [
                homeNavigationController,
                notificationNavigationController,
                orderNavigationController,
                profileNavigationController
        ]
        
//        if isKeyPresentInUserDefaults(key: kToken) == false {
//            tabController.tabBar.items![1].isEnabled = false
//            tabController.tabBar.items![2].isEnabled = false
//            tabController.tabBar.items![3].isEnabled = false
//
//        } else {
            tabController.tabBar.items![1].isEnabled = true
            tabController.tabBar.items![2].isEnabled = true
            tabController.tabBar.items![3].isEnabled = true
//        }

//        tabController.addLeftBarButtonWithImage(#imageLiteral(resourceName: "navigation-icon"))
        tabController.selectedIndex = 0
        tabController.tabBar.tintColor = #colorLiteral(red: 0.8481271863, green: 0.1670740545, blue: 0.5549028516, alpha: 1)
        tabController.tabBar.barTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        
        if #available(iOS 15.0, *) {
            let appearance = self.tabController.tabBar.standardAppearance
            appearance.stackedLayoutAppearance.normal.iconColor = #colorLiteral(red: 0.2632602751, green: 0.1825990379, blue: 0.4616267681, alpha: 1)
            appearance.stackedLayoutAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.2632602751, green: 0.1825990379, blue: 0.4616267681, alpha: 1)]
            appearance.backgroundColor = .white
            
            self.tabController.tabBar.standardAppearance = appearance
            self.tabController.tabBar.scrollEdgeAppearance = appearance
        }
        else {
            tabController.tabBar.unselectedItemTintColor = #colorLiteral(red: 0.2632602751, green: 0.1825990379, blue: 0.4616267681, alpha: 1)
        }
    }
}
