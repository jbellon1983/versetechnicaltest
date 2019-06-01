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
    private let searchController = UISearchController(searchResultsController: nil)
    private var searchBar: UISearchBar { return searchController.searchBar }
    private var tableView = UITableView.init()
    
    private var viewModel: MovieListViewModel?
    private let disposeBag = DisposeBag()
            
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
        searchBar.placeholder = "search movies"
        tableView.tableHeaderView = searchController.searchBar
        definesPresentationContext = true
    }
    
    private func configureTableView() {
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: MovieTableViewCell.cellIdentifier)
        tableView.rowHeight = 250.0
        tableView.separatorStyle = .none        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.bottom.left.right.equalTo(view)
        }
    }
    
    private func bind() {
        viewModel?.movies.bind(to: tableView.rx.items(cellIdentifier: MovieTableViewCell.cellIdentifier, cellType: MovieTableViewCell.self))
        { (row, element, cell) in
            cell.loadMovie(element)
        }.disposed(by: disposeBag)
        
        tableView.rx.willDisplayCell
        .subscribe(onNext: { cell, indexPath in
            guard let movies = self.viewModel?.movies.value else { return }
            if indexPath.row == movies.count-1 {
                print("getting more movies")
                self.viewModel?.loadMoreMovies()
            }
        })
        .disposed(by: disposeBag)
    }
    
    // MARK: UISearchResultsUpdating
    
    func updateSearchResults(for searchController: UISearchController) {
        if let text = searchController.searchBar.text, !text.isEmpty {
            tableView.setContentOffset(.zero, animated: true)
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
