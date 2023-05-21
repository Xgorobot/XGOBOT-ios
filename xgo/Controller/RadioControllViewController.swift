//
//  RadioControllViewController.swift
//  xgo
//
//  Created by Mac on 2023/2/15.
//

import UIKit
import WebKit


class RadioControllViewController: BaseViewController{
    
    @IBOutlet weak var noLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var directionButton: UIButton!
    @IBOutlet weak var motionButton: UIButton!
    @IBOutlet weak var poseButton: UIButton!
    @IBOutlet weak var videoView: UIView!
    @IBOutlet weak var trotButton: UIButton!
    @IBOutlet weak var walkButton: UIButton!
    @IBOutlet weak var grabButton: UIButton!
    @IBOutlet weak var upButton: UIButton!
    @IBOutlet weak var middleButton: UIButton!
    @IBOutlet weak var downButton: UIButton!
    
    @IBOutlet weak var webView: WKWebView!
    
    var poseModelVC = PoseModelViewController.loadFromStoryboard("Main")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addChild(poseModelVC)
        self.view.addSubview(poseModelVC.view)
        
        poseModelVC.view.isHidden = true
        
        webView.isHidden = true
        // 禁止缩放
        webView.scrollView.maximumZoomScale = 1.0
        webView.scrollView.minimumZoomScale = 1.0

        // 禁止拖动
        webView.scrollView.isScrollEnabled = false

        // 自动缩放至webview大小
        webView.scrollView.contentInsetAdjustmentBehavior = .always
        imageView.isHidden = true
        webView.isHidden = false
//        webView.navigationDelegate = self TODO 设置wknavigationDelegate会崩溃，不知道为啥
        
        motionButton.setHorizontalGradientBackground(colorLeft: UIColor(hexString: "#3E67F7")!, colorRight: UIColor(hexString: "#349AFF")!, forState: .normal)
        
        leftButton.setBackgroundImage(UIImage(named: "zuozhuan"), for: .normal)
        leftButton.setBackgroundImage(UIImage(named: "zuozhuan1"), for: .highlighted)
        
        rightButton.setBackgroundImage(UIImage(named: "youzhuan"), for: .normal)
        rightButton.setBackgroundImage(UIImage(named: "youzhuan1"), for: .highlighted)
        
        trotButton.setBackgroundImage(UIImage(named: "wdian"), for: .normal)
        trotButton.setBackgroundImage(UIImage(named: "dian-1"), for: .selected)
        trotButton.isSelected = true
        
        walkButton.setBackgroundImage(UIImage(named: "wdian"), for: .normal)
        walkButton.setBackgroundImage(UIImage(named: "dian-1"), for: .selected)
        
        grabButton.setBackgroundImage(UIImage(named: "wdian"), for: .normal)
        grabButton.setBackgroundImage(UIImage(named: "dian-1"), for: .selected)
        
        upButton.setBackgroundImage(UIImage(named: "zs"), for: .normal)
        upButton.setBackgroundImage(UIImage(named: "zs1"), for: .highlighted)
        
        middleButton.setBackgroundImage(UIImage(named: "zz"), for: .normal)
        middleButton.setBackgroundImage(UIImage(named: "zz1"), for: .highlighted)
        
        downButton.setBackgroundImage(UIImage(named: "zx"), for: .normal)
        downButton.setBackgroundImage(UIImage(named: "zx1"), for: .highlighted)
        
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageViewClick)))
        
        directionButton.setBackgroundImage(UIImage(named: "yuan-1"), for: .normal)
        directionButton.isUserInteractionEnabled = false
        
        motionButton.setTitle("运动模式".localized, for: .normal)
        poseButton.setTitle("位姿模式".localized, for: .normal)
        grabButton.setTitle("抓取".localized, for: .normal)
