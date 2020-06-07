//
//  WeatherMainCell.swift
//  CollectionViewDemo
//
//  Created by Pradeep on 07/06/20.
//  Copyright © 2020 Pradeep. All rights reserved.
//

import UIKit

class WeatherMainCell: UICollectionViewCell, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var bkView: UIView!
    @IBOutlet weak var tempLbl: UILabel!
    @IBOutlet weak var dayNameLbl: UILabel!
    @IBOutlet weak var celcius: UILabel!
    @IBOutlet weak var farenhit: UILabel!
    
    @IBOutlet weak var todayLbl: UILabel!
    
    var lastContentOffset: CGFloat = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44.0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "tblCell", for: indexPath)
        cell.textLabel?.text = "table inside collection"
        return cell
    }
    
    // this delegate is called when the scrollView (i.e your UITableView) will start scrolling
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.lastContentOffset = scrollView.contentOffset.y
    }
    
    // while scrolling this delegate is being called so you may now check which direction your scrollView is being scrolled to
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if self.lastContentOffset < scrollView.contentOffset.y {
            // did move up
            print("move up")
            
            UIView.animate(withDuration: 1.0, animations: {
                self.tempLbl.alpha = 0
                self.dayNameLbl.alpha = 0
                self.celcius.alpha = 0
                self.farenhit.alpha = 0
                self.todayLbl.alpha = 0
            }) { (status) in
                self.tempLbl.isHidden = true
                self.dayNameLbl.isHidden = true
                self.celcius.isHidden = true
                self.farenhit.isHidden = true
                self.todayLbl.isHidden = true
            }
            
        } else if self.lastContentOffset > scrollView.contentOffset.y {
            // did move down
            UIView.animate(withDuration: 1.0, animations: {
                self.tempLbl.alpha = 1
                self.dayNameLbl.alpha = 1
                self.celcius.alpha = 1
                self.farenhit.alpha = 1
                self.todayLbl.alpha = 1
            }) { (status) in
                self.tempLbl.isHidden = false
                self.dayNameLbl.isHidden = false
                self.celcius.isHidden = false
                self.farenhit.isHidden = false
                self.todayLbl.isHidden = false
            }
        } else {
            // didn't move
            print("did't move")
        }
    }
}

