//
//  AppCoordinator.swift
//  NewsApp
//
//  Created by James Junior on 11/03/23.
//

import Foundation
import UIKit

protocol AppCoordinatorProtocol {
    func setRootVC(scene: UIWindowScene)
}

class AppCoordinator {
    var window: UIWindow?
    
    private func createNewsVC() -> UINavigationController {
        let newsVC = CategoryAssembly.assemble()
        newsVC.title = "News"
        newsVC.tabBarItem = UITabBarItem(
            title: "News",
            image: TheConstantManager.news,
            selectedImage: TheConstantManager.news
        )
        
        return UINavigationController(rootViewController: newsVC)
    }
    
    private func createSearchVC() -> UINavigationController {
        let searchVC = SearchAssembly.assemble()
        searchVC.title = "Search News"
        searchVC.tabBarItem = UITabBarItem(
            title: "Search",
            image: TheConstantManager.search,
            selectedImage: TheConstantManager.search
        )
        
        return UINavigationController(rootViewController: searchVC)
    }
    
    private func createTabBar() -> UITabBarController {
        let tabBar = UITabBarController()
        tabBar.viewControllers = [createNewsVC(), createSearchVC()]
        UITabBar.appearance().backgroundColor = .systemGray4
        UITabBar.appearance().tintColor = .systemBlue
        return tabBar
    }
}

extension AppCoordinator: AppCoordinatorProtocol {
    func setRootVC(scene: UIWindowScene) {
        window = UIWindow(windowScene: scene)
        window?.rootViewController = createTabBar()
        window?.makeKeyAndVisible()
    }
}
