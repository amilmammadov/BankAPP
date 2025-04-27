//
//  AppCoordinator.swift
//  BankingApp UI
//
//  Created by Amil Mammadov on 27.04.25.
//

import UIKit

final class AppCoordinator {
    
    private var window: UIWindow
    private var tabBarController: BATabBarController
    
    init(window: UIWindow) {
        self.window = window
        self.tabBarController = BATabBarController()
    }
    
    func start() {
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
    }
}
