//
//  PostTableViewCell.swift
//  LBC
//
//  Created by Ibrahima Dansokho on 28/03/2021.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        
        return view
    }()
    let titleLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    let postImage: UIImageView = {
        let imageView  = UIImageView(frame: CGRect(x: 10, y: 50, width: 100, height: 100))
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "preview")
        
        return imageView
    }()
    let dateLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    let priceLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textColor = .orange
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    var post : Post! {
        didSet {
            titleLabel.text = post.title
            priceLabel.text = String(Int(post.price)).appending(" €")
            if let thumb = post.images_url["thumb"] {
                postImage.image = UIImage(named: "preview")
                postImage.getImageFromUrl(url: thumb)
            }
            dateLabel.text = "Publié le \(Helper.sharedInstance.getDate(dateString: post.creation_date))"
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .grayColor
        selectionStyle = .none
        
        contentView.addSubview(containerView)
        
        containerView.addSubview(postImage)
        containerView.addSubview(titleLabel)
        containerView.addSubview(priceLabel)
        containerView.addSubview(dateLabel)
        
        
        containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        
        postImage.heightAnchor.constraint(equalToConstant: 200).isActive = true
        postImage.widthAnchor.constraint(equalToConstant: 150).isActive = true
        postImage.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20).isActive = true
        postImage.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 10).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10).isActive = true
        
        dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10).isActive = true
        
        priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        priceLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10).isActive = true
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
