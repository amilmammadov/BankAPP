//
//  MyAccountsViewModel.swift
//  BankingApp UI
//
//  Created by Amil Mammadov on 27.04.25.
//

import Foundation

protocol MyAccountsViewModelProtocol {
    func navigateToSendMoneyPage()
}

final class MyAccountsViewModel: MyAccountsViewModelProtocol{
    
    var myAccountsCoordinator: MyAccountsCoordinator?
    
    func navigateToSendMoneyPage() {
        
        myAccountsCoordinator?.navigateToSendMoneyPage()
    }
}
