//
//  FGTabBarController.swift
//  GHFollowers
//
//  Created by Fede Garcia on 24/04/2024.
//

import UIKit

class FGTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().tintColor = .systemGreen
        viewControllers = [createSearchNC(),createFedeNC(), createFavoritesNC()]
        tabBar.backgroundColor = .systemGray.withAlphaComponent(0.5)
    }
    
    func createSearchNC() -> UINavigationController {
        let searchVC = SearchVC()
        searchVC.title = "Search"
        searchVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        
        return UINavigationController(rootViewController: searchVC)
    }
    
    func createFavoritesNC() -> UINavigationController {
        let favoritesNC = FavoritesVC()
        favoritesNC.title = "Favorites"
        favoritesNC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        
        return UINavigationController(rootViewController: favoritesNC)
    }
    
    func createFedeNC() -> UINavigationController {
        let fedeNC = Fede()
        fedeNC.title = "Fede"
        fedeNC.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 2)
        
        return UINavigationController(rootViewController: fedeNC)
    }
    
}
