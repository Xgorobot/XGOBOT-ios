//
//  PerformanceViewController.swift
//  xgo
//
//  Created by Mac on 2023/2/14.
//

import UIKit

class PerformanceViewController: BaseViewController {
    
    var array = ["趴下","站起","匍匐前进","转圈","蹲起","转动Roll","转动Pitch","转动Yaw","3轴联动","撒尿","坐下","招手","伸懒腰","波浪","摇摆","乞求","找食物","握手","俯卧撑","鸡头","调皮","跳舞","张望"]
    private var action: [Int] = [1, 2, 3, 4, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 21, 20, 24, 23, 22]
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var switchButton: UISwitch!
    var collectionView: UICollectionView!
    var isSelectIndex = -1
    
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

