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

    @objc func clickBtn1() -> Void {
//        let progressView = TTProgressView()
//
//        progressView.setupProgresViewUI(frame: self.view.bounds, fontSize: 18, message: "提示你错了")
//        //        loadAnimation.replicatorLayerColor = UIColor.blue
//
//        self.view.addSubview(progressView)
        
         TTProgressHud.shared.loadingAnimationWithMessage(selfView: self.view, message: "提示谁错了？？？", dismissTime: 1.5)
    }
    
    @objc func clickBtn() -> Void {
       
//        let loadAnimation = TTLoadingAnimation()
//
//        loadAnimation.loadingAnimation(frame: self.view.bounds)
////        loadAnimation.replicatorLayerColor = UIColor.blue
//
//        self.view.addSubview(loadAnimation)
         TTProgressHud.shared.loadingAnimation(selfView: self.view)
       
    }
    
    func setupUI() -> Void {
        let btn = UIButton.init(frame: CGRect(x: 100, y: 100, width: 120, height: 60))
        btn.setTitle("动画", for: .normal)
        btn.backgroundColor = UIColor.red
        btn.addTarget(self, action: #selector(clickBtn), for: .touchUpInside)
        self.view.addSubview(btn)
        
        let btn1 = UIButton.init(frame: CGRect(x: 100, y: 170, width: 120, height: 60))
        btn1.setTitle("若提示", for: .normal)
        btn1.backgroundColor = UIColor.red
        btn1.addTarget(self, action: #selector(clickBtn1), for: .touchUpInside)
        self.view.addSubview(btn1)
    }
}

