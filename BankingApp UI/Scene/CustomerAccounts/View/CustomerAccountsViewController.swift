//
//  CustomerAccountsViewController.swift
//  BankingApp UI
//
//  Created by Amil Mammadov on 24.04.25.
//

import UIKit

protocol CustomerAccountsViewControllerDelegate: AnyObject {
    func didAccountSelected(_ bankCard: BankCard)
}

final class CustomerAccountsViewController: UIViewController {
    
    private let customerAccountsTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CustomerAccountCell.self, forCellReuseIdentifier: CustomerAccountCell.reuseId)
        return tableView
    }()
    
    weak var delegate: CustomerAccountsViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        configureCustomerAccountsViewController()
        configureLayout()
    }
    
    private func configureCustomerAccountsViewController(){
        
        customerAccountsTableView.dataSource = self
        customerAccountsTableView.delegate = self
        customerAccountsTableView.rowHeight = 56
    }
}

extension CustomerAccountsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        BankCard.bankCards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = customerAccountsTableView.dequeueReusableCell(withIdentifier: CustomerAccountCell.reuseId) as? CustomerAccountCell else { return UITableViewCell() }
        cell.setData(BankCard.bankCards[indexPath.item])
        cell.selectionStyle = .none
        return cell
    }
}

extension CustomerAccountsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        delegate?.didAccountSelected(BankCard.bankCards[indexPath.item])
    }
}

extension CustomerAccountsViewController {
    
    private func configureLayout(){
        
        view.addSubviews(customerAccountsTableView)
        NSLayoutConstraint.activate([
            customerAccountsTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            customerAccountsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            customerAccountsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            customerAccountsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
