//
//  RecentTransactionView.swift
//  BankingApp UI
//
//  Created by Amil Mammadov on 21.04.25.
//

import UIKit

final class RecentTransactionView: UIView {
    
    private let titleAndIconView = BALeftTitleRightIconView(title: StringConstants.recentTransactions, image: Images.search ?? UIImage())
    private let recentTranasctionsTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(RecentTransactionCell.self, forCellReuseIdentifier: RecentTransactionCell.reuseId)
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureLayout()
        configureRecentTransactionsTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        layer.cornerRadius = 24
        backgroundColor = .systemBackground
    }
    
    private func configureRecentTransactionsTableView(){
        
        
        recentTranasctionsTableView.dataSource = self
        
        recentTranasctionsTableView.rowHeight = 64
        recentTranasctionsTableView.separatorStyle = .none
    }
    
    private func configureLayout(){
        
        addSubviews(titleAndIconView, recentTranasctionsTableView)
        
        NSLayoutConstraint.activate([
            titleAndIconView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            titleAndIconView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            titleAndIconView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            titleAndIconView.heightAnchor.constraint(equalToConstant: 36),
            
            recentTranasctionsTableView.topAnchor.constraint(equalTo: titleAndIconView.bottomAnchor, constant: 12),
            recentTranasctionsTableView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            recentTranasctionsTableView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9),
            recentTranasctionsTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

extension RecentTransactionView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        RecentTransaction.recentTransactions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = recentTranasctionsTableView.dequeueReusableCell(withIdentifier: RecentTransactionCell.reuseId) as? RecentTransactionCell else { return UITableViewCell() }
        cell.setData(RecentTransaction.recentTransactions[indexPath.item])
        cell.selectionStyle = .none
        return cell
    }
}


