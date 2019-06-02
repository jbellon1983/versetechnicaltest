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
import Hero

class MovieProfileView : UIViewController {
    
    public var viewModel: MovieProfileViewModelProtocol?
    public var backgroundImage: UIImageView?
    
    private let titleText = UILabel.init()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureBackground()
        configureBlur()
        configureTitle()
        configureOverview()
    }
    
    private func configureBackground() {
        let background = UIImageView.init()
        background.hero.id = viewModel?.movie.title
        background.hero.modifiers = [.spring(stiffness: 250, damping: 25)]
        self.view.addSubview(background)
        background.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.centerY.equalTo(self.view)
            make.left.top.bottom.right.equalTo(self.view)
        }
        if let temp = URL.init(string: MovieService.search_host), let path = viewModel?.movie.poster_path {
            background.sd_setImage(with: temp.appendingPathComponent("w780").appendingPathComponent(path))
            background.contentMode = .scaleAspectFill
        }
    }
    
    private func configureTitle() {
        titleText.font = UIFont.boldSystemFont(ofSize: 40.0)
        titleText.textColor = UIColor.black
        titleText.text = viewModel?.movie.title
        titleText.textAlignment = .center
        titleText.lineBreakMode = .byTruncatingTail
        titleText.numberOfLines = 2
        self.view.addSubview(titleText)
        titleText.snp.makeConstraints { (make) in
            make.left.equalTo(self.view).offset(10)
            make.top.equalTo(self.view).offset(100)
            make.right.equalTo(self.view).offset(-10)
            make.height.equalTo(100)
        }
    }
    
    private func configureOverview() {
        let text = UILabel.init()
        text.font = UIFont.boldSystemFont(ofSize: 16.0)
        text.textColor = UIColor.black
        text.text = viewModel?.movie.overview
        text.textAlignment = .justified
        text.numberOfLines = 50
        text.lineBreakMode = .byTruncatingTail
        self.view.addSubview(text)
        text.snp.makeConstraints { (make) in
            make.left.equalTo(self.view).offset(20)
            make.top.equalTo(self.titleText.snp.bottom).offset(50)
            make.right.equalTo(self.view).offset(-20)
        }
    }
    
    private func configureBlur() {
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
