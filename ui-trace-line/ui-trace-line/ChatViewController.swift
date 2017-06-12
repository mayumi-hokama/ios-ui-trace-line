//
//  ChatViewController.swift
//  ui-trace-line
//
//  Created by 外間麻友美 on 2017/06/03.
//  Copyright © 2017年 外間麻友美. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {
    
    // titleView
    var titleView: UILabel = {
        //let view = UIView()
        // label
        let label = UILabel()
        label.text = "トレースだよ"
        label.textColor = .white
        label.sizeToFit()
        
        //view.addSubview(label)
        
       return label
    }()
    
    // pageControl
    
    
    /// rightItem
    lazy var menuItem: UIBarButtonItem = {
        return UIBarButtonItem(image: #imageLiteral(resourceName: "panda_icon"), style: .plain, target: self, action: #selector(tapMenuButton(_:)))
    }()
    
    /// telItem
    lazy var telItem: UIBarButtonItem = {
        return UIBarButtonItem(image: #imageLiteral(resourceName: "chat_icon"), style: .plain, target: nil, action: nil)
    }()
    
    /// ドロップmenu
    lazy var dropMenuView: MenuView = {
        let view = MenuView.instance()
        view.setupView()
        view.frame.origin.y -= view.bounds.size.height
        view.backgroundColor = .black
        return view
        
    }()
    
    /// maskView
    lazy var maskView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 64, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
        view.backgroundColor = .black
        view.alpha = 0
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.tapMaskView(_:))))
        return view
    }()
  
    private var showDropDownMenu: Bool = false
    private var showTelMenu: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // titleViewの設定
        navigationItem.titleView = titleView
        navigationController?.navigationBar.setNeedsLayout()
        navigationItem.rightBarButtonItems = [menuItem, telItem]
        
        // menuの生成
        self.view.addSubview(maskView)
        self.view.addSubview(dropMenuView)
        
        // mask
        maskView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        maskView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        maskView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        maskView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        maskView.translatesAutoresizingMaskIntoConstraints = false
        
        dropMenuView.collectionView.delegate = self
        dropMenuView.collectionView.dataSource = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dropDownMenu() {
        
        showDropDownMenu = !showDropDownMenu
        
        let height = self.dropMenuView.bounds.height
        var frame  = self.dropMenuView.frame
        
        frame.origin.y = showDropDownMenu ? 64 : -height
        let alpha: CGFloat = showDropDownMenu ? 0.3 : 0
        
        UIView.animate(withDuration: 0.3, delay: 0.05, options: .curveEaseInOut, animations: {
            self.dropMenuView.frame = frame
            self.maskView.alpha = alpha
        }, completion: { _ in
            
        })
    }
    
    func tapMaskView(_: UIGestureRecognizer) {
        dropDownMenu()
    }
    func tapMenuButton(_ sender: UIButton) {
        dropDownMenu()
    }
}
extension ChatViewController: UICollectionViewDelegate {
    
}

extension ChatViewController: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCollectionCell.nibName, for: indexPath) as! MenuCollectionCell
        return cell
    }
    
}
