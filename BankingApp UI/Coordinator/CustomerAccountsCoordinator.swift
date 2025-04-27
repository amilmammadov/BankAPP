//
//  CustomerAccountsCoordinator.swift
//  BankingApp UI
//
//  Created by Amil Mammadov on 27.04.25.
//

import UIKit

final class CustomerAccountsCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    private var viewController: UIViewController & CustomerAccountsViewControllerDelegate
    
    init(navigationController: UINavigationController, viewController: UIViewController & CustomerAccountsViewControllerDelegate) {
        self.navigationController = navigationController
        self.viewController = viewController
    }
    
    func start() {
        
        let customerAccountsViewController = CustomerAccountsViewController()
        customerAccountsViewController.delegate = viewController
        if let sheet = customerAccountsViewController.sheetPresentationController {
            sheet.detents = [.medium()]
        }
        navigationController.present(customerAccountsViewController, animated: true)
    }
}
