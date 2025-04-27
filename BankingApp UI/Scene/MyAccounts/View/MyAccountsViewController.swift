//
//  HomeViewController.swift
//  BankingApp UI
//
//  Created by Amil Mammadov on 20.04.25.
//

import UIKit

final class MyAccountsViewController: UIViewController {
    
    private lazy var bankCardsCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createBankCardsLayout())
        collectionView.register(BankCardCell.self, forCellWithReuseIdentifier: BankCardCell.reuseId)
        return collectionView
    }()
    
    private let horizontalStackView = UIStackView()
    private let topUpView = TopCircleBottomLabelView(image: Images.topUp ?? UIImage(), title: StringConstants.topUp)
    private let sendView = TopCircleBottomLabelView(image: Images.send ?? UIImage(), title: StringConstants.send)
    private let payView = TopCircleBottomLabelView(image: Images.pay ?? UIImage(), title: StringConstants.pay)
    private let moreView = TopCircleBottomLabelView(image: Images.more ?? UIImage(), title: StringConstants.more)
    
    private let recentTransactionsView = RecentTransactionView()
    
    var myAccountsViewModel: MyAccountsViewModelProtocol?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureAccountsViewController()
        configureBankCardsCollectionView()
        configureLayout()
        configureHorizontalStackView()
        addGestureToButtons()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.isTabBarHidden = false
    }
    
    private func configureAccountsViewController(){
        
        view.backgroundColor = .secondarySystemBackground
        title = StringConstants.myAccounts
        
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let rightBarButton = UIBarButtonItem(image: Images.bell, style: .done, target: self, action: #selector(isBellButtonTapped))
        navigationItem.rightBarButtonItem = rightBarButton
        rightBarButton.tintColor = .label
    }
    
    private func addGestureToButtons(){
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(goToSendMoneyViewController))
        sendView.addGestureRecognizer(tapGesture)
    }
    
    private func configureBankCardsCollectionView(){
        
        bankCardsCollectionView.dataSource = self
        bankCardsCollectionView.delegate = self
        bankCardsCollectionView.backgroundColor = .secondarySystemBackground
        bankCardsCollectionView.showsHorizontalScrollIndicator = false
        bankCardsCollectionView.decelerationRate = .fast
    }
    
    private func createBankCardsLayout() -> UICollectionViewFlowLayout{
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 312, height: 168)
        layout.minimumLineSpacing = 20
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        return layout
    }
    
    private func configureHorizontalStackView(){
        
        horizontalStackView.addViewsToStack(topUpView, sendView, payView, moreView)
        
        horizontalStackView.axis = .horizontal
        horizontalStackView.distribution = .fillEqually
    }
}

extension MyAccountsViewController {
    
    @objc func goToSendMoneyViewController(){
        tabBarController?.isTabBarHidden = true
        myAccountsViewModel?.navigateToSendMoneyPage()
    }
    
    @objc func isBellButtonTapped(){}
}

extension MyAccountsViewController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        BankCard.bankCards.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = bankCardsCollectionView.dequeueReusableCell(withReuseIdentifier: BankCardCell.reuseId, for: indexPath) as? BankCardCell else { return UICollectionViewCell() }
        cell.setData(BankCard.bankCards[indexPath.item])
        return cell
    }
}

extension MyAccountsViewController: UICollectionViewDelegateFlowLayout {
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let layout = bankCardsCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing
        
        var offset = targetContentOffset.pointee
        let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludingSpacing
        let roundedIndex = round(index)
        
        offset = CGPoint(x: roundedIndex * cellWidthIncludingSpacing - scrollView.contentInset.left, y: scrollView.contentInset.top)
        targetContentOffset.pointee = offset
    }
}

extension MyAccountsViewController {
    
    private func configureLayout(){
        
        view.addSubviews(bankCardsCollectionView, horizontalStackView, recentTransactionsView)
        
        NSLayoutConstraint.activate([
            bankCardsCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            bankCardsCollectionView.heightAnchor.constraint(equalToConstant: 172),
            bankCardsCollectionView.widthAnchor.constraint(equalTo: view.widthAnchor),
            
            horizontalStackView.topAnchor.constraint(equalTo: bankCardsCollectionView.bottomAnchor, constant: 48),
            horizontalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            horizontalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            horizontalStackView.heightAnchor.constraint(equalToConstant: 92),
            
            recentTransactionsView.topAnchor.constraint(equalTo: horizontalStackView.bottomAnchor, constant: 36),
            recentTransactionsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            recentTransactionsView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            recentTransactionsView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

