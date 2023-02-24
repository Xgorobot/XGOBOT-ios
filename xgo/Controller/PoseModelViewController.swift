//
//  PoseModelViewController.swift
//  xgo
//
//  Created by Mac on 2023/2/15.
//

import UIKit

class PoseModelViewController: UIViewController {
    
    @IBOutlet weak var xAxisLabel: UILabel!
    @IBOutlet weak var yAxisLabel: UILabel!
    @IBOutlet weak var zAxisLabel: UILabel!
    @IBOutlet weak var xAxisRollLabel: UILabel!
    @IBOutlet weak var yAxisRollLabel: UILabel!
    @IBOutlet weak var zAxisRollLabel: UILabel!
    
    @IBOutlet weak var xAxisContent: UIView!
    @IBOutlet weak var yAxisContent: UIView!
    @IBOutlet weak var zAxisContent: UIView!
    @IBOutlet weak var xAxisRollContent: UIView!
    @IBOutlet weak var yAxisRollContent: UIView!
    @IBOutlet weak var zAxisRollContent: UIView!
    
    fileprivate var xAxisSlider: CenterStarSlider!
    fileprivate var yAxisSlider: CenterStarSlider!
    fileprivate var zAxisSlider: CenterStarSlider!
    fileprivate var xAxisRollSlider: CenterStarSlider!
    fileprivate var yAxisRollSlider: CenterStarSlider!
    fileprivate var zAxisRollSlider: CenterStarSlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    
    func initView() {
        
        xAxisSlider = CenterStarSlider(frame: xAxisContent.bounds)
        xAxisSlider.fillLineColor = UIColor.orange
        xAxisContent.addSubview(xAxisSlider)
        
        yAxisSlider = CenterStarSlider(frame: yAxisContent.bounds)
        yAxisSlider.fillLineColor = UIColor.green
        yAxisContent.addSubview(yAxisSlider)
        
        zAxisSlider = CenterStarSlider(frame: zAxisContent.bounds)
        zAxisSlider.fillLineColor = UIColor.blue
        zAxisContent.addSubview(zAxisSlider)
        
        xAxisRollSlider = CenterStarSlider(frame: xAxisRollContent.bounds)
        xAxisRollSlider.fillLineColor = UIColor.orange
        xAxisRollContent.addSubview(xAxisRollSlider)
        
        yAxisRollSlider = CenterStarSlider(frame: yAxisRollContent.bounds)
        yAxisRollSlider.fillLineColor = UIColor.green
        yAxisRollContent.addSubview(yAxisRollSlider)
        
        zAxisRollSlider = CenterStarSlider(frame: zAxisRollContent.bounds)
        zAxisRollSlider.fillLineColor = UIColor.blue
        zAxisRollContent.addSubview(zAxisRollSlider)
        
        
    }
    
    @IBAction func backAction(serder: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func settingAction(serder: UIButton) {
        let setVC = RadioControllSettingViewController.loadFromStoryboard("Main")
        setVC.modalPresentationStyle = .overCurrentContext
        self.present(setVC, animated: false)
    }
    
    @IBAction func motionAction(serder: UIButton!) {
        self.view.isHidden = true
    }
    
}
