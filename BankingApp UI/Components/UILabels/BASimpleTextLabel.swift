//
//  BASimpleTextLabel.swift
//  BankingApp UI
//
//  Created by Amil Mammadov on 20.04.25.
//

import UIKit

final class BASimpleTextLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    convenience init(fontSize: CGFloat, color: UIColor, isBold: Bool = false){
        self.init(frame: .zero)
        
        textColor = color
        font = UIFont.systemFont(ofSize: fontSize, weight: isBold ? .bold : .light)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        translatesAutoresizingMaskIntoConstraints = false
    }
}
