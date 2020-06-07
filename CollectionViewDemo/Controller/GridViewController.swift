//
//  GridViewController.swift
//  CollectionViewDemo
//
//  Created by Pradeep on 06/06/20.
//  Copyright © 2020 Pradeep. All rights reserved.
//

import UIKit

class GridViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
         return 2
     }
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return 12
     }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let headerCell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as! GridHeaderView
            headerCell.headerLbl.text = "Header for section = \(indexPath.section)"
            return headerCell
        case UICollectionView.elementKindSectionFooter:
            let footerCell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "footer", for: indexPath) as! GridFooterView
            footerCell.footerLbl.text = "Footer for section \(indexPath.section)"
            return footerCell
        default:
            assert(false, "Unexpected element kind")
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: 80)
    }
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as UICollectionViewCell
         cell.backgroundColor = randomColor()
         return cell
     }
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
         return 4
     }
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
         return 1
     }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.size.width - 16) / 3 , height: 200.0)
    }
     func randomColor() -> UIColor {
     
         let red = CGFloat(drand48())
         let green = CGFloat(drand48())
         let blue = CGFloat(drand48())
         
         return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
     }

}
