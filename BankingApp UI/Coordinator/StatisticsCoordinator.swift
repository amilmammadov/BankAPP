//
//  StatisticsCoordinator.swift
//  BankingApp UI
//
//  Created by Amil Mammadov on 27.04.25.
//

import UIKit

final class StatisticsCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        
        let statisticsViewController = StatisticsViewController()
        navigationController.viewControllers = [statisticsViewController]
    }
}
