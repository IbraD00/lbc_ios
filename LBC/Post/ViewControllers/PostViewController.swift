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

        tableView.backgroundColor = .orange
        tableView.separatorStyle = .none
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "postCell")
        view.addSubview(tableView)

        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    func updateDataSource()  {
        self.dataSource = PostTableViewDataSource.init(_posts: self.viewModel.posts, updateCell: { (cell, item) in
            cell.post = item
        })
        
        DispatchQueue.main.async {
            self.tableView.dataSource = self.dataSource
            self.tableView.delegate = self.dataSource
            self.tableView.reloadData()
        }
    }
}
