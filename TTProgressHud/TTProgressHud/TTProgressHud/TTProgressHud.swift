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
    private let tpWindow = UIApplication.shared.keyWindow
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
    
    
}
