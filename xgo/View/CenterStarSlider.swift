//
//  CenterStarSlider.swift
//  xgo
//
//  Created by Mac on 2023/2/16.
//

import UIKit

class CenterStarSlider: UIControl {
    
    fileprivate var imageView: UIImageView!
    fileprivate var isSlide: Bool = false
    fileprivate var fillLine: UIView!
    fileprivate var marger: CGFloat! = 10
    fileprivate var circle: UIView!
    
    // 填充线高度
    var fillLineHeight: CGFloat! = 6
    // 填充线颜色
    var fillLineColor: UIColor! = UIColor.red {
        didSet {
            fillLine.backgroundColor = fillLineColor
        }
    }
    // 背景线高度
    var backgroudLineHeight: CGFloat! = 6
    // 背景线颜色
    var backgroundLineColor: UIColor! = UIColor.gray
    // 图片大小
    var imageViewSize: CGSize! = CGSize(width: 20, height: 20)
    // 图片颜色
    var imageViewColor: UIColor! = UIColor.white
    // 回调
    var callBack: ((_ value: CGFloat) -> ())?
    // 设置返回最大值
    var maxValue: CGFloat = 100
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .clear
        
        fillLine = UIView(frame: CGRect(x: self.center.x - (fillLineHeight / 2), y: self.center.y - (fillLineHeight / 2), width: 0, height: fillLineHeight))
        fillLine.backgroundColor = fillLineColor
        self.addSubview(fillLine)
        
        circle = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        circle.center = self.center
        circle.backgroundColor = backgroundLineColor
        circle.layer.cornerRadius = 5
        circle.layer.masksToBounds = true
        self.addSubview(circle)
        
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: imageViewSize.width, height: imageViewSize.height))
        imageView.backgroundColor = imageViewColor
        self.addSubview(imageView)
        
        imageView.center = self.center
        imageView.layer.cornerRadius = imageViewSize.height / 2
        imageView.layer.masksToBounds = true
        
    }
    
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        
        let path = CGMutablePath()
        path.move(to: CGPoint(x: 10, y: self.center.y))
        path.addLine(to: CGPoint(x: rect.maxX - 10, y: self.center.y))
        context?.setStrokeColor(backgroundLineColor.cgColor)
        context?.addPath(path)
        context?.setLineWidth(backgroudLineHeight)
        
        context?.strokePath()
    }
    
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let point = touch.location(in: self)
        // 扩大手势范围
        let tempTouchPoint = CGRect(x: self.imageView.frame.origin.x - (self.imageView.frame.width / 1.5), y: self.frame.origin.y, width: self.imageView.frame.width * 3, height: self.frame.height)
        if tempTouchPoint.contains(point) {
            isSlide = true
        }
        return isSlide
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let point = touch.location(in: self)
        if isSlide {
            if point.x < self.frame.minX {
                self.imageView.frame = CGRect(x: self.frame.minX, y: self.imageView.frame.origin.y, width: self.imageView.frame.width, height: self.imageView.frame.height)
                fillLine.frame = CGRect(x: self.frame.minX + marger, y: self.center.y - (fillLineHeight / 2), width: self.center.x - self.frame.minX - marger, height: fillLineHeight)
            } else if point.x > self.frame.maxX - imageViewSize.width {
                self.imageView.frame = CGRect(x: self.frame.maxX - imageViewSize.width, y: self.imageView.frame.origin.y, width: self.imageView.frame.width, height: self.imageView.frame.height)
                fillLine.frame = CGRect(x: self.center.x - (fillLineHeight / 2), y: self.center.y - (fillLineHeight / 2), width: self.frame.maxX - marger - self.center.x, height: fillLineHeight)
            } else {
                self.imageView.frame = CGRect(x: (point.x - self.imageView.frame.origin.x) + self.imageView.frame.origin.x, y: self.imageView.frame.origin.y, width: self.imageView.frame.width, height: self.imageView.frame.height)
                if point.x < self.center.x {
                    fillLine.frame = CGRect(x: point.x, y: self.center.y - (fillLineHeight / 2), width: self.center.x - point.x, height: fillLineHeight)
                } else if point.x > self.center.x {
                    fillLine.frame = CGRect(x: self.center.x, y: self.center.y - (fillLineHeight / 2), width: point.x - self.center.x, height: fillLineHeight)
                } else {
                    fillLine.frame = CGRect(x: self.center.x, y: self.center.y - (fillLineHeight / 2), width: 0, height: fillLineHeight)
                }
            }
            let percent = (self.frame.width - 20) / 2 / maxValue
            if imageView.center.x < circle.center.x {
                let value = -(imageView.center.x - circle.center.x)
                self.callBack?(value / percent)
            } else {
                let value = circle.center.x - imageView.center.x
                self.callBack?(value / percent)
            }
        }
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        isSlide = false
        let percent = (self.frame.width - 20) / 2 / maxValue
        if imageView.center.x < circle.center.x {
            let value = -(imageView.center.x - circle.center.x)
            self.callBack?(value / percent)
        } else {
            let value = circle.center.x - imageView.center.x
            self.callBack?(value / percent)
        }
        
    }
    
    func reset() {
        imageView.center = self.center
        fillLine.frame = CGRect(x: self.center.x - (fillLineHeight / 2), y: self.center.y - (fillLineHeight / 2), width: 0, height: fillLineHeight)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
