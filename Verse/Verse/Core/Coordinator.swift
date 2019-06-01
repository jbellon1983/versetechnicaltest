//
//  Coordinator.swift
//  Verse
//
//  Created by Jesus Bellon Quixal on 28/05/2019.
//  Copyright © 2019 Jesus Bellon Quixal. All rights reserved.
//

import Foundation
import UIKit

enum Modules {
    case movieList
    case movieProfile(movie: Movie)
}

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
    func navigateTo(module: Modules)
}

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    static let shared = MainCoordinator.init(navigationController: UINavigationController())
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = MovieListView.view(viewModel: MovieListViewModel.init(provider: MovieProvider.init(service: MovieService())))
        navigationController.pushViewController(vc, animated: true)
    }
    
    func navigateTo(module: Modules) {
        let vc: UIViewController
        switch module {
        case .movieList:
            vc = MovieListView.view(viewModel: MovieListViewModel.init(provider: MovieProvider.init(service: MovieService())))
        case .movieProfile(let movie):
            vc = MovieProfileView.view(viewModel: MovieProfileViewModel.init(movie: movie))            
        }
        navigationController.pushViewController(vc, animated: true)
    }
}
