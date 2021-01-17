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
    
    private lazy var withdrawsMoneyTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "withdraws Money"
        textField.keyboardType = .numberPad
        textField.setBorder()
        return textField
    }()
    
    private lazy var withdrawsMoneyButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("withdraws money", for: .normal)
        button.addTarget(self, action: #selector(onWithdrawsMoney), for: .touchUpInside)
        button.backgroundColor = .blue
        return button
    }()
    
    private lazy var depositsTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "deposits Money"
        textField.keyboardType = .numberPad
        textField.setBorder()
        return textField
    }()
    
    private lazy var depositsMoneyButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("deposits money", for: .normal)
        button.addTarget(self, action: #selector(onDepositsMoney), for: .touchUpInside)
        button.backgroundColor = .blue
        return button
    }()
    
    private var ownPresenter: HomePresenterType! {
        presenter as? HomePresenterType
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(balanceLabel)
        view.addSubview(withdrawsMoneyTextField)
        view.addSubview(withdrawsMoneyButton)
        view.addSubview(depositsTextField)
        view.addSubview(depositsMoneyButton)
        setBalanceLabelConstraints()
        setWithdrawsMoneyTextFieldConstraints()
        setWithdrawsMoneyButtonConstraints()
        setDepositsTextFieldConstraints()
        setDepositsMoneyButtonConstraints()
        ownPresenter.bind(self)
        ownPresenter.getBalance()
    }
    
    private
    func setBalanceLabelConstraints() {
        let guides = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            balanceLabel.topAnchor.constraint(equalTo: guides.topAnchor),
            balanceLabel.leadingAnchor.constraint(equalTo: guides.leadingAnchor, constant: 20),
            balanceLabel.trailingAnchor.constraint(equalTo: guides.trailingAnchor, constant: -20),
            balanceLabel.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    private func setWithdrawsMoneyTextFieldConstraints() {
        NSLayoutConstraint.activate([
            withdrawsMoneyTextField.topAnchor.constraint(equalTo: balanceLabel.bottomAnchor, constant: 10),
            withdrawsMoneyTextField.leadingAnchor.constraint(equalTo: balanceLabel.leadingAnchor),
            withdrawsMoneyTextField.trailingAnchor.constraint(equalTo: balanceLabel.trailingAnchor),
            withdrawsMoneyTextField.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    private func setWithdrawsMoneyButtonConstraints() {
        NSLayoutConstraint.activate([
            withdrawsMoneyButton.topAnchor.constraint(equalTo: withdrawsMoneyTextField.bottomAnchor, constant: 10),
            withdrawsMoneyButton.leadingAnchor.constraint(equalTo: withdrawsMoneyTextField.leadingAnchor),
            withdrawsMoneyButton.trailingAnchor.constraint(equalTo: withdrawsMoneyTextField.trailingAnchor),
            withdrawsMoneyButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    private func setDepositsTextFieldConstraints() {
        NSLayoutConstraint.activate([
            depositsTextField.topAnchor.constraint(equalTo: withdrawsMoneyButton.bottomAnchor, constant: 10),
            depositsTextField.leadingAnchor.constraint(equalTo: withdrawsMoneyTextField.leadingAnchor),
            depositsTextField.trailingAnchor.constraint(equalTo: withdrawsMoneyTextField.trailingAnchor),
            depositsTextField.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    private func setDepositsMoneyButtonConstraints() {
        NSLayoutConstraint.activate([
            depositsMoneyButton.topAnchor.constraint(equalTo: depositsTextField.bottomAnchor, constant: 10),
            depositsMoneyButton.leadingAnchor.constraint(equalTo: withdrawsMoneyTextField.leadingAnchor),
            depositsMoneyButton.trailingAnchor.constraint(equalTo: withdrawsMoneyTextField.trailingAnchor),
            depositsMoneyButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    @objc func onWithdrawsMoney() {
        ownPresenter.withdrawsMoney(value: Double(withdrawsMoneyTextField.text!)!)
    }
    
    @objc func onDepositsMoney() {
        ownPresenter.depositsMoney(value: Double(depositsTextField.text!)!)
    }
}

extension HomeViewController: HomeViewType {
    func set(balance: String) {
        balanceLabel.text = balance
    }
}
