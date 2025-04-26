//
//  BACustomSearchBar.swift
//  BankingApp UI
//
//  Created by Amil Mammadov on 22.04.25.
//

import UIKit

final class BACustomSearchBar: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureRightView()
        configureLeftView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(placeholder: String){
        self.init(frame: .zero)
        
        configure(placeholder)
    }
    
    private func configure(_ placeholder: String){
        
        self.placeholder = placeholder
        let attributes: [NSAttributedString.Key:Any] = [.foregroundColor:UIColor.black.withAlphaComponent(0.5)]
        attributedPlaceholder = NSAttributedString(string: placeholder, attributes: attributes)
        
        layer.cornerRadius = 16
        layer.masksToBounds = true
        backgroundColor = .gray.withAlphaComponent(0.4)
    }
    
    private func configureRightView(){
        
        let rightImageView = UIImageView(image: Images.search)
        rightImageView.tintColor = .black.withAlphaComponent(0.5)
        rightImageView.frame =  CGRect(x: 12, y: 12, width: 20, height: 20)
        rightImageView.contentMode = .scaleAspectFit
        
        let rightContainerView = UIView(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        rightContainerView.addSubview(rightImageView)
        
        rightView = rightContainerView
        rightViewMode = .always
    }
    
    private func configureLeftView(){
        
        let leftContainerView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 44))
        leftView = leftContainerView
        leftViewMode = .always
    }
}
