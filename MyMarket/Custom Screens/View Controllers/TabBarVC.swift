//
//  TabBarVC.swift
//  MyMarket
//
//  Created by Mohamed Ghazy on 4/25/21.
//  Copyright © 2021 Mohamed Ghazy. All rights reserved.
//

import UIKit

class TabBarVC: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureAppreance()
        configureTabBar()
    }
    
    func configureAppreance(){
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .systemGreen
    }
    
    fileprivate func createNavController(for rootViewController: UIViewController,
                                         title: String,
                                         image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title                 = title
        navController.tabBarItem.image                 = image
        navController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title        = title
        return navController
    }
    
    func configureTabBar() {
        viewControllers = [
            createNavController(for: HomeScreen(), title: NSLocalizedString("Home", comment: ""), image: UIImage(systemName: "house")!),
            createNavController(for: CategoriesScreen(), title: NSLocalizedString("Categories", comment: ""), image: UIImage(systemName: "cube")!),
            createNavController(for: CartScreen(), title: NSLocalizedString("Cart", comment: ""), image: UIImage(systemName: "cart")!),
            createNavController(for: ProfileScreen(), title: NSLocalizedString("Profile", comment: ""), image: UIImage(systemName: "person")!)
        ]
    }
    
}
