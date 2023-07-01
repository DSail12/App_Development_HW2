//
//  MainViewController.swift
//  hw2_
//
//  Created by Eugene Zvyagin on 01.07.2023.
//  

import UIKit

protocol InfoTabBarControllerDelegate: AnyObject {
    func clearData()
}

final class MainViewController: UIViewController {
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "swift")
        imageView.tintColor = .systemOrange
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var authorizationLabel: UILabel = {
        let label = UILabel()
        label.text = "Authorization"
        label.font = UIFont.systemFont(ofSize: 25)
        label.textColor = .orange
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private lazy var loginTF: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.autocorrectionType = .no
        textField.clearButtonMode = .whileEditing
        textField.placeholder = "Login"
        textField.keyboardAppearance = .dark
        textField.backgroundColor = .black
        textField.translatesAutoresizingMaskIntoConstraints = false

        return textField
    }()

    private lazy var passwordTF: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.autocorrectionType = .no
        textField.clearButtonMode = .whileEditing
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        textField.keyboardAppearance = .dark
        textField.backgroundColor = .black
        textField.translatesAutoresizingMaskIntoConstraints = false

        return textField
    }()

    private lazy var logInButton: UIButton = {
        let action = UIAction { [weak self] _ in
            self?.logInButtonTapped()
        }
        let button = UIButton(type: .system, primaryAction: action)
        button.setTitle("Log In", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        button.backgroundColor = .systemBlue
        button.tintColor = .white
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .dark
        view.backgroundColor = .black
        navigationController?.navigationBar.backgroundColor = .black
        setupSubviews(
            imageView,
            authorizationLabel,
            loginTF,
            passwordTF,
            logInButton
        )
        setConstraints()
        setupNavigationController()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @objc private func logInButtonTapped() {
        if (loginTF.text ?? "").isEmpty || (passwordTF.text ?? "").isEmpty {
            showAlert(with: "Error", and: "Please, enter login and password")
            return
        }

        let infoTabBarController = InfoTabBarController()
        infoTabBarController.infoDelegate = self
        infoTabBarController.title = loginTF.text
        
        navigationController?.pushViewController(infoTabBarController, animated: true)
    }
    
    private func setupNavigationController() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.backgroundColor = .black
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        navigationController?.navigationBar.tintColor = .orange
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.standardAppearance = navBarAppearance
    }
    
    private func setupSubviews(_ subviews: UIView...) {
        subviews.forEach { subview in
            view.addSubview(subview)
        }
    }

    private func setConstraints() {
        NSLayoutConstraint.activate(
            [
                imageView.widthAnchor.constraint(equalToConstant: 70),
                imageView.heightAnchor.constraint(equalToConstant: 50),
                imageView.centerXAnchor.constraint(
                    equalTo: view.centerXAnchor,
                    constant: -2
                ),
                
                authorizationLabel.topAnchor.constraint(
                    equalTo: imageView.bottomAnchor,
                    constant: 8
                ),
                authorizationLabel.centerXAnchor.constraint(
                    equalTo: view.centerXAnchor
                ),

                loginTF.widthAnchor.constraint(equalToConstant: 280),
                loginTF.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                loginTF.centerYAnchor.constraint(
                    equalTo: view.centerYAnchor,
                    constant: -60
                ),
                loginTF.topAnchor.constraint(
                    equalTo: authorizationLabel.bottomAnchor,
                    constant: 8
                ),

                passwordTF.widthAnchor.constraint(equalToConstant: 280),
                passwordTF.topAnchor.constraint(
                    equalTo: loginTF.bottomAnchor,
                    constant: 8
                ),
                passwordTF.centerXAnchor.constraint(equalTo: view.centerXAnchor),

                logInButton.widthAnchor.constraint(equalToConstant: 280),
                logInButton.topAnchor.constraint(
                    equalTo: passwordTF.bottomAnchor,
                    constant: 8
                ),
                logInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ]
        )
    }
    
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

extension MainViewController: InfoTabBarControllerDelegate {
    func clearData() {
        loginTF.text = ""
        passwordTF.text = ""
    }
}

