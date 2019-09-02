//
//  MediaTableViewCell.swift
//  apple-rss
//
//  Created by Steve Toro on 9/2/19.
//  Copyright © 2019 Steve Toro. All rights reserved.
//

import UIKit

class MediaTableViewCell: UITableViewCell {
    var mediaArtworkImageView: UIImageView!
    var mediaNameLabel: UILabel!
    var mediaTypeLabel: UILabel!
    var containerView: UIView!
    
    var media: Media! {
        didSet {
            if let imageUrl = URL(string: media.artworkUrl100) {
                mediaArtworkImageView.image = try? UIImage(data: Data(contentsOf: imageUrl))
            }
            mediaNameLabel.text = media.name
            mediaTypeLabel.text = media.kind
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initializeImageView()
        initializeNameLabel()
        initializeTypeLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func initializeImageView() {
        mediaArtworkImageView = UIImageView()
        addSubview(mediaArtworkImageView)
        mediaArtworkImageView.contentMode = .scaleAspectFill
        mediaArtworkImageView.translatesAutoresizingMaskIntoConstraints = false
        mediaArtworkImageView.clipsToBounds = true
        mediaArtworkImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        mediaArtworkImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        mediaArtworkImageView.widthAnchor.constraint(equalToConstant: 75).isActive = true
        mediaArtworkImageView.heightAnchor.constraint(equalToConstant: 75).isActive = true
    }
    
    func initializeNameLabel() {
        mediaNameLabel = UILabel()
        addSubview(mediaNameLabel)
        mediaNameLabel.translatesAutoresizingMaskIntoConstraints = false
        mediaNameLabel.clipsToBounds = true
        mediaNameLabel.topAnchor.constraint(equalTo:topAnchor, constant: 25).isActive = true
        mediaNameLabel.leadingAnchor.constraint(equalTo: mediaArtworkImageView.trailingAnchor, constant: 10).isActive = true
        mediaNameLabel.trailingAnchor.constraint(equalTo:trailingAnchor).isActive = true
    }
    
    func initializeTypeLabel() {
        mediaTypeLabel = UILabel()
        addSubview(mediaTypeLabel)
        mediaTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        mediaTypeLabel.clipsToBounds = true
        mediaTypeLabel.topAnchor.constraint(equalTo: mediaNameLabel.bottomAnchor).isActive = true
        mediaTypeLabel.leadingAnchor.constraint(equalTo: mediaArtworkImageView.trailingAnchor, constant: 10).isActive = true
        mediaTypeLabel.topAnchor.constraint(equalTo: mediaNameLabel.bottomAnchor).isActive = true
    }
}
