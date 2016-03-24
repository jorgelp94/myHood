//
//  PostCell.swift
//  myHood
//
//  Created by Jorge Luis Perales on 23/03/16.
//  Copyright © 2016 Jorge Luis Perales. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        img.layer.cornerRadius = img.frame.size.width / 2
        img.clipsToBounds = true
    }
    
    func configureCell(post: Post) {
        titleLabel.text = post.title
        descLabel.text = post.postDescription
        img.image = DataService.instance.imageForPath(post.imagePath)
    }

}
