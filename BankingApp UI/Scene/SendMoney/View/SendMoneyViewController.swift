//
//  SendViewController.swift
//  BankingApp UI
//
//  Created by Amil Mammadov on 22.04.25.
//

import UIKit

final class SendMoneyViewController: UIViewController {
    
    private let searchBar = BACustomSearchBar(placeholder: StringConstants.writeNamePhoneOrCardNumber)
    private let customersTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CustomerCell.self, forCellReuseIdentifier: CustomerCell.reuseId)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        configureSendMoneyViewController()
        configureLayout()
        configureCustomersTableView()
    }
    
    private func configureCustomersTableView(){
        
        customersTableView.delegate = self
        customersTableView.dataSource  = self
        customersTableView.rowHeight = 56
        customersTableView.separatorStyle = .none
    }
    
    private func configureSendMoneyViewController(){
        
        view.backgroundColor = .systemBackground
        title = StringConstants.sendMoneyTo
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
    }
}

extension SendMoneyViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Customer.customers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = customersTableView.dequeueReusableCell(withIdentifier: CustomerCell.reuseId) as? CustomerCell else { return UITableViewCell() }
        cell.accessoryType = .disclosureIndicator
        cell.selectionStyle = .none
        cell.setData(Customer.customers[indexPath.item])
        return cell
    }
}

extension SendMoneyViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let moneyTransferViewController = MoneyTransferViewController(customer: Customer.customers[indexPath.item])
        navigationController?.pushViewController(moneyTransferViewController, animated: true)
    }
}

extension SendMoneyViewController {
    
    private func configureLayout(){
        
        view.addSubviews(searchBar, customersTableView)
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            searchBar.heightAnchor.constraint(equalToConstant: 56),
            
            customersTableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 32),
            customersTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            customersTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            customersTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
