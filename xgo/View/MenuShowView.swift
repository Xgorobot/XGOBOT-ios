//
//  MenuShowView.swift
//  xgo
//
//  Created by Mac on 2023/2/14.
//

import UIKit

class MenuShowView: UIView {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    
    
    //各个按钮对应的 RobotFunction.showMode(state)   {1, 2, 3, 4, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 21 ,20 , 24, 23, 22}
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func noClick(_ sender: Any) {
        
    }
    
    @IBAction func viewClick(_ sender: Any) {
        self.removeFromSuperview()
    }
    
    @IBAction func buttonClick(serder: UIButton) {
        self.removeFromSuperview()
    }
    
}
