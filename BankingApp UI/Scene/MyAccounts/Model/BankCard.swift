//
//  BankCard.swift
//  BankingApp UI
//
//  Created by Amil Mammadov on 20.04.25.
//

import UIKit

struct BankCard {
    let secretPan: String
    let expireDate: String
    let balance: String
    let cardColor: UIColor
    
    static let bankCards: [BankCard] = [
        .init(secretPan: "**** 2236", expireDate: "02/24", balance: "$ 53000.00", cardColor: .blue),
        .init(secretPan: "**** 2237", expireDate: "03/24", balance: "$ 54000.00", cardColor: .black.withAlphaComponent(0.8)),
        .init(secretPan: "**** 2238", expireDate: "04/24", balance: "$ 55000.00", cardColor: .gray),
        .init(secretPan: "**** 2239", expireDate: "05/24", balance: "$ 56000.00", cardColor: .brown),
    ]
}
