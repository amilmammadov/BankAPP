//
//  SendMoneyCoordinator.swift
//  BankingApp UI
//
//  Created by Amil Mammadov on 27.04.25.
//

import UIKit

final class SendMoneyCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        
        let sendMoneyViewController = SendMoneyViewController()
        let sendMoneyViewModel = SendMoneyViewModel()
        sendMoneyViewController.sendMoneyViewModel = sendMoneyViewModel
        sendMoneyViewModel.sendMoneyCoordinator = self
        navigationController.pushViewController(sendMoneyViewController, animated: true)
    }
    
    func  navigateToMoneyTransferPage(_ customer: Customer){
        
        let moneyTransferCoordinator = MoneyTransferCoordinator(navigationController: navigationController, customer: customer)
        moneyTransferCoordinator.start()
    }
}
