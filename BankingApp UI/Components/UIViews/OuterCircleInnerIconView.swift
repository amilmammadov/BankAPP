//
//  OuterCircleInnerIconView.swift
//  BankingApp UI
//
//  Created by Amil Mammadov on 21.04.25.
//

import UIKit

final class OuterCircleInnerIconView: UIView {
    
    let innerView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.size.height / 2
        layer.masksToBounds = true
        backgroundColor = .white
    }
    
    private func configureLayout(){
        addSubview(innerView)
        innerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            innerView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            innerView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            innerView.heightAnchor.constraint(equalToConstant: 24),
            innerView.widthAnchor.constraint(equalToConstant: 24)
        ])
    }
}
