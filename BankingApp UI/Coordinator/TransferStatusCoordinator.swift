//
//  TransferStatusCoordinator.swift
//  BankingApp UI
//
//  Created by Amil Mammadov on 27.04.25.
//

import UIKit

final class TransferStatusCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    private var viewController: UIViewController & TransferStatusViewControllerDelegate
    private var benefName: String
    private var amount: String
    
    init(navigationController: UINavigationController, benefName: String, amount: String, viewController: UIViewController & TransferStatusViewControllerDelegate) {
        self.navigationController = navigationController
        self.viewController = viewController
        self.benefName = benefName
        self.amount = amount
    }
    
    func start() {
        
        let transferStatusViewController = TransferStatusViewController()
        let transferStatusViewModel = TransferStatusViewModel()
        transferStatusViewController.delegate = viewController
        transferStatusViewController.viewModel = transferStatusViewModel
        transferStatusViewModel.amount = amount
        transferStatusViewModel.benefName = benefName
        transferStatusViewController.modalPresentationStyle = .overFullScreen
        navigationController.present(transferStatusViewController, animated: true)
    }
}
