//
//  BAButton.swift
//  BankingApp UI
//
//  Created by Amil Mammadov on 24.04.25.
//

import UIKit

class BACustomFilledButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(_ title: String){
        self.init(frame: .zero)
        
        setTitle(title, for: .normal)
    }
    
    private func configure(){
        
        backgroundColor = .systemBlue
        
        setTitleColor(.white, for: .normal)
        
        layer.cornerRadius = 16
        layer.masksToBounds = true
    }
}
