//
//  RegisterViewController.swift
//  VeritranTest
//
//  Created by carlos pava on 16/01/21.
//

import UIKit

final class RegisterViewController: BaseViewController {
    
    private lazy var idTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "set name to this account"
        textField.keyboardType = .alphabet
        textField.setBorder()
        return textField
    }()
    
    private lazy var valueTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "set initial value to this account"
        textField.keyboardType = .numberPad
        textField.setBorder()
        return textField
    }()
    
    private lazy var registerButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(onRegister), for: .touchUpInside)
        button.setTitle("Register", for: .normal)
        button.backgroundColor = .blue
        return button
    }()

    private var ownPresenter: RegisterPresenterType! {
        presenter as? RegisterPresenterType
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(idTextField)
        view.addSubview(valueTextField)
        view.addSubview(registerButton)
        setIdTextFieldConstraints()
        setvalueTextFieldConstraints()
        setRegisterButtonConstraints()
        ownPresenter.bind(self)
    }
    
    private func setIdTextFieldConstraints() {
        let guides = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            idTextField.topAnchor.constraint(equalTo: guides.topAnchor, constant: 10),
            idTextField.leadingAnchor.constraint(equalTo: guides.leadingAnchor,constant: 20),
            idTextField.trailingAnchor.constraint(equalTo: guides.trailingAnchor, constant: -20),
            idTextField.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    private func setvalueTextFieldConstraints() {
        NSLayoutConstraint.activate([
            valueTextField.topAnchor.constraint(equalTo: idTextField.bottomAnchor, constant: 10),
            valueTextField.leadingAnchor.constraint(equalTo: idTextField.leadingAnchor),
            valueTextField.trailingAnchor.constraint(equalTo: idTextField.trailingAnchor),
            valueTextField.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    private func setRegisterButtonConstraints() {
        NSLayoutConstraint.activate([
            registerButton.topAnchor.constraint(equalTo: valueTextField.bottomAnchor, constant: 10),
            registerButton.leadingAnchor.constraint(equalTo: valueTextField.leadingAnchor),
            registerButton.trailingAnchor.constraint(equalTo: valueTextField.trailingAnchor),
            registerButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    @objc func onRegister() {
        ownPresenter.set(id: idTextField.text!)
        ownPresenter.set(value: Double(valueTextField.text!)!)
        ownPresenter.register()
    }
}

extension RegisterViewController: RegisterViewType {
    func showHome() {
        
    }
}
