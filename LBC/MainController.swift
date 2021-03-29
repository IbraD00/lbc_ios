//
//  ViewController.swift
//  LBC
//
//  Created by Ibrahima Dansokho on 22/03/2021.
//

import UIKit

class MainController: UITabBarController {

    override func viewDidLoad() {
        tabBar.backgroundColor = .white
        tabBar.barTintColor = .white
        tabBar.tintColor = .orange
        viewControllers = [createTabItem(title: "Annonces", icon: "search", viewController: PostViewController())]
    }
    
    func createTabItem(title: String, icon: String, viewController: UIViewController) -> UIViewController {
        let navViewController = UINavigationController(rootViewController: viewController)
        navViewController.navigationBar.prefersLargeTitles = true
        navViewController.navigationBar.tintColor = .white
        navViewController.navigationBar.barTintColor = .orange

        let tabBarItem = UITabBarItem()
        tabBarItem.title = title
        tabBarItem.image = UIImage(named: icon)
        
        navViewController.tabBarItem = tabBarItem
        
        return navViewController
    }
}

