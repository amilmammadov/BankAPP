//
//  CustomerAccountCell.swift
//  BankingApp UI
//
//  Created by Amil Mammadov on 24.04.25.
//

import UIKit

class CustomerAccountCell: UITableViewCell {
    
    static let reuseId = "CustomerAccountCell"
    
    private let cardSystemView = UIImageView()
    private let secretPan = BASimpleTextLabel(fontSize: 16, color: .label, isBold: true)
    private let balance = BASimpleTextLabel(fontSize: 16, color: .gray)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier   )
        
        configureLayout()
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(_ bankCard: BankCard){
        
        self.secretPan.text = bankCard.secretPan
        self.balance.text = bankCard.balance
        
    }
    
    private func configure(){
        
        backgroundColor = .systemBackground
        
        cardSystemView.image = Images.masterCardLogo
        
        balance.textAlignment = .right
    }
    
    private func configureLayout(){
        
        addSubviews(cardSystemView, secretPan, balance)
        
        NSLayoutConstraint.activate([
            cardSystemView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            cardSystemView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            cardSystemView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            cardSystemView.heightAnchor.constraint(equalToConstant: 24),
            cardSystemView.widthAnchor.constraint(equalToConstant: 40),
            
            secretPan.centerYAnchor.constraint(equalTo: cardSystemView.centerYAnchor),
            secretPan.leadingAnchor.constraint(equalTo: cardSystemView.trailingAnchor, constant: 8),
            secretPan.heightAnchor.constraint(equalToConstant: 20),
            secretPan.trailingAnchor.constraint(equalTo: balance.leadingAnchor),
            
            balance.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5),
            balance.centerYAnchor.constraint(equalTo: secretPan.centerYAnchor),
            balance.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            balance.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
}
