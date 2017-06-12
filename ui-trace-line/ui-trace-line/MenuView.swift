//
//  MenuView.swift
//  ui-trace-line
//
//  Created by 外間麻友美 on 2017/06/03.
//  Copyright © 2017年 外間麻友美. All rights reserved.
//

import UIKit

class MenuView: UIView {

    @IBOutlet weak var collectionView: UICollectionView!
    
    // layout
    var layout: UICollectionViewLayout = {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 90, height: 90)
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10)//マージン
        
        return layout
    }()
    
    class func instance() -> MenuView {
        return UINib(nibName: "MenuView", bundle: nil).instantiate(withOwner: self, options: nil)[0] as! MenuView
    }
    
    func setupView() {
        
        collectionView.collectionViewLayout = layout
        
        collectionView.register(UINib(nibName: MenuCollectionCell.nibName, bundle: nil), forCellWithReuseIdentifier: MenuCollectionCell.nibName)
        
        collectionView.backgroundColor = .clear
        self.addSubview(collectionView)
        
        self.backgroundColor = .black
        
        self.frame = CGRect(x: 0, y: 64, width: UIScreen.main.bounds.size.width, height: 300)
        
    }
}
