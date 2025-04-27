//
//  MoneyTransferViewController.swift
//  BankingApp UI
//
//  Created by Amil Mammadov on 23.04.25.
//

import UIKit

final class MoneyTransferViewController: UIViewController {
    
    var viewModel: MoneyTransferViewModel?
    
    private let customerImage = UIImageView()
    private let customerName = BASimpleTextLabel(fontSize: 20, color: .label, isBold: true)
    private let secretPan = BASimpleTextLabel(fontSize: 16, color: .gray)
    
    private let transactionFund = UITextField()
    private let feeCalculationMethod = BASimpleTextLabel(fontSize: 16, color: .gray)
   
    private let selectAccount = BASimpleTextLabel(fontSize: 20, color: .gray)
    private let accountSelectView = AccountSelectView(BankCard.bankCards[0])
    
    private let sendButton = BACustomFilledButton(StringConstants.sendButtonText)

    override func viewDidLoad() {
        super.viewDidLoad()

        configureMoneyTransferViewController()
        configureLayout()
        configure()
        configureTransactionFund()
        setData()
    }
    
    private func setData(){
        
        customerImage.image = UIImage(named: viewModel?.customer?.imageName ?? "")
        customerName.text = viewModel?.customer?.customerName
        
        secretPan.text =  viewModel?.customer?.secretPan
        selectAccount.text = StringConstants.selectAccount
        
        feeCalculationMethod.text = "No fee"
    }
    
    private func configureTransactionFund(){
        
        transactionFund.placeholder = "$ 0.00"
        transactionFund.textAlignment = .center
        transactionFund.delegate = self
    }
    
    private func configureMoneyTransferViewController(){
        
        view.backgroundColor = .secondarySystemBackground
        title = StringConstants.sendMoneyTo
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
    }
    
    private func configure(){
        
        customerImage.layer.cornerRadius = 50
        customerImage.layer.masksToBounds = true
        customerImage.contentMode = .scaleAspectFit
        
        [customerName, secretPan, feeCalculationMethod, selectAccount].forEach { $0.textAlignment = .center }
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleAccountSelectView))
        accountSelectView.addGestureRecognizer(tapGesture)
        
        sendButton.addTarget(self, action: #selector(isSendButtonTapped), for: .touchUpInside)
    }
}

extension MoneyTransferViewController {
    
    @objc func isSendButtonTapped(){
        
        viewModel?.presentTranferStautusPage(benefName: viewModel?.customer?.customerName ?? "", amount: transactionFund.text ?? "", viewController: self)
    }
    
    @objc func handleAccountSelectView(){
        
        viewModel?.presentCustomerAccountsPage(self)
    }
}

extension MoneyTransferViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard let currentText = textField.text else { return true }

            if !currentText.hasPrefix("$") {
                textField.text = "$"
                return false
            }
        
            return true
    }
}

extension MoneyTransferViewController: CustomerAccountsViewControllerDelegate {
    
    func didAccountSelected(_ bankCard: BankCard) {
        accountSelectView.balance.text = bankCard.balance
        accountSelectView.secretPan.text = bankCard.secretPan
        viewModel?.dismissCustomerAccountsPage()
    }
}

extension MoneyTransferViewController: TransferStatusViewControllerDelegate {
    
    func isCloseButtonTapped() {
        viewModel?.dismissAndPopToRoot()
    }
}

extension MoneyTransferViewController {
    
    private func configureLayout(){
        
        view.addSubviews(customerImage, customerName, secretPan, transactionFund, feeCalculationMethod, selectAccount, accountSelectView, sendButton)
        
        NSLayoutConstraint.activate([
            customerImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            customerImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            customerImage.heightAnchor.constraint(equalToConstant: 100),
            customerImage.widthAnchor.constraint(equalToConstant: 100),
            
            customerName.topAnchor.constraint(equalTo: customerImage.bottomAnchor, constant: 16),
            customerName.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            customerName.heightAnchor.constraint(equalToConstant: 32),
            customerName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            secretPan.topAnchor.constraint(equalTo: customerName.bottomAnchor, constant: 4),
            secretPan.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            secretPan.heightAnchor.constraint(equalToConstant: 24),
            secretPan.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            transactionFund.topAnchor.constraint(equalTo: secretPan.bottomAnchor, constant: 20),
            transactionFund.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6),
            transactionFund.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            transactionFund.heightAnchor.constraint(equalToConstant: 44),
            
            feeCalculationMethod.topAnchor.constraint(equalTo: transactionFund.bottomAnchor, constant: 8),
            feeCalculationMethod.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            feeCalculationMethod.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            feeCalculationMethod.heightAnchor.constraint(equalToConstant: 24),
            
            selectAccount.topAnchor.constraint(equalTo: feeCalculationMethod.bottomAnchor, constant: 16),
            selectAccount.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            selectAccount.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            selectAccount.heightAnchor.constraint(equalToConstant: 32),
            
            accountSelectView.topAnchor.constraint(equalTo: selectAccount.bottomAnchor, constant: 20),
            accountSelectView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            accountSelectView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            accountSelectView.heightAnchor.constraint(equalToConstant: 56),
            
            sendButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            sendButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            sendButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            sendButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
}
