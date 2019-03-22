//
//  TTProgressHud.swift
//  TTProgressHud
//
//  Created by Maiya on 2019/3/21.
//  Copyright © 2019 Maiya. All rights reserved.
//

import Foundation
import UIKit

class TTProgressHud: NSObject {
    /// 单利
    @objc static let shared = TTProgressHud()
    /// 获取windowView
    private let tpWindow = UIApplication.shared.keyWindow!
    /// 屏幕宽高
    private let TPScreenWidht = UIScreen.main.bounds.width
    private let TPScreenHeight = UIScreen.main.bounds.height
    /// 创建提示View
    private var promptView = TTProgressView()
    /// 网络请求加载动画
    private var loagView = TTLoadingAnimation()
    /// 是否正在显示加载动画
    private var isShowing: Bool = false
    /// 加载动画完成回调
    var loadingAnimationBlock: (()->Void)?
    /// 提示动画完成回调
    var loadingMessageBlock: (()->Void)?
    
    
    // MARK: 删除提示动画
    /// 消失时间
    ///
    /// - Parameter dismissTime: 消失时间
    @objc public func dismssAnimationMessage(dismissTime: Double) -> Void {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + dismissTime, execute: {
            self.promptView.removeFromSuperview()
            if let loadingBlock = self.loadingMessageBlock {
                loadingBlock()
                self.loadingMessageBlock = nil
            }
        })
    }
    
    // MARK: 弱提示
    ///
    /// - Parameters:
    ///   - selfView: 展示的控制器
    ///   - message: 展示的提示
    ///   - dismissTime: 消失时间
    @objc public func loadingAnimationWithMessage(selfView: UIView, message: String, dismissTime: Double) -> Void {
        
        if isShowing {
            
        }
        
        DispatchQueue.main.async {
            //布局若提示
            self.promptView.setupProgresViewUI(frame: UIScreen.main.bounds, fontSize: 16, message: message)
            //提示View背景颜色
            self.promptView.bottomViewColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1.0)
            //把自己添加到视图windw中
            self.tpWindow.addSubview(self.promptView)
            //延时多久删除提示
            self.dismssAnimationMessage(dismissTime: dismissTime)
        }
        
    }
    
}
