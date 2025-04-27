//
//  MoneyTransferCoordinator.swift
//  BankingApp UI
//
//  Created by Amil Mammadov on 27.04.25.
//

import UIKit

final class MoneyTransferCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    private let customer: Customer
    
    init(navigationController: UINavigationController, customer: Customer) {
        self.navigationController = navigationController
        self.customer = customer
    }
    
    func start() {
        
        let moneyTransferViewController = MoneyTransferViewController()
        let moneyTransferViewModel = MoneyTransferViewModel()
        moneyTransferViewController.viewModel = moneyTransferViewModel
        moneyTransferViewModel.customer = customer
        moneyTransferViewModel.moneyTransferCoordinator = self
        navigationController.pushViewController(moneyTransferViewController, animated: true)
    }
    
    func presentTransferStatusPage(benefName: String, amount: String, viewController: UIViewController & TransferStatusViewControllerDelegate){
        
        let transferStatusCoordinator = TransferStatusCoordinator(navigationController: navigationController, benefName: benefName, amount: amount, viewController: viewController)
        transferStatusCoordinator.start()
    }
    
    func presentCustomerAccounts(_ viewController: UIViewController & CustomerAccountsViewControllerDelegate){
        
        let customerAccountsCoordinator = CustomerAccountsCoordinator(navigationController: navigationController, viewController: viewController)
        customerAccountsCoordinator.start()
    }
    
    func dismissCustomerAccounts(){
        navigationController.dismiss(animated: true)
    }
    
    func dismissAndPopToRoot(){
        navigationController.dismiss(animated: true)
        navigationController.popToRootViewController(animated: false)
    }
}
