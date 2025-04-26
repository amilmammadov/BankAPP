//
//  CustomerCell.swift
//  BankingApp UI
//
//  Created by Amil Mammadov on 23.04.25.
//

import UIKit

final class CustomerCell: UITableViewCell {
    
    static let reuseId = "CustomerCell"
    
    private let customerImage = UIImageView()
    private let customerName = BASimpleTextLabel(fontSize: 16, color: .label, isBold: true)
    private let space = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureLayout()
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(_ customer: Customer){
        
        customerImage.image = UIImage(named: customer.imageName)
        customerName.text = customer.customerName
    }
    
    private func configure(){
        
        layer.cornerRadius = self.frame.size.width / 2
        layer.masksToBounds = true
        space.backgroundColor = .clear
    }
    
    private func configureLayout(){
        
        addSubviews(customerImage, customerName, space)
        
        NSLayoutConstraint.activate([
            customerImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            customerImage.topAnchor.constraint(equalTo: self.topAnchor),
            customerImage.bottomAnchor.constraint(equalTo: space.topAnchor),
            customerImage.widthAnchor.constraint(equalToConstant: 40),
            
            customerName.centerYAnchor.constraint(equalTo: customerImage.centerYAnchor),
            customerName.leadingAnchor.constraint(equalTo: customerImage.trailingAnchor, constant: 16),
            customerName.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            customerName.topAnchor.constraint(equalTo: customerImage.topAnchor),
            customerName.bottomAnchor.constraint(equalTo: customerImage.bottomAnchor),
            
            space.widthAnchor.constraint(equalTo: self.widthAnchor),
            space.heightAnchor.constraint(equalToConstant: 16),
            space.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            space.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
