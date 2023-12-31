//
//  FriendViewCell.swift
//  hw2_
//
//  Created by Eugene Zvyagin on 01.07.2023.
// 

import UIKit

final class FriendViewCell: UITableViewCell {
    
    private lazy var friendImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello"
        label.textColor = .orange
        label.textAlignment = .center
        label.numberOfLines = 0
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews(friendImageView, nameLabel)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with friend: Friend) {
        friendImageView.image = UIImage(named: friend.name)
        nameLabel.text = friend.name
    }
    
    private func setupSubviews(_ subviews: UIView...) {
        subviews.forEach { subview in
            contentView.addSubview(subview)
        }
    }
    
    private func setConstraints() {
        friendImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate(
            [
                friendImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
                friendImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
                friendImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                friendImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5),
                
                nameLabel.leadingAnchor.constraint(equalTo: friendImageView.trailingAnchor, constant: 8),
                nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
                nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
            ]
        )
    }

}
