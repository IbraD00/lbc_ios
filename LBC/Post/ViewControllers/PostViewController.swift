//
//  PostViewController.swift
//  LBC
//
//  Created by Ibrahima Dansokho on 28/03/2021.
//

import UIKit

class PostViewController: UIViewController {
    private var tableView: UITableView = UITableView()
    private var dataSource : PostTableViewDataSource<PostTableViewCell, Post>!
    private var viewModel: PostViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initView()
        updateUI()
    }
    
    func initView() -> Void {
        self.viewModel = PostViewModel()
        self.viewModel.bindPosts = {
            self.updateDataSource()
        }
    }
    
    func updateUI() -> Void {
        view.backgroundColor = .orange
        navigationItem.title = "Annonces"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]

        tableView.backgroundColor = .orange
        tableView.separatorStyle = .none
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "postCell")
        tableView.alpha = 0
        view.addSubview(tableView)
        UIView.animate(withDuration: 1, delay: 0.2, options: .transitionCurlUp, animations: {
            self.tableView.alpha = 1
        })
        

        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    func updateDataSource()  {
        self.dataSource = PostTableViewDataSource.init(_posts: self.viewModel.posts, updateCell: { (cell, item) in
            cell.post = item
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.openDetailPostView(_:)))
            cell.tag = item.id
            cell.addGestureRecognizer(tap)
        })
        
        DispatchQueue.main.async {
            self.tableView.dataSource = self.dataSource
            self.tableView.delegate = self.dataSource
            self.tableView.reloadData()
        }
    }
    
    @objc func openDetailPostView(_ sender: UITapGestureRecognizer? = nil) {
        let id = sender?.view?.tag ?? -1
        let detailView = DetailViewController()
        let post = viewModel.posts.first { (item) -> Bool in
            item.id == id
        }
        if post != nil {
            detailView.post = post
            navigationController?.present(detailView, animated: true, completion: nil)
        }
    }
}
