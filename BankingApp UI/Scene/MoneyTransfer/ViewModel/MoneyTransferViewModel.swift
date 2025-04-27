//
//  MoneyTransferViewModel.swift
//  BankingApp UI
//
//  Created by Amil Mammadov on 26.04.25.
//

import UIKit

protocol MoneyTransferViewModelProtocol {
    func presentTranferStautusPage(benefName: String, amount: String, viewController: UIViewController & TransferStatusViewControllerDelegate)
    func presentCustomerAccountsPage(_ viewController: UIViewController & CustomerAccountsViewControllerDelegate)
    func dismissCustomerAccountsPage()
    var customer: Customer? { get set }
}

final class MoneyTransferViewModel: MoneyTransferViewModelProtocol {

    var customer: Customer?
    var moneyTransferCoordinator: MoneyTransferCoordinator?
    
    func presentTranferStautusPage(benefName: String, amount: String, viewController: UIViewController & TransferStatusViewControllerDelegate) {
        
        moneyTransferCoordinator?.presentTransferStatusPage(benefName: benefName, amount: amount, viewController: viewController)
    }
    
    func presentCustomerAccountsPage(_ viewController: UIViewController & CustomerAccountsViewControllerDelegate){
        moneyTransferCoordinator?.presentCustomerAccounts(viewController)
    }
        
    func dismissCustomerAccountsPage(){
        moneyTransferCoordinator?.dismissCustomerAccounts()
    }
    
    func dismissAndPopToRoot(){
        moneyTransferCoordinator?.dismissAndPopToRoot()
    }
}
