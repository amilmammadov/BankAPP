//
//  Customer.swift
//  BankingApp UI
//
//  Created by Amil Mammadov on 23.04.25.
//

import Foundation


struct Customer {
    let imageName: String
    let customerName: String
    let secretPan: String
    
    static let customers:[Customer] = [
        .init(imageName: "Avatar4", customerName: "Rebecca Hale", secretPan: "1234 **** **** 5678"),
        .init(imageName: "Avatar5", customerName: "Olivia Taylor", secretPan: "1234 **** **** 5674"),
        .init(imageName: "Avatar6", customerName: "Elaine Covington", secretPan: "4234 **** **** 8678"),
        .init(imageName: "Avatar7", customerName: "Robert Cooper", secretPan: "1534 **** **** 5478"),
        .init(imageName: "Avatar8", customerName: "Austin Cannon", secretPan: "9234 **** **** 5678"),
        .init(imageName: "Avatar9", customerName: "Nadia Page", secretPan: "8234 **** **** 5679"),
        .init(imageName: "Avatar10", customerName: "Donald Waters", secretPan: "4534 **** **** 1278"),
        .init(imageName: "Avatar11", customerName: "Wayne Alvarado", secretPan: "7654 **** **** 1238"),
        .init(imageName: "Avatar12", customerName: "Maria Charles", secretPan: "9874 **** **** 3458")
    ]
}
