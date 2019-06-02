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
    let overviewLabel = UILabel.init()
    let imageVote = UIImageView.init()
    let voteLabel = UILabel.init()
    
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
        loadOverview(movie)
        loadVotes(movie)
    }
    
    private func loadMovieImage(_ movie: Movie) {
        if let temp = URL.init(string: MovieService.search_host), let path = movie.poster_path {
            imageMovie.sd_setImage(with: temp.appendingPathComponent("w780").appendingPathComponent(path))
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
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        titleLabel.numberOfLines = 2
        titleLabel.lineBreakMode = .byTruncatingTail
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(imageMovie.snp.right).offset(15)
            make.top.equalTo(self.snp.top).offset(15)
            make.right.equalTo(self).offset(-15)
        }
    }
    
    private func loadOverview(_ movie: Movie) {
        self.addSubview(overviewLabel)
        overviewLabel.numberOfLines = 4
        overviewLabel.lineBreakMode = .byTruncatingTail
        overviewLabel.text = movie.overview
        overviewLabel.snp.makeConstraints { (make) in
            make.left.equalTo(imageMovie.snp.right).offset(15)
            make.top.equalTo(titleLabel.snp.bottom).offset(15)
            make.right.equalTo(self).offset(-15)
        }
    }
    
    private func loadVotes(_ movie: Movie) {
        self.addSubview(imageVote)
        self.addSubview(voteLabel)
        imageVote.image = UIImage.init(named: "like")
        imageVote.contentMode = .scaleAspectFit
        voteLabel.text = String(movie.vote_count)
        imageVote.snp.makeConstraints { (make) in
            make.left.equalTo(imageMovie.snp.right).offset(15)
            make.top.equalTo(overviewLabel.snp.bottom).offset(15)
            make.width.height.equalTo(35)
        }
        voteLabel.snp.makeConstraints { (make) in
            make.left.equalTo(imageVote.snp.right).offset(15)
            make.top.equalTo(overviewLabel.snp.bottom).offset(25)
        }
        
    }
    
    static var cellIdentifier: String {
        return "MovieTableViewCell"
    }
}
