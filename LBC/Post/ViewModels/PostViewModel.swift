//
//  PostViewModel.swift
//  LBC
//
//  Created by Ibrahima Dansokho on 28/03/2021.
//

import UIKit

class PostViewModel: NSObject {
    private var api: APIService!
    private(set) var posts : Array<Post>! {
        didSet {
            self.bindPosts()
        }
    }
    var bindPosts : (() -> ()) = {}
    
    override init() {
        super.init()
        self.api = APIService.sharedInstance
        self.getPosts()
    }
    
    func getPosts() {
        api.getPostsApi { (posts) in
            self.posts = posts
        }
    }
}
