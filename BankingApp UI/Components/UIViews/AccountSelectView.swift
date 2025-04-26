//
//  AccountSelectView.swift
//  BankingApp UI
//
//  Created by Amil Mammadov on 23.04.25.
//

import UIKit


class AccountSelectView: UIView {
    
    private let imageView = UIImageView()
    var secretPan = BASimpleTextLabel(fontSize: 16, color: .label, isBold: true)
    var balance = BASimpleTextLabel(fontSize: 16, color: .gray)
    private let rightIconView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureLayout()
        configure()
        configureShadow()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(_ bankCard: BankCard){
        self.init(frame: .zero)
        
        self.secretPan.text = bankCard.secretPan
        self.balance.text = bankCard.balance
        
    }
    
    private func configure(){
        
        imageView.image = Images.masterCardLogo
        rightIconView.image = Images.dropDown
        rightIconView.tintColor = .label
        rightIconView.contentMode = .scaleAspectFit
        
        backgroundColor = .systemBackground
        layer.cornerRadius = 16
        layer.masksToBounds = true
    }
    
    private func configureShadow(){
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = .zero
        layer.shadowRadius = 8  
        layer.masksToBounds = false
    }
    
    private func configureLayout(){
        
        addSubviews(imageView, secretPan, balance, rightIconView)
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 14),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -14),
            imageView.heightAnchor.constraint(equalToConstant: 24),
            imageView.widthAnchor.constraint(equalToConstant: 40),
            
            secretPan.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            secretPan.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 8),
            secretPan.heightAnchor.constraint(equalToConstant: 20),
            secretPan.trailingAnchor.constraint(equalTo: rightIconView.leadingAnchor),
            
            balance.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            balance.leadingAnchor.constraint(equalTo: secretPan.leadingAnchor),
            balance.heightAnchor.constraint(equalToConstant: 20),
            balance.trailingAnchor.constraint(equalTo: rightIconView.leadingAnchor),
            
            rightIconView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            rightIconView.widthAnchor.constraint(equalToConstant: 16),
            rightIconView.heightAnchor.constraint(equalToConstant: 16),
            rightIconView.centerYAnchor.constraint(equalTo: imageView.centerYAnchor)
        ])
    }
}
