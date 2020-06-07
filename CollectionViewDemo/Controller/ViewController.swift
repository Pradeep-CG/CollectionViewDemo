//
//  ViewController.swift
//  CollectionViewDemo
//
//  Created by Pradeep on 06/06/20.
//  Copyright © 2020 Pradeep. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showGridView(_ sender: Any) {
        
        let gridVC = self.storyboard?.instantiateViewController(identifier: "GridVC") as! GridViewController
        self.navigationController?.pushViewController(gridVC, animated: true)
    }
    @IBAction func showNetFlixView(_ sender: Any) {
        
        let netflixVC = self.storyboard?.instantiateViewController(identifier: "netflixVC") as! NetFlixViewController
        self.navigationController?.pushViewController(netflixVC, animated: true)
    }
    @IBAction func showWeatherView(_ sender: Any) {
        
        let weatherVC = self.storyboard?.instantiateViewController(identifier: "weatherVC") as! WeatherViewController
        self.navigationController?.pushViewController(weatherVC, animated: true)
    }

 
}

//extension UIView {
//
//
//    func fadeIn(duration: TimeInterval = 1.0, delay: TimeInterval = 0.0, completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in}) {
//        UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
//        self.alpha = 1.0
//        }, completion: completion)  }
//
//    func fadeOut(duration: TimeInterval = 1.0, delay: TimeInterval = 3.0, completion: @escaping (Bool) -> Void = {(finished: Bool) -> Void in}) {
//        UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
//        self.alpha = 0.0
//        }, completion: completion)
//}
//
//}
