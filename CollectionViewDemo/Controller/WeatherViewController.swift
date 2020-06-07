//
//  WeatherViewController.swift
//  CollectionViewDemo
//
//  Created by Pradeep on 07/06/20.
//  Copyright © 2020 Pradeep. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
   
    var item = ["Delhi", "Mumbai", "Bengaluru", "Chennai", "Hyderabad"]
    
    @IBOutlet weak var tempLbl: UILabel!
    @IBOutlet weak var pageCtr: UIPageControl!
    @IBOutlet weak var mainCollection: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        // Do any additional setup after loading the view.
        pageCtr.numberOfPages = item.count
    }
    
    func changeBackgroundImage() {
        
//        imageView.image = [UIImage imageNamed:(i % 2) ? @"3.jpg" : @"4.jpg"];
//
//        CATransition *transition = [CATransition animation];
//        transition.duration = 1.0f;
//        transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//        transition.type = kCATransitionFade;
//
//        [imageView.layer addAnimation:transition forKey:nil];
        
        ///////////////////////////////
//        [UIView transitionWithView:textFieldimageView
//          duration:0.2f
//           options:UIViewAnimationOptionTransitionCrossDissolve
//        animations:^{
//            imageView.image = newImage;
//        } completion:nil];
        
        /////////////////
//        UIView.transition(with: imageView,
//        duration: 0.75,
//        options: .transitionCrossDissolve,
//        animations: { self.imageView.image = toImage },
//        completion: nil)
    }
    @IBAction func onExitBtnClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return item.count
       }
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "weatherMainCell", for: indexPath) as! WeatherMainCell
        if indexPath.row % 2 == 0 {
            cell.bkView?.backgroundColor = .green
        }
        else{
            cell.bkView?.backgroundColor = .blue
        }
        return cell
       }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width , height: collectionView.frame.size.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    
    
    // scroll view events
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageSide = self.mainCollection.frame.width
        let offset = scrollView.contentOffset.x
        let currentPage = Int(floor((offset - pageSide / 2) / pageSide) + 1)
        pageCtr.currentPage = currentPage
    }
    
    
}
