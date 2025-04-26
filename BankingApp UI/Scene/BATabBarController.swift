//
//  BATabBarController.swift
//  BankingApp UI
//
//  Created by Amil Mammadov on 20.04.25.
//

import UIKit

class BATabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }
    
    private func configure(){
        
        viewControllers = [
            configureAccountsViewController(),
            configureStatisticsViewController(),
            configureCashbacksViewController(),
            configureSettingsViewController()
        ]
        
        tabBar.backgroundColor = .systemBackground
    }
    
    private func configureAccountsViewController() -> UINavigationController {
        let accountsViewController = AccountsViewController()
        accountsViewController.tabBarItem = UITabBarItem(title: StringConstants.accounts, image: Images.accounts, tag: 0)
        return UINavigationController(rootViewController: accountsViewController)
    }
    
    private func configureStatisticsViewController() -> UINavigationController {
        let statisticsViewController = StatisticsViewController()
        statisticsViewController.tabBarItem = UITabBarItem(title: StringConstants.statistics, image: Images.statistics, tag: 1)
        return UINavigationController(rootViewController: statisticsViewController)
    }
    
    private func configureCashbacksViewController() -> UINavigationController {
        let cashbacksViewController = CasbackViewController()
        cashbacksViewController.tabBarItem = UITabBarItem(title: StringConstants.cashbacks, image: Images.cashbacks, tag: 2)
        return UINavigationController(rootViewController: cashbacksViewController)
    }
    
    private func configureSettingsViewController() -> UINavigationController {
        let settingsViewController = SettingsViewController()
        settingsViewController.tabBarItem = UITabBarItem(title: StringConstants.settings, image: Images.settings, tag: 3)
        return UINavigationController(rootViewController: settingsViewController)
    }
}
