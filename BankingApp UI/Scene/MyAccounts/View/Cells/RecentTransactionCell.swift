//
//  RecentTransactionCell.swift
//  BankingApp UI
//
//  Created by Amil Mammadov on 21.04.25.
//

import UIKit

final class RecentTransactionCell: UITableViewCell {
    
    static let reuseId = "RecentTransactionCell"
    
    private let image = UIImageView()
    private let titleLabel = UILabel()
    private let subtitle = UILabel()
    private let amountLabel = UILabel()
    
    private let spaceView = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureLayout()
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(_ recentTransaction: RecentTransaction){
        
        self.image.image = recentTransaction.image
        self.titleLabel.text = recentTransaction.holder
        self.subtitle.text = recentTransaction.description
        self.amountLabel.text = recentTransaction.amount
    }
    
    private func configure(){
        
        titleLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        subtitle.font = UIFont.preferredFont(forTextStyle: .footnote)
        subtitle.textColor = .gray
        
        amountLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        amountLabel.textAlignment = .right
        
        spaceView.backgroundColor = .clear
    }
    
    private func configureLayout(){
        
        addSubviews(image, titleLabel, subtitle, amountLabel, spaceView)
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: self.topAnchor),
            image.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            image.bottomAnchor.constraint(equalTo: spaceView.topAnchor),
            image.heightAnchor.constraint(equalToConstant: 44),
            image.widthAnchor.constraint(equalToConstant: 44),
            
            titleLabel.topAnchor.constraint(equalTo: image.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 8),
            titleLabel.heightAnchor.constraint(equalToConstant: 24),
            titleLabel.trailingAnchor.constraint(equalTo: amountLabel.leadingAnchor),
            
            subtitle.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            subtitle.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            subtitle.heightAnchor.constraint(equalToConstant: 20),
            subtitle.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            amountLabel.topAnchor.constraint(equalTo: titleLabel.topAnchor),
            amountLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            amountLabel.heightAnchor.constraint(equalToConstant: 24),
            amountLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/3),
            
            spaceView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            spaceView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            spaceView.widthAnchor.constraint(equalTo: self.widthAnchor),
            spaceView.heightAnchor.constraint(equalToConstant: 16)
        ])
    }
}
