//
//  LoadNibable.swift
//  xgo
//
//  Created by Mac on 2023/2/14.
//

import UIKit

enum LanguageName : String {
    
    case chinese
    case english
    
    var languageName: String {
        switch self {
        case .chinese:
            return "Chinese"
        case .english:
            return "English"
        }
    }
}

extension String {
    /// 国际化扩展
    var localized: String {
        return NSLocalizedString(self, tableName: LanguageManager.shared.languageFileName , value: self, comment: self)
    }
    
    static var languages: [String] {
        return ["cn","en"]
    }
}

// 获取类型名
protocol NamableComponent {
    static var typeName: String { get }
    var typeName: String { get }
}

extension NamableComponent {
    static var typeName: String {
        return String(describing: self)
    }
    var typeName: String {
        return String(describing: type(of: self))
    }
}


protocol LoadNibable {
    
}

extension LoadNibable where Self : UIView {
    static func loadFromNib(_ nibname: String? = nil) -> Self {
        //Self (大写) 当前类对象
        //self(小写) 当前对象
        let loadName = nibname == nil ? "\(self)" : nibname!
        return Bundle.main.loadNibNamed(loadName, owner: nil, options: nil)?.first as! Self
    }
}


extension LoadNibable where Self : UIViewController {
    static func loadFromStoryboard(_ storyboardName: String, identifier: String? = nil) -> Self {
        //Self (大写) 当前类对象
        //self(小写) 当前对象
        let loadName = identifier == nil ? "\(self)" : identifier!
        let vc = UIStoryboard(name: storyboardName, bundle: nil).instantiateViewController(withIdentifier:loadName)
        as! Self
        return vc
    }
}

extension UIViewController: LoadNibable {
    
}

extension UIButton {
    func setHorizontalGradientBackground(colorLeft: UIColor, colorRight: UIColor, forState state: UIControl.State) {
        // Create a new gradient layer
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [colorLeft.cgColor, colorRight.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        
        // Render the gradient to a UIImage
        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        let gradientImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        // Set the UIImage as the background image for the button
        setBackgroundImage(gradientImage, for: state)
    }
    
            
    func addRoundedBottomCorners() {
        let maskLayer = CAShapeLayer()
        maskLayer.path = UIBezierPath(roundedRect: bounds,
                                      byRoundingCorners: [.bottomLeft, .bottomRight],
                                      cornerRadii: CGSize(width: 10, height: 10)).cgPath
        layer.mask = maskLayer
    }
    
}

extension UIColor {
    convenience init?(hexString: String) {
        let r, g, b, a: CGFloat

        if hexString.hasPrefix("#") {
            let start = hexString.index(hexString.startIndex, offsetBy: 1)
            let hexColor = String(hexString[start...])

            if hexColor.count == 6 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff0000) >> 16) / 255
                    g = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
                    b = CGFloat(hexNumber & 0x0000ff) / 255
                    a = 1

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }
}
