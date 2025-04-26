//
//  BALeftTitleRightIconView.swift
//  BankingApp UI
//
//  Created by Amil Mammadov on 21.04.25.
//

import UIKit

final class BALeftTitleRightIconView: UIView {
    
    private let titleLabel = BASimpleTextLabel(fontSize: 24, color: .label, isBold: true)
    private let iconView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(title: String, image: UIImage){
        self.init(frame: .zero)
        
        titleLabel.text = title
        iconView.image = image.withRenderingMode(.alwaysTemplate)
        iconView.tintColor = .label
    }
    
    private func configureLayout(){
        
        addSubviews(titleLabel, iconView)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 36),
            titleLabel.trailingAnchor.constraint(equalTo: iconView.leadingAnchor, constant: -4),
            
            iconView.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            iconView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            iconView.heightAnchor.constraint(equalToConstant: 24),
            iconView.widthAnchor.constraint(equalToConstant: 24)
        ])
    }
}
