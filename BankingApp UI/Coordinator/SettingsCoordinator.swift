//
//  SettingsCoordinator.swift
//  BankingApp UI
//
//  Created by Amil Mammadov on 27.04.25.
//

import UIKit

final class SettingsCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        
        let settingsViewController = SettingsViewController()
        navigationController.viewControllers = [settingsViewController]
    }
}
