//
//  MovieProfileView.swift
//  Verse
//
//  Created by Jesus Bellon Quixal on 28/05/2019.
//  Copyright © 2019 Jesus Bellon Quixal. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import SDWebImage

class MovieProfileView : UIViewController {
    
    public var viewModel: MovieProfileViewModelProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    private func configureView() {
        self.title = viewModel?.movie.title
        configureBackground()
    }
    
    private func configureBackground() {
        let background = UIImageView.init()
        self.view.addSubview(background)
        background.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.centerX.equalTo(self.view)
            make.left.top.bottom.right.equalTo(self.view)
        }
        if let temp = URL.init(string: MovieService.search_host), let path = viewModel?.movie.poster_path {
            background.sd_setImage(with: temp.appendingPathComponent("w780").appendingPathComponent(path))
            background.contentMode = .scaleAspectFill
        }
        addBlur()
    }
    
    private func addBlur() {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.prominent)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffectView.alpha = 0.5
        view.addSubview(blurEffectView)
    }
    
    static func view(viewModel: MovieProfileViewModel) -> UIViewController {
        guard let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MovieProfileView") as? MovieProfileView else {
            fatalError("Cannot instantiate MovieProfileView")
        }
        view.viewModel = viewModel
        return view
    }
}
