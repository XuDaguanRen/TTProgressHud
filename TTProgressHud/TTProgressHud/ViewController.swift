//
//  ViewController.swift
//  TTProgressHud
//
//  Created by Maiya on 2019/3/21.
//  Copyright © 2019 Maiya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    @objc func clickBtn() -> Void {
       
        let loadAnimation = TTLoadingAnimation()
        
        loadAnimation.loadingAnimation(frame: self.view.bounds)
//        loadAnimation.replicatorLayerColor = UIColor.blue
        
        self.view.addSubview(loadAnimation)
    }
    
    
    func setupUI() -> Void {
        let btn = UIButton.init(frame: CGRect(x: 100, y: 100, width: 120, height: 60))
        btn.setTitle("动画", for: .normal)
        btn.backgroundColor = UIColor.red
        btn.addTarget(self, action: #selector(clickBtn), for: .touchUpInside)
        self.view.addSubview(btn)
    }
}

