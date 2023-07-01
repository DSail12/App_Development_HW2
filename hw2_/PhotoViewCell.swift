//
//  PhotoViewCell.swift
//  hw2_
//
//  Created by Eugene Zvyagin on 01.07.2023.
// 

import UIKit

final class PhotoViewCell: UICollectionViewCell {
    
    lazy var photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(photoImageView)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with photo: Photo) {
        photoImageView.image = UIImage(named: photo.name)
    }
    
    private func setConstraints() {
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                photoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
                photoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            ]
        )
    }
}
