//
//  CashbacksCoordinator.swift
//  BankingApp UI
//
//  Created by Amil Mammadov on 27.04.25.
//

import UIKit

final class CashbacksCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        
        let cashbacksViewController = CashbackViewController()
        navigationController.viewControllers = [cashbacksViewController]
    }
}
