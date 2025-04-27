//
//  BATabBarController.swift
//  BankingApp UI
//
//  Created by Amil Mammadov on 20.04.25.
//

import UIKit

struct TabItem {
    let title: String
    let image: UIImage
}

class BATabBarController: UITabBarController {
    
    private let tabBarTabs: [TabItem] = [
        .init(title: StringConstants.accounts, image: Images.accounts ?? UIImage()),
        .init(title: StringConstants.statistics, image: Images.statistics ?? UIImage()),
        .init(title: StringConstants.cashbacks, image: Images.cashbacks ?? UIImage()),
        .init(title: StringConstants.settings, image: Images.settings ?? UIImage()),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.backgroundColor = .systemBackground
        configureCoordinators()
    }
    
    private func configureCoordinators(){
        
        let myAccountsCoordinator = MyAccountsCoordinator(navigationController: UINavigationController())
        myAccountsCoordinator.start()
        
        let statisticsCoordinator = StatisticsCoordinator(navigationController: UINavigationController())
        statisticsCoordinator.start()
        
        let cashbacksCoordinator = CashbacksCoordinator(navigationController: UINavigationController())
        cashbacksCoordinator.start()
        
        let settingsCoordinator = SettingsCoordinator(navigationController: UINavigationController())
        settingsCoordinator.start()
        
        viewControllers = [
            myAccountsCoordinator.navigationController,
            statisticsCoordinator.navigationController,
            cashbacksCoordinator.navigationController,
            settingsCoordinator.navigationController
        ]
        
        viewControllers?.enumerated().forEach({ index, viewController in
            
            let tabData = tabBarTabs[index]
            
            viewController.tabBarItem = UITabBarItem(title: tabData.title, image: tabData.image, tag: index)
        })
    }
}
