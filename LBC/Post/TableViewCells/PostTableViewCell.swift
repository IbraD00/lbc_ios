//
//  PostTableViewCell.swift
//  LBC
//
//  Created by Ibrahima Dansokho on 28/03/2021.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    var smallImageUrl: String?
    var thumbImageUrl: String?
    
    var post : Post! {
        didSet {
            backgroundColor = .white
            textLabel?.textColor = .darkGray
            textLabel?.text = post.title
            detailTextLabel?.text = post.description
            detailTextLabel?.textColor = .darkGray
            if let small = post.images_url["small"], let thumb = post.images_url["small"] {
                smallImageUrl = small
                thumbImageUrl = thumb
            }
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
