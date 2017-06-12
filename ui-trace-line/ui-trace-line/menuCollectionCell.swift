//
//  MenuCollectionCell.swift
//  ui-trace-line
//
//  Created by 外間麻友美 on 2017/06/03.
//  Copyright © 2017年 外間麻友美. All rights reserved.
//

import UIKit

class MenuCollectionCell: UICollectionViewCell {

    static let nibName = "MenuCollectionCell"
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.text = "test"
            titleLabel.textColor = .white
        }
    }
    
}
