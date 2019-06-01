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
    
    private var viewModel: MovieListViewModelProtocol?
    private let disposeBag = DisposeBag()
            
    override func viewDidLoad() {
        super.viewDidLoad()        
        configureSearchController()
        configureTableView()
        bind()
    }
    
    private func configureSearchController() {
        self.title = "Movies"
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
        tableView.showsVerticalScrollIndicator = false
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
                self.viewModel?.loadMoreMovies()
            }
        })
        .disposed(by: disposeBag)
        
        tableView.rx.itemSelected
        .subscribe(onNext: { [weak self] indexPath in
            self?.tableView.deselectRow(at: indexPath, animated: false)
            guard let movie = self?.viewModel?.movies.value[indexPath.row] else { return }
            MainCoordinator.shared.navigateTo(module: .movieProfile(movie: movie))
        }).disposed(by: disposeBag)

    }
    
    // MARK: UISearchResultsUpdating
    
    func updateSearchResults(for searchController: UISearchController) {
        if let text = searchController.searchBar.text, !text.isEmpty {
            viewModel?.loadNewSearchMovies(query: text)
        } else {
            viewModel?.resetMovies()
        }
    }
    
    static func view(viewModel: MovieListViewModel) -> UIViewController {
        guard let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MovieListView") as? MovieListView else {
            fatalError("Cannot instantiate MovieListView")
        }
        view.viewModel = viewModel
        return view
    }
}
