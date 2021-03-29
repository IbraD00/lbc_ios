//
//  PostTableViewCell.swift
//  LBC
//
//  Created by Ibrahima Dansokho on 28/03/2021.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    let postImage: UIImageView = {
        let imageView  = UIImageView(frame: CGRect(x: 10, y: 50, width: 100, height: 100))
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "preview")
        
        return imageView
    }()
    let titleLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    let descriptionText: UITextView = {
        
        let textView = UITextView(frame: CGRect(x: 20, y: 20, width: 200, height: 50))
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.contentInsetAdjustmentBehavior = .automatic
        textView.text = "..."
        textView.isEditable = false
        textView.backgroundColor = .clear
        textView.textAlignment = NSTextAlignment.left
        textView.font = UIFont.systemFont(ofSize: 10)
        textView.textColor = .darkGray
        
        return textView
    }()
    
    var post : Post! {
        didSet {
            titleLabel.text = post.title
            descriptionText.text = post.description
            if let thumb = post.images_url["thumb"] {
                postImage.getImageFromUrl(url: thumb)
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .white
        selectionStyle = .none
        
        self.contentView.addSubview(postImage)
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(descriptionText)
        
        postImage.heightAnchor.constraint(equalToConstant: 200).isActive = true
        postImage.widthAnchor.constraint(equalToConstant: 150).isActive = true
        postImage.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10).isActive = true
        postImage.centerXAnchor.constraint(equalTo:self.contentView.centerXAnchor).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: self.postImage.bottomAnchor, constant: 10).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo:self.contentView.centerXAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant: 10).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant: -10).isActive = true
        
        descriptionText.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 10).isActive = true
        descriptionText.centerXAnchor.constraint(equalTo:self.contentView.centerXAnchor).isActive = true
        descriptionText.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        descriptionText.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        descriptionText.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
