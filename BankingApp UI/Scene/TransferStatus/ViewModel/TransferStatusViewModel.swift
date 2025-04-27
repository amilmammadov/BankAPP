//
//  TransferStatusViewModel.swift
//  BankingApp UI
//
//  Created by Amil Mammadov on 26.04.25.
//

import Foundation

protocol TransferStatusViewModelProtocol {
    var benefName: String? { get set }
    var amount: String? { get set }
}

final class TransferStatusViewModel: TransferStatusViewModelProtocol {
    
    var benefName: String?
    var amount: String?
}
