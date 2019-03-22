
//
//  TTLoadingAnimation.swift
//  TTProgressHud
//
//  Created by Maiya on 2019/3/21.
//  Copyright © 2019 Maiya. All rights reserved.
//

import Foundation
import UIKit

class TTLoadingAnimation: UIView {
    ///不同屏幕缩放比, 主要用于字体,布局等
    let kLayoutScale = UIScreen.main.bounds.width / 375
    // 是否正在显示
    var isShowing: Bool?
    /// 复制层 父类是CALayer 动画的背景大小和颜色
    var replicatorLayer = CAReplicatorLayer()
    
    ///提示背景颜色默认  白烟  #F5F5F5     245,245,245 : 245, green: 245, blue: 245, alpha: 1
    @objc var replicatorLayerColor: UIColor = UIColor.init(red: 245, green: 245, blue: 245, alpha: 1) {
        didSet {
            // 提示背景颜色默认 烟白色  #F5F5F5
            self.replicatorLayer.backgroundColor = self.replicatorLayerColor.cgColor
        }
    }
    
    // MARK: - 加载动画
    ///
    /// - Parameter frame: 屏幕大小
    func loadingAnimation(frame: CGRect) -> Void {
        self.frame = frame; //重新视图frame
        
        /*
         instanceCount        设置复制图层中子层总数：这里包含原始层
         instanceTransform    设置复制子层偏移量，不包含原始层，这里是相对于原始层的x轴的偏移量
         instanceDelay        1.3.设置复制层的动画延迟事件
         instanceColor        设置复制层的背景色，如果原始层设置了背景色，这里设置就失去效果
         instanceGreenOffset  设置复制层颜色的偏移量
         */
        
        // 1.2.设置复制子层偏移量，不包含原始层，这里是相对于原始层的x轴的偏移量
        replicatorLayer.bounds = CGRect(x: 0, y: 0, width: kLayoutScale * 100, height: kLayoutScale * 100)
        replicatorLayer.cornerRadius = 10.0
        replicatorLayer.position = self.center
        replicatorLayer.backgroundColor = self.replicatorLayerColor.cgColor
        replicatorLayer.instanceGreenOffset = -Float(0.1)
        //控制圆圈点有多少个  修改可以看到效果 改成 5 或者10 就能看到
        let count = 100.0
        // 1.1.设置复制图层中子层总数：这里包含原始层
        replicatorLayer.instanceCount = Int(count)
        //Double.pi == 180度
        let angel = 2 * Double.pi / count;
        // 设置复制子层偏移量，不包含原始层，这里是相对于原始层的x轴的偏移量
        replicatorLayer.instanceTransform = CATransform3DMakeRotation(CGFloat(angel), 0, 0, 1)
        //加载到视图的layer
        self.layer .addSublayer(replicatorLayer)
        // 创建图层
        let loadLayer = CALayer()
        loadLayer.bounds = CGRect(x: 0, y: 0, width: kLayoutScale * 10, height: kLayoutScale * 10)
        loadLayer.position = CGPoint(x: kLayoutScale * 50, y: kLayoutScale * 20)
        loadLayer.backgroundColor = UIColor(red: 0.2/255, green: 0.2/255, blue: 0.8/255, alpha: 0.5).cgColor
        loadLayer.cornerRadius = kLayoutScale * 6.0
        loadLayer.masksToBounds = true
        replicatorLayer.addSublayer(loadLayer)
        
        /**
         duration           动画的时间
         repeatCount        重复的次数。不停重复设置为 HUGE_VALF
         repeatDuration     设置动画的时间。
         beginTime          指定动画开始的时间。从开始延迟几秒的话，设置为【CACurrentMediaTime() + 秒数】 的方式
         timingFunction     设置动画的速度变化
         autoreverses       动画结束时是否执行逆动画
         fromValue          所改变属性的起始值
         toValue            所改变属性的结束时的值
         byValue            所改变属性相同起始值的改变量
         */
        
        let animation = CABasicAnimation()
        //动画的时间
        animation.duration = 1.0;
        //所改变属性的起始值
        animation.fromValue = 0.4;
        //所改变属性的结束时的值
        animation.toValue = 0.1;
        //重复的次数。不停重复设置为 HUGE_VALF
        animation.repeatCount = MAXFLOAT;
        //设置动画反转
        //    animation.autoreverses = true;
        //设置动画效果
        loadLayer.add(animation, forKey: "transform.scale")
        
        //设置动画的时间。
        replicatorLayer.instanceDelay = 1.0 / count;
        loadLayer.transform = CATransform3DMakeScale(0.01, 0.31, 0.01);
    }
}
