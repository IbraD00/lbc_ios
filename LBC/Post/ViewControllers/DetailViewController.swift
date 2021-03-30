//
//  DetailViewController.swift
//  LBC
//
//  Created by Ibrahima Dansokho on 30/03/2021.
//

import UIKit

class DetailViewController: UIViewController {
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
    
    let descriptionTextView: UITextView = {
        let textView = UITextView(frame: CGRect(x: 9, y: 9, width: 200, height: 100))
        
        textView.font = UIFont.systemFont(ofSize: 15)
        textView.textColor = .darkGray
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text = "..."
        textView.isEditable = false
        textView.isSelectable = true
        textView.isScrollEnabled = true
        textView.sizeToFit()
        textView.backgroundColor = .clear
        textView.textAlignment = NSTextAlignment.left
        textView.contentInsetAdjustmentBehavior = .automatic
        
        return textView
    }()
    
    let callBtn: UIButton = {
        let btn = UIButton()
        
        btn.setTitle("Contacter", for: .normal)
        btn.backgroundColor = .orange
        btn.tintColor = .white
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 5
        btn.addTarget(self, action: #selector(contactSellerAction), for: .touchUpInside)
        
        return btn
    }()
    
    var post : Post! {
        didSet {
            titleLabel.text = post.title
            priceLabel.text = String(Int(post.price)).appending(" €")
            descriptionTextView.text = post.description
            descriptionTextView.sizeToFit()
            if let thumb = post.images_url["thumb"] {
                postImage.image = UIImage(named: "preview")
                postImage.getImageFromUrl(url: thumb)
            }
            dateLabel.text = "Publié le \(Helper.sharedInstance.getDate(dateString: post.creation_date))"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
        updateUI()
    }

    func initView() -> Void {
    }
    
    func updateUI() -> Void {
        view.backgroundColor = .grayColor
        
        view.addSubview(postImage)
        view.addSubview(titleLabel)
        view.addSubview(priceLabel)
        view.addSubview(dateLabel)
        view.addSubview(descriptionTextView)
        view.addSubview(callBtn)
        
        postImage.heightAnchor.constraint(equalToConstant: 200).isActive = true
        postImage.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        postImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        postImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 10).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        
        dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        
        priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        priceLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        
        descriptionTextView.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 10).isActive = true
        descriptionTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        descriptionTextView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        descriptionTextView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        
        callBtn.topAnchor.constraint(equalTo: descriptionTextView.bottomAnchor, constant: 10).isActive = true
        callBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        callBtn.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        callBtn.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        callBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        callBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        callBtn.widthAnchor.constraint(equalToConstant: 70).isActive = true
    }
    
    @objc func contactSellerAction()
    {
        dismiss(animated: true, completion: nil)
    }
}
