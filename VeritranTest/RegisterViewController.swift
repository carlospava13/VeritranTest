//
//  RegisterViewController.swift
//  VeritranTest
//
//  Created by carlos pava on 16/01/21.
//

import UIKit

final class RegisterViewController: UIViewController {
    
    private lazy var idTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "set name to this account"
        textField.setBorder()
        return textField
    }()
    
    private lazy var valueTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "set initial value to this account"
        textField.setBorder()
        return textField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(idTextField)
        view.addSubview(valueTextField)
        setIdTextFieldConstraints()
        setvalueTextFieldConstraints()
    }
    
    private func setIdTextFieldConstraints() {
        let guides = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            idTextField.topAnchor.constraint(equalTo: guides.topAnchor),
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
}
