//
//  ApiService.swift
//  LBC
//
//  Created by Ibrahima Dansokho on 28/03/2021.
//

import UIKit

class APIService :  NSObject {
    
    public static let sharedInstance = APIService()
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
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func getImage(from url: URL, completion : @escaping (Data?) -> ()) {
        getData(from: url) { data, response, error in
           guard let data = data, error == nil else { return completion(nil) }
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode != 200 {
                    completion(nil)
                } else {
                    completion(data)
                }
            }
        }
    }
}
