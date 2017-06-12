//
//  ViewController.swift
//  ui-trace-line
//
//  Created by 外間麻友美 on 2017/06/03.
//  Copyright © 2017年 外間麻友美. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var chatButton: UIButton! {
        didSet {
            chatButton.addTarget(self,  action: #selector(sendChat(_:)), for: .touchUpInside)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationBar()
        title = "LINEのUIトレースだよ"
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @objc private func sendChat(_ button: UIButton) {
        
        let backButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backButtonItem
        
        let sb = UIStoryboard(name: "Chat", bundle: nil)
        let vc = sb.instantiateInitialViewController() as! ChatViewController
        navigationController?.pushViewController(vc, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

