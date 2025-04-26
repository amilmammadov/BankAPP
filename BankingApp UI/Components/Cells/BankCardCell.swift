//
//  BankCardCell.swift
//  BankingApp UI
//
//  Created by Amil Mammadov on 20.04.25.
//

import UIKit

final class BankCardCell: UICollectionViewCell {
    
    static let reuseId = "BankCardCell"
    
    private let imageView = UIImageView(image: Images.masterCardLogo)
    private let secretPan = BASimpleTextLabel(fontSize: 24, color: .white)
    private let expireDate = BASimpleTextLabel(fontSize: 24, color: .white)
    private let balanceTitle = BASimpleTextLabel(fontSize: 24, color: .white)
    private let balance = BASimpleTextLabel(fontSize: 32, color: .white, isBold: true)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureLayout()
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(_ bankCard: BankCard){
        self.secretPan.text = bankCard.secretPan
        self.expireDate.text = bankCard.expireDate
        self.balance.text = "\(bankCard.balance)"
        self.backgroundColor = bankCard.cardColor
    }
    
    private func configure(){
        
        imageView.image = Images.masterCardLogo
        self.balanceTitle.text = StringConstants.balance
        
        layer.cornerRadius = 16
        layer.masksToBounds = true
    }
    
    private func configureLayout(){
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubviews(imageView, secretPan, expireDate, balanceTitle, balance)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            imageView.heightAnchor.constraint(equalToConstant: 28),
            imageView.widthAnchor.constraint(equalToConstant: 44),
            
            secretPan.centerYAnchor.constraint(equalTo: imageView.centerYAnchor),
            secretPan.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 16),
            secretPan.heightAnchor.constraint(equalToConstant: 28),
            secretPan.trailingAnchor.constraint(equalTo: expireDate.leadingAnchor),
            
            expireDate.centerYAnchor.constraint(equalTo: secretPan.centerYAnchor),
            expireDate.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            expireDate.heightAnchor.constraint(equalToConstant: 28),
            expireDate.widthAnchor.constraint(equalToConstant: 80),
            
            balanceTitle.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 32),
            balanceTitle.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            balanceTitle.heightAnchor.constraint(equalToConstant: 28),
            balanceTitle.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -20),
            
            balance.topAnchor.constraint(equalTo: balanceTitle.bottomAnchor, constant: 12),
            balance.leadingAnchor.constraint(equalTo: balanceTitle.leadingAnchor),
            balance.heightAnchor.constraint(equalToConstant: 36),
            balance.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -20)
        ])
    }
}
