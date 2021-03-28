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
        viewControllers = [createTabItem(title: "Annonces")]
    }
    
    func createTabItem(title : String) -> UIViewController {
        let viewC = PostViewController()
        
        //viewC.navigationBar.isHidden = true
        let tabBarItem = UITabBarItem()
        tabBarItem.title = "Annonces"
        tabBarItem.image = UIImage(named: "magnifyingglass")
        
        viewC.tabBarItem = tabBarItem
        
        return viewC
    }
}

