//
//  LoginViewController.swift
//  CombineLearn_Login
//
//  Created by Alvin Tseng on 2023/10/22.
//

import UIKit

class LoginViewController: ViewController {
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Log-in"
        label.textAlignment = .left
        label.font = .preferredFont(forTextStyle: .largeTitle)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .emailAddress
        textField.backgroundColor = UIColor(named: "background 2")
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        textField.borderStyle = .roundedRect
        textField.keyboardType = .emailAddress
        textField.backgroundColor = UIColor(named: "background 2")
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let loginButton: UIButton = {
        let button = UIButton(configuration: .gray())
        button.setTitle("Login", for: .normal)
        button.configuration?.cornerStyle = .capsule
        button.configuration?.baseBackgroundColor = .lightGray
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var contentStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, loginButton])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let loginViewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "background 1")
        view.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        view.addSubview(contentStackView)
        contentStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        contentStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        contentStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 36).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 36).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 75).isActive = true
        loginButton.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
    }
    
    @objc func handleLogin() {
        showLoginSuccessAlertController()
    }
    
    func showLoginSuccessAlertController() {
        let alertController = UIAlertController(title: "Log-in Success", message: "Welcome to our place", preferredStyle: .actionSheet)
        let action = UIAlertAction(title: "OK", style: .cancel)
        alertController.addAction(action)
        show(alertController, sender: nil)
    }
    
    func showLoginFailAlertController(errorMessage: String) {
        let alertController = UIAlertController(title: "Log-in Fail", message: errorMessage, preferredStyle: .actionSheet)
        let action = UIAlertAction(title: "Try again", style: .cancel)
        alertController.addAction(action)
        show(alertController, sender: nil)
    }
 }
