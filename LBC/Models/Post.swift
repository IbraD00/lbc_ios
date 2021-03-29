//
//  Post.swift
//  LBC
//
//  Created by Ibrahima Dansokho on 28/03/2021.
//

import UIKit

struct Post: Decodable {
    let id: Int
    let category_id: Int
    let title: String
    let description: String
    let price: Float
    let images_url: Dictionary<String, String>
    let creation_date: String
    let is_urgent: Bool
}

struct PostMedia {
    let id: Int
    let smallImage: UIImage
    let thumbImage: UIImage
}


