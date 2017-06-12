//
//  UIViewController+Navigation.swift
//  ui-trace-line
//
//  Created by 外間麻友美 on 2017/06/03.
//  Copyright © 2017年 外間麻友美. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func setNavigationBar() {
        
        //バー背景色
        navigationController?.navigationBar.barTintColor = UIColor.black
        
        //バーアイテムカラー
        navigationController?.navigationBar.tintColor = UIColor.white
        
        //ナビゲーションタイトル文字列の変更
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
        
    }
}
