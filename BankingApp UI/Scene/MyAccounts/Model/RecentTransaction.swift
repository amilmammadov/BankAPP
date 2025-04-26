//
//  RecentTransaction.swift
//  BankingApp UI
//
//  Created by Amil Mammadov on 21.04.25.
//

import UIKit

struct RecentTransaction {
    let image: UIImage
    let holder: String
    let description: String
    let amount: String
    
    static let recentTransactions:[RecentTransaction] = [
        .init(image: Images.avatar1 ?? UIImage(), holder: "Neftlix", description: "Entertainment", amount: "- $10"),
        .init(image: Images.avatar2 ?? UIImage(), holder: "Maria Charles", description: "Card transfer", amount: "- $100"),
        .init(image: Images.avatar3 ?? UIImage(), holder: "Walmart", description: "Groceries and supermarkets", amount: "- $50")
    ]
}
