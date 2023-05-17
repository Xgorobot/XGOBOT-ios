//
//  PerformanceViewController.swift
//  xgo
//
//  Created by Mac on 2023/2/14.
//

import UIKit

class PerformanceViewController: BaseViewController {
    
    var array = ["趴下".localized,"站起".localized,"匍匐前进".localized,"转圈".localized,"蹲起".localized,"转动Roll".localized,"转动Pitch".localized,"转动Yaw".localized,"3轴联动".localized,"撒尿".localized,"坐下".localized,"招手".localized,"伸懒腰".localized,"波浪".localized,"摇摆".localized,"乞求".localized,"找食物".localized,"握手".localized,"俯卧撑".localized,"鸡头".localized,"调皮".localized,"跳舞".localized,"张望".localized]
    private var action: [Int] = [1, 2, 3, 4, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 21, 20, 24, 23, 22]
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var switchButton: UISwitch!
    var collectionView: UICollectionView!
    var isSelectIndex = -1
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing = 10
        flowLayout.minimumInteritemSpacing = 10
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.clear
        contentView.addSubview(collectionView)
        
        collectionView.register(PerformanceCell.self, forCellWithReuseIdentifier: "PerformanceCell")
        
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
        
        titleLabel.text = "表演".localized
        descLabel.text = "动作轮播".localized
        
    }
    
    @IBAction func changeSwitch(serder: UISwitch) {
        print(serder.isOn)
        RobotFunction.showRepeat(enable: serder.isOn)
    }
    
    @IBAction func restAction(serder: UIButton) {
        RobotFunction.showMode(state: 0)
    }
    
    @IBAction func backAction(serder: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func settingAction(serder: UIButton) {
        
        
    }
    
}

extension PerformanceViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        isSelectIndex = indexPath.row
        RobotFunction.showMode(state: action[indexPath.row])
        self.collectionView.reloadData()
    }
}

extension PerformanceViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PerformanceCell", for: indexPath) as? PerformanceCell
        cell?.isSelect = isSelectIndex == indexPath.row
        cell?.titleLabel.text = array[indexPath.row]
        return cell ?? UICollectionViewCell()
    }
    
}

extension PerformanceViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 4 - 10, height: 40)
    }
    
}

