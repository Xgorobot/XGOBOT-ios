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
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func buttonClick(serder: UIButton) {
        self.removeFromSuperview()
    }
    
}
