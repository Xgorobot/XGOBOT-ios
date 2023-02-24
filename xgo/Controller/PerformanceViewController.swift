//
//  PerformanceViewController.swift
//  xgo
//
//  Created by Mac on 2023/2/14.
//

import UIKit

class PerformanceViewController: UIViewController {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var switchButton: UISwitch!
    var collectionView: UICollectionView!
    var isSelectIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing = 10
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.itemSize = CGSize(width: contentView.frame.width / 4 - 10, height: 40)
        
        collectionView = UICollectionView(frame: contentView.bounds, collectionViewLayout: flowLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.clear
        contentView.addSubview(collectionView)
        
        collectionView.register(PerformanceCell.self, forCellWithReuseIdentifier: "PerformanceCell")
        
    }
    
    @IBAction func changeSwitch(serder: UISwitch) {
        print(serder.isOn)
    }
    
    @IBAction func restAction(serder: UIButton) {
        
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
        self.collectionView.reloadData()
    }
    
}

extension PerformanceViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PerformanceCell", for: indexPath) as? PerformanceCell
        cell?.isSelect = isSelectIndex == indexPath.row
        return cell ?? UICollectionViewCell()
    }
    
}

