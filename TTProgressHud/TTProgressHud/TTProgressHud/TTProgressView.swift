
//
//  TTProgressView.swift
//  TTProgressHud
//
//  Created by Maiya on 2019/3/21.
//  Copyright © 2019 Maiya. All rights reserved.
//

import Foundation
import UIKit

class TTProgressView: UIView {
    /// 不同屏幕缩放比, 主要用于字体,布局等
    let kLayoutScale = UIScreen.main.bounds.width / 375
    
    /// 底部布局View
    lazy var bottomView = UIView()
    /// 提示文案
    lazy var messageLable = UILabel()
    
    /// 提示背景颜色默认 浅灰色 #D3D3D3 #FCFCFC
    @objc var bottomViewColor: UIColor = UIColor.init(red: 211, green: 211, blue: 211, alpha: 1) {
        didSet {
            // 提示背景颜色默认 烟白色  #F5F5F5
            self.bottomView.backgroundColor = self.bottomViewColor
        }
    }
    
    // MARK: - 若提示
    ///
    /// - Parameters:
    ///   - frame: 屏幕大小
    ///   - fontSize: 文字字号
    ///   - message: 文案内容
    func setupProgresViewUI(frame: CGRect, fontSize: CGFloat, message: String) -> Void {
        self.frame = frame //重新视图frame
        
        //计算文字宽高
        let mesSize = message.boundingRect(with: CGSize(width: (UIScreen.main.bounds.size.width - 60) * kLayoutScale, height: (UIScreen.main.bounds.size.height / 2 + 20) * kLayoutScale), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: fontSize * kLayoutScale)], context: nil)
        
        //设置高度
        let mesHeight = (mesSize.height > 45 * kLayoutScale ? mesSize.height + 30 * kLayoutScale : 55 * kLayoutScale)
        
        //计算文案的显示位置
        let labelY = (self.frame.size.height - mesHeight) / 2
        let labelX = (self.frame.size.width - (mesSize.width + 40)) / 2
        bottomView.backgroundColor = self.bottomViewColor
        bottomView.layer.masksToBounds = true
        bottomView.layer.cornerRadius = 6
        bottomView.frame = CGRect(x: labelX, y: labelY, width: (mesSize.width + 40), height: mesHeight)
        self.addSubview(bottomView)
        
        //显示的文案
        messageLable.frame = CGRect(x: (mesSize.width + 40 - mesSize.width) / 2, y: (mesHeight - mesSize.height) / 2, width: mesSize.width, height: mesSize.height)
        messageLable.text = message
        messageLable.font = UIFont.systemFont(ofSize: fontSize * kLayoutScale)
        messageLable.numberOfLines = 0
        messageLable.textAlignment = .center
        bottomView.addSubview(messageLable)
    }
}
