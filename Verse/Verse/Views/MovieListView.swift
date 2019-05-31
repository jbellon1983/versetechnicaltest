//
//  MovieListView.swift
//  Verse
//
//  Created by Jesus Bellon Quixal on 28/05/2019.
//  Copyright © 2019 Jesus Bellon Quixal. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import SnapKit

class MovieListView : UIViewController, UISearchResultsUpdating {
    let searchController = UISearchController(searchResultsController: nil)
    var searchBar: UISearchBar { return searchController.searchBar }
    
    var viewModel: MovieListViewModel?
    let disposeBag = DisposeBag()
    
    lazy var tableView = UITableView.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        configureSearchController()
        configureTableView()
        bind()
    }
    
    private func configureSearchController() {
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchResultsUpdater = self
        searchBar.showsCancelButton = true
        searchBar.text = ""
        searchBar.placeholder = "search a user by name, surname or email"
        tableView.tableHeaderView = searchController.searchBar
        definesPresentationContext = true
    }
    
    private func configureTableView() {
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: MovieTableViewCell.cellIdentifier)
        tableView.rowHeight = 50.0
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.bottom.left.right.equalTo(view)
        }
    }
    
    private func bind() {
        viewModel?.movies.bind(to: tableView.rx.items(cellIdentifier: MovieTableViewCell.cellIdentifier, cellType: MovieTableViewCell.self))
        { (row, element, cell) in
            cell.textLabel?.text = "\(element.title)"
        }.disposed(by: disposeBag)
        
        tableView.rx.willDisplayCell
        .subscribe(onNext: { cell, indexPath in
            guard let movies = self.viewModel?.movies.value else { return }
            if indexPath.row == movies.count-1 {
                self.viewModel?.loadMoreMovies()
            }
        })
        .disposed(by: disposeBag)
    }
    
    // MARK: UISearchResultsUpdating
    
    func updateSearchResults(for searchController: UISearchController) {
        if let text = searchController.searchBar.text, !text.isEmpty {
            viewModel?.loadNewSearchMovies(query: text)
        }
    }
    
    static func view(viewModel: MovieListViewModel) -> UIViewController {
        guard let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MovieListView") as? MovieListView else {
            fatalError("Cannot instantiate UsersView")
        }
        view.viewModel = viewModel
        return view
    }
}
