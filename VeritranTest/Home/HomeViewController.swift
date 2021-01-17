//
//  HomeViewController.swift
//  VeritranTest
//
//  Created by Carlos Pava on 16/01/21.
//

import UIKit

final class HomeViewController: BaseViewController {
    
    private lazy var balanceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    private var ownPresenter: HomePresenterType! {
        presenter as? HomePresenterType
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        view.addSubview(balanceLabel)
        setBalanceLabelConstraints()
        ownPresenter.bind(self)
        ownPresenter.getBalance()
    }
    
    func setBalanceLabelConstraints() {
        let guides = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            balanceLabel.topAnchor.constraint(equalTo: guides.topAnchor),
            balanceLabel.leadingAnchor.constraint(equalTo: guides.leadingAnchor, constant: 20),
            balanceLabel.trailingAnchor.constraint(equalTo: guides.trailingAnchor, constant: -20),
            balanceLabel.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}

extension HomeViewController: HomeViewType {
    func set(balance: String) {
        balanceLabel.text = balance
    }
}
