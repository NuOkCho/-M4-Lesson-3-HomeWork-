//
//  GetRequestPage.swift
//  (M4)Lesson-3(HomeWork)
//
//  Created by Ahmed Muvaza on 11/4/23.
//

import Foundation
import SnapKit
import Kingfisher

class GetRequestPage: UIViewController {
    var data: [data] = []
    
    private lazy var tableView: UITableView = {
        let view = UITableView
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Some news"
        setupTableViewConfigue()
        setupConstains()
    }
    
    private func setupTableViewConfigue() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CustomCell.self, forCellReuseIdentifier: "cell")
        tableView.reloadData()
    }
}