//        imageViewClick()
        startCamera()
        imageViewClick()//进入页面立即加载网页
    }
    
    func startCamera(){
        RobotFunction.startCamera(state: 1)
    }
    
    @objc func imageViewClick() {
        webView.load(URLRequest(url: RobotFunction.getWebUrl()))
    }
    
    @IBAction func motionAction(serder: UIButton!) {
        
    }
    
    @IBAction func leftTD(_ sender: UIButton) {
        RobotFunction.btnControl(direction: 5)
    }
    
    @IBAction func leftTU(_ sender: UIButton) {
        RobotFunction.btnControl(direction: 0)
    }
    
    @IBAction func rightTD(_ sender: Any) {
        RobotFunction.btnControl(direction: 6)
    }
    
    @IBAction func rightTU(_ sender: Any) {
        RobotFunction.btnControl(direction: 0)
    }
    
    
    @IBAction func poseAction(serder: UIButton) {
        poseModelVC.view.isHidden = false
    }
    
    
    @IBAction func directionAction(serder: UIButton) {

    }
    
    @IBAction func topTDDirection(_ sender: UIButton) {
        directionButton.setBackgroundImage(UIImage(named: "s-1"), for: .normal)
        RobotFunction.btnControl(direction: 1)
        print(" btn qian")
    }
    
    @IBAction func topTUDirection(_ sender: UIButton) {
        directionButton.setBackgroundImage(UIImage(named: "yuan-1"), for: .normal)
        RobotFunction.btnControl(direction: 0)
        print(" btn 000000")
    }
    
    @IBAction func leftTDDirection(_ sender: UIButton) {
        directionButton.setBackgroundImage(UIImage(named: "z-1"), for: .normal)
        RobotFunction.btnControl(direction: 3)
        print(" btn zuo")
    }
    
    @IBAction func leftTUDirection(_ sender: UIButton) {
        directionButton.setBackgroundImage(UIImage(named: "yuan-1"), for: .normal)
        RobotFunction.btnControl(direction: 0)
        print(" btn 000000")
    }
    
    @IBAction func rightTDDirection(_ sender: UIButton) {
        directionButton.setBackgroundImage(UIImage(named: "x-1"), for: .normal)
        RobotFunction.btnControl(direction: 4)
        print(" btn you")
    }
    
    @IBAction func rightTUDirection(_ sender: UIButton) {
        directionButton.setBackgroundImage(UIImage(named: "yuan-1"), for: .normal)
        RobotFunction.btnControl(direction: 0)
        print(" btn 000000")
    }
    
    @IBAction func bottomTDDirection(_ sender: UIButton) {
        directionButton.setBackgroundImage(UIImage(named: "y-1"), for: .normal)
        RobotFunction.btnControl(direction: 2)
        print(" btn hou")
    }
    
    @IBAction func bottomTUDirection(_ sender: UIButton) {
        directionButton.setBackgroundImage(UIImage(named: "yuan-1"), for: .normal)
        RobotFunction.btnControl(direction: 0)
        print(" btn 000000")
    }
    
    @IBAction func trotAction(serder: UIButton) {
        trotButton.isSelected = true
        walkButton.isSelected = false
        RobotFunction.setStepState(state: 0)
    }
    
    @IBAction func walkAction(serder: UIButton) {
        trotButton.isSelected = false
        walkButton.isSelected = true
        RobotFunction.setStepState(state: 1)
    }
    
    @IBAction func grab(serder: UIButton) {
        serder.isSelected = !serder.isSelected
    }
    
    @IBAction func upAction(serder: UIButton) {
        RobotFunction.grap(state: -128)
    }
    
    @IBAction func middleAction(serder: UIButton) {
        RobotFunction.grap(state:  -127)
    }
    
    @IBAction func downAction(serder: UIButton) {
        RobotFunction.grap(state:  -126)
    }
    
    @IBAction func settingAction(serder: UIButton) {
        let setVC = RadioControllSettingViewController.loadFromStoryboard("Main")
        setVC.modalPresentationStyle = .overCurrentContext
        self.present(setVC, animated: false)
        
    }
    
    @IBAction func backAction(serder: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        return
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        //期望加载完成隐藏默认图
            self.imageView.isHidden = true
            self.webView.isHidden = false
        //期望加载完成后滚动到网页最中间 @MENGWEI
            // 获取网页的宽度和高度
            let width = webView.scrollView.contentSize.width
            let height = webView.scrollView.contentSize.height
            // 将网页滚动到水平和垂直方向的中心位置
            let offsetX = (width - webView.frame.width) / 2
            let offsetY = (height - webView.frame.height) / 2
            let offset = CGPoint(x: offsetX, y: offsetY)
            webView.scrollView.setContentOffset(offset, animated: true)
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error){
        //期望加载失败时显示默认图
            self.imageView.isHidden = false
            self.webView.isHidden = true
    }
}
