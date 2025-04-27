//
//  MyAccountsCoordinator.swift
//  BankingApp UI
//
//  Created by Amil Mammadov on 27.04.25.
//

import UIKit

final class MyAccountsCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        
        let myAccountsViewController = MyAccountsViewController()
        myAccountsViewController.tabBarItem = UITabBarItem(title: StringConstants.accounts, image: Images.accounts, tag: 0)
        navigationController.viewControllers = [myAccountsViewController]
        
        let myAccountsViewModel = MyAccountsViewModel()
        myAccountsViewController.myAccountsViewModel = myAccountsViewModel
        myAccountsViewModel.myAccountsCoordinator = self
        
        
    }
    
    func navigateToSendMoneyPage(){
    
        let sendMoneyCoordinator = SendMoneyCoordinator(navigationController: navigationController)
        sendMoneyCoordinator.start()
    }
}
