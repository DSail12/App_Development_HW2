//
//  ChatTableViewCell.swift
//  hw2_
//
//  Created by Eugene Zvyagin on 01.07.2023.
//  

import UIKit

final class ChatTableViewCell: UITableViewCell {

    private lazy var chatLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.textColor = .orange
        label.backgroundColor = .black
        label.numberOfLines = 0
        label.layer.cornerRadius = 10
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(chatLabel)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with message: String) {
        chatLabel.text = message
    }
    
    private func setConstraints() {
        chatLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                chatLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
                chatLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
                chatLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
                chatLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
            ]
        )
    }
}
