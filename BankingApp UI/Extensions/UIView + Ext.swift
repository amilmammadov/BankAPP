//
//  UIView + Ext.swift
//  BankingApp UI
//
//  Created by Amil Mammadov on 20.04.25.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...){
        for view in views {
            self.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}
