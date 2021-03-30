//
//  PostTableViewDataSource.swift
//  LBC
//
//  Created by Ibrahima Dansokho on 28/03/2021.
//

import UIKit

class PostTableViewDataSource <Cell: UITableViewCell, T>: NSObject, UITableViewDataSource, UITableViewDelegate {
    var posts: Array<T>
    var updateCell : (Cell, T) -> () = {_,_ in }
    
    init(_posts: Array<T>, updateCell : @escaping (Cell, T) -> ()) {
        self.posts = _posts
        self.updateCell = updateCell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! Cell

        self.updateCell(cell, posts[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 320
    }
}
