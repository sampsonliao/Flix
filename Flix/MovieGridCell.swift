//
//  MovieGridCell.swift
//  Flix
//
//  Created by Sampson Liao on 2/6/19.
//  Copyright © 2019 sliao. All rights reserved.
//

import UIKit

class MovieGridCell: UICollectionViewCell {

    var synopsisLabel: String = ""
    var titleLabel: String = ""
    @IBOutlet weak var posterView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
