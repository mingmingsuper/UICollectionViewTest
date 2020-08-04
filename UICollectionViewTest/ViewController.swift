//
//  ViewController.swift
//  UICollectionViewTest
//
//  Created by 刘明明 on 2020/7/31.
//  Copyright © 2020 刘明明. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let list = ["全部","肺癌","甲状腺癌","食管癌","乳腺癌","抠鼻咽喉癌","淋巴瘤","肝胆胰癌","胃癌","结肠直癌","泌尿系统肿瘤","妇科肿瘤","骨肿瘤","一","二","三","四"]
    
    @IBOutlet weak var mCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = EqualCellSpaceFlowLayout(.left)
        mCollectionView.collectionViewLayout = layout
    }


}


extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tagCell", for: indexPath) as? TagCell
        cell?.name.text = list[indexPath.row]
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView?, TextForItemAt indexPath: IndexPath) -> String {
        return list[indexPath.row]
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let attr:[NSAttributedString.Key:Any] = [.font:UIFont.systemFont(ofSize: 12)]
        let width = (list[indexPath.row] as NSString).boundingRect(with: CGSize(width: CGFloat.greatestFiniteMagnitude, height: 30), options: .usesLineFragmentOrigin, attributes: attr, context: nil).width + 5.0
        return CGSize(width: width, height: 30)
    }
}
