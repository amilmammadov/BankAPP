//
//  UIStackView + Ext.swift
//  BankingApp UI
//
//  Created by Amil Mammadov on 21.04.25.
//

import UIKit

extension UIStackView {
    func addViewsToStack(_ views: UIView...){
        for view in views {
            self.addArrangedSubview(view)
        }
    }
}
