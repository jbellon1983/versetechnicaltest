//
//  MovieTableViewCell.swift
//  Verse
//
//  Created by Jesus Bellon Quixal on 30/05/2019.
//  Copyright © 2019 Jesus Bellon Quixal. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage
import SnapKit

class MovieTableViewCell : UITableViewCell {
    
    let imageMovie = UIImageView.init()
    let titleLabel = UILabel.init()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.subviews.forEach { (view) in
            view.removeFromSuperview()
        }
    }
    
    public func loadMovie(_ movie: Movie) {
        loadMovieImage(movie)
        loadTitle(movie)
    }
    
    private func loadMovieImage(_ movie: Movie) {
        if let temp = URL.init(string: MovieService.search_host), let path = movie.poster_path {
            imageMovie.sd_setImage(with: temp.appendingPathComponent("w92").appendingPathComponent(path))
        }
        self.addSubview(imageMovie)
        imageMovie.snp.makeConstraints { (make) in
            make.width.height.equalTo(150)
            make.left.equalTo(self).offset(15)
            make.centerY.equalTo(self)
        }
        imageMovie.contentMode = .scaleAspectFill
    }
    
    private func loadTitle(_ movie: Movie) {        
        self.addSubview(titleLabel)
        titleLabel.text = movie.title
        titleLabel.font = UIFont.boldSystemFont(ofSize: 30.0)
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(imageMovie.snp.right).offset(15)
            make.top.equalTo(self.snp.top).offset(50)
        }
    }
    
    static var cellIdentifier: String {
        return "MovieTableViewCell"
    }
}
