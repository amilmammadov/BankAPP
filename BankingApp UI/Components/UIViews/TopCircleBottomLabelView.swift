//
//  TopCircleBottomLabelView.swift
//  BankingApp UI
//
//  Created by Amil Mammadov on 21.04.25.
//

import UIKit

class TopCircleBottomLabelView: UIView {
    
    private let topView = OuterCircleInnerIconView()
    private let titleLabel = BASimpleTextLabel(fontSize: 14, color: .black)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureLayout()
        configure()
    }
    
    convenience init(image: UIImage, title: String){
        self.init(frame: .zero)
        
        topView.innerView.image = image
        titleLabel.text = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        titleLabel.textAlignment = .center
        titleLabel.textColor = .label
    }
    
    private func configureLayout(){
        
        addSubviews(topView, titleLabel)
        NSLayoutConstraint.activate([
            topView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            topView.topAnchor.constraint(equalTo: self.topAnchor),
            topView.heightAnchor.constraint(equalToConstant: 64),
            topView.widthAnchor.constraint(equalToConstant: 64),
            
            titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            titleLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}
