//
//  ChatViewController.swift
//  hw2_
//
//  Created by Eugene Zvyagin on 01.07.2023.
// 

import UIKit

final class ChatViewController: UIViewController, UITableViewDelegate {

    var friend: Friend!
    private let cellID = "chat"
    
    private lazy var chatTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Message"
        textField.keyboardAppearance = .dark
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = textField.frame.height / 2
        textField.returnKeyType = .send
        textField.enablesReturnKeyAutomatically = true
        textField.backgroundColor = .black
        
        let action = UIAction { [weak self] _ in
            if !(textField.text ?? "").isEmpty {
                self?.sendButton.isEnabled = true
            } else {
                self?.sendButton.isEnabled = false
            }
        }
        textField.addAction(action, for: .editingChanged)
    
        return textField
    }()
    
    private lazy var sendButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "arrow.up"), for: .normal)
        button.backgroundColor = .orange
        button.imageView?.tintColor = .black
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        let action = UIAction { [weak self] _ in
            self?.sendButtonTapped()
        }
        button.addAction(action, for: .touchUpInside)
        
        return button
    }()
    
    private lazy var messagesTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .black
        tableView.separatorStyle = .none
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .dark
        view.backgroundColor = .black
        
        setupSubviews(chatTextField, sendButton, messagesTableView)
        setConstraints()
        
        sendButton.isEnabled = false
        title = friend.name
        messagesTableView.register(ChatTableViewCell.self, forCellReuseIdentifier: cellID)
        
        messagesTableView.dataSource = self
        messagesTableView.delegate = self
        chatTextField.delegate = self
    }
    
    private func sendButtonTapped() {
        friend.messages.append(chatTextField.text ?? "")
        messagesTableView.reloadData()
        chatTextField.text = ""
        chatTextField.resignFirstResponder()
        sendButton.isEnabled = false
    }
    
    private func setupSubviews(_ subviews: UIView...) {
        subviews.forEach { subview in
            view.addSubview(subview)
        }
    }
    
    private func setConstraints() {
        chatTextField.translatesAutoresizingMaskIntoConstraints = false
        messagesTableView.translatesAutoresizingMaskIntoConstraints = false
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                chatTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
                chatTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
                
                messagesTableView.topAnchor.constraint(equalTo: chatTextField.bottomAnchor, constant: 8),
                messagesTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
                messagesTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
                messagesTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 20),
                
                sendButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
                sendButton.leadingAnchor.constraint(equalTo: chatTextField.trailingAnchor, constant: 8),
                sendButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
                sendButton.widthAnchor.constraint(equalToConstant: 30),
                sendButton.heightAnchor.constraint(equalTo: chatTextField.heightAnchor, multiplier: 1)
            ]
        )
    }
}

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        friend.messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = messagesTableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        guard let cell = cell as? ChatTableViewCell else { return UITableViewCell() }
        
        cell.backgroundColor = .black
        cell.selectionStyle = .none
        cell.configure(with: friend.messages[indexPath.row])
       
        return cell
    }
    
    
}

extension ChatViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.text == "" {
            return false
        }
        sendButtonTapped()
        
        return true
    }
}
