//
//  SceneDelegate.swift
//  NewsApp
//
//  Created by James Junior on 11/03/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    private var interactor: AppInteractor?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        UIBarButtonItem.appearance().setTitleTextAttributes(
            [NSAttributedString.Key.font : TheConstantManager.boldFont], for: .normal)
        UIBarButtonItem.appearance().setTitleTextAttributes(
            [NSAttributedString.Key.font : TheConstantManager.boldFont], for: .highlighted)
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.interactor = AppInteractor(windowScene: windowScene)
    }

    func sceneDidDisconnect(_ scene: UIScene) { }

    func sceneDidBecomeActive(_ scene: UIScene) { }

    func sceneWillResignActive(_ scene: UIScene) { }

    func sceneWillEnterForeground(_ scene: UIScene) { }

    func sceneDidEnterBackground(_ scene: UIScene) { }
}

