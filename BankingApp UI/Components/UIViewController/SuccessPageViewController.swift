//
//  SuccessPageViewController.swift
//  BankingApp UI
//
//  Created by Amil Mammadov on 24.04.25.
//

import UIKit

protocol SuccessPageViewControllerDelegate: AnyObject {
    func didFinishSuccessFlow()
}

final class SuccessPageViewController: UIViewController {
    
    private let imageView = UIImageView()
    private let titleLabel = BASimpleTextLabel(fontSize: 20, color: .label, isBold: true)
    private let viewReceiptButton = BACustomTextButton(StringConstants.viewReceipt)
    private let closeButton = BACustomFilledButton(StringConstants.close)
    
    private let benefName: String
    private let amount: String
    
    weak var delegate: SuccessPageViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLayout()
        configure()
        
        view.backgroundColor = .systemBackground
    }
    
    init(benefName: String, amount: String){
        self.benefName = benefName
        self.amount = amount
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        
        imageView.image = Images.successPageImage
        
        titleLabel.numberOfLines = 2
        titleLabel.text = "\(amount) has been sent to \(benefName)!"
        titleLabel.textAlignment = .center
        
        closeButton.addTarget(self, action: #selector(isCloseButtonTapped), for: .touchUpInside)
    }
}

extension SuccessPageViewController {
    
    @objc func isCloseButtonTapped(){
        dismiss(animated: true)
        delegate?.didFinishSuccessFlow()
    }
}

extension SuccessPageViewController {
    
    private func configureLayout(){
        
        view.addSubviews(imageView, titleLabel, viewReceiptButton, closeButton)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 140),
            imageView.widthAnchor.constraint(equalToConstant: 140),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 60),
            titleLabel.widthAnchor.constraint(equalToConstant: 240),
            
            viewReceiptButton.bottomAnchor.constraint(equalTo: closeButton.topAnchor, constant: -12),
            viewReceiptButton.leadingAnchor.constraint(equalTo: closeButton.leadingAnchor),
            viewReceiptButton.trailingAnchor.constraint(equalTo: closeButton.trailingAnchor),
            viewReceiptButton.heightAnchor.constraint(equalToConstant: 56),
            
            closeButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            closeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            closeButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
}
