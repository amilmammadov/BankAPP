//
//  TransferStatusViewModel.swift
//  BankingApp UI
//
//  Created by Amil Mammadov on 26.04.25.
//

import Foundation

final class TransferStatusViewModel {
    
    let benefName: String
    let amount: String
    
    init(benefName: String, amount: String) {
        self.benefName = benefName
        self.amount = amount
    }
}
