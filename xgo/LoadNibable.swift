//
//  LoadNibable.swift
//  xgo
//
//  Created by Mac on 2023/2/14.
//

import UIKit

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

