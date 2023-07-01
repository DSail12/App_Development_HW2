//
//  GroupViewCell.swift
//  hw2_
//
//  Created by Eugene Zvyagin on 01.07.2023.
// 

import UIKit

final class GroupViewCell: UITableViewCell {
    
    private lazy var groupImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .orange
        label.textAlignment = .center
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .orange
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .center
        label.numberOfLines = 0
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews(groupImageView, nameLabel, descriptionLabel)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with group: Group) {
        groupImageView.image = UIImage(named: group.name)
        nameLabel.text = group.name
        descriptionLabel.text = group.description
    }
    
    private func setupSubviews(_ subviews: UIView...) {
        subviews.forEach { subview in
            contentView.addSubview(subview)
        }
    }
    
    private func setConstraints() {
        groupImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                groupImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
                groupImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
                groupImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                groupImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5),
                
                nameLabel.leadingAnchor.constraint(equalTo: groupImageView.trailingAnchor, constant: 8),
                nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
                nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -12),
                
                descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
                descriptionLabel.leadingAnchor.constraint(equalTo: groupImageView.trailingAnchor, constant: 8),
                descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            ]
        )
    }
}
