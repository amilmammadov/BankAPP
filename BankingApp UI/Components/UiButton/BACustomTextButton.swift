//
//  BACustomTextButton.swift
//  BankingApp UI
//
//  Created by Amil Mammadov on 24.04.25.
//

import UIKit

class BACustomTextButton: UIButton {
    
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
        
        backgroundColor = .clear
        setTitleColor(.label, for: .normal)
    }

}
