//
//  ApiService.swift
//  LBC
//
//  Created by Ibrahima Dansokho on 28/03/2021.
//

import UIKit

class APIService :  NSObject {
    
    private let sourcesURL = URL(string: "https://raw.githubusercontent.com/leboncoin/paperclip/master/listing.json")!
    
    func getPostsApi(completion : @escaping (Array<Post>) -> ()) {
        URLSession.shared.dataTask(with: sourcesURL) { (data, urlResponse, error) in
            if let data = data {
                let jsonDecoder = JSONDecoder()
                let posts = try! jsonDecoder.decode(Array<Post>.self, from: data)

                completion(posts)
            }
        }.resume()
    }
}
