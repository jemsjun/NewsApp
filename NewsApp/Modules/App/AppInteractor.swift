//
//  AppInteractor.swift
//  NewsApp
//
//  Created by James Junior on 11/03/23.
//

import Foundation
import UIKit

class AppInteractor {
    private var coordinator: AppCoordinatorProtocol?
    private weak var windowScene: UIWindowScene!
    
    init(windowScene: UIWindowScene) {
        self.windowScene = windowScene
        self.coordinator = AppCoordinator()
        
        self.createHomePage()
    }
    
    func createHomePage() {
        self.coordinator?.setRootVC(scene: self.windowScene)
    }
}
