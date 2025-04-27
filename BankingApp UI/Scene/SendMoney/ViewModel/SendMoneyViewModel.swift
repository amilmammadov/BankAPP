//
//  SendMoneyViewModel.swift
//  BankingApp UI
//
//  Created by Amil Mammadov on 27.04.25.
//

import Foundation

protocol SendMoneyViewModelProtocol {
    func navigateToMoneyTransfer(_ customer: Customer)
}

final class SendMoneyViewModel: SendMoneyViewModelProtocol {
    
    var sendMoneyCoordinator: SendMoneyCoordinator?
    
    func navigateToMoneyTransfer(_ customer: Customer) {
        
        sendMoneyCoordinator?.navigateToMoneyTransferPage(customer)
    }
}
