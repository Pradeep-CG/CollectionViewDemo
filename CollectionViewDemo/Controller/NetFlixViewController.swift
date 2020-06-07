//
//  NetFlixViewController.swift
//  CollectionViewDemo
//
//  Created by Pradeep on 06/06/20.
//  Copyright © 2020 Pradeep. All rights reserved.
//

import UIKit

class NetFlixViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var categories = ["add","Action", "Drama", "Science Fiction","Thriller","ad", "Comedy", "Suspense", "Kids", "Documentary","ad", "Bollywood", "Hollywood", "Hindi", "English"]
    var imageUrl = [
        "https://i.pinimg.com/originals/25/51/6e/25516e77517b61cb84801c1b74c71836.jpg",
        
        "https://movie-hound.com/wp-content/uploads/2012/01/Tangled-Poster.jpg",
        
        "https://www.hindidarshan.com/wp-content/uploads/2019/12/bacchan-pandey-movie-on-movieda.jpg",
        
        "https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F37%2F2015%2F06%2F05194650%2Fforever-my-girl.jpg",
        
        "https://cdn.bollywoodmdb.com/movies/largethumb/2015/khamoshiyaan/khamoshiyaan-poster-3.jpg",
        
        "https://imagesvc.meredithcorp.io/v3/mm/image?q=85&c=sc&poi=face&w=1462&h=1949&url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F6%2F2019%2F06%2Fhtra204_vv278-2000.jpg",
        
        "https://m.media-amazon.com/images/M/MV5BNzM0OGZiZWItYmZiNC00NDgzLTg1MjMtYjM4MWZhOGZhMDUwXkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_.jpg",
        
        "https://skullappreciationsociety.com/wp-content/uploads/2014/02/url.png",
        
        "https://www.omdbapi.com/src/poster.jpg",
        
        "https://ca-times.brightspotcdn.com/dims4/default/f13f04a/2147483647/strip/true/crop/1761x2609+0+0/resize/1003x1486!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F61%2F1f%2F24a8286642e087d1cf6748884d07%2Funhinged-27x40-theatrical-1sheet-july1-final-1.jpg",
        
        "https://i.pinimg.com/originals/4a/52/14/4a5214b06aefc64534972885b35e80eb.jpg",
        
        "https://i.pinimg.com/474x/34/8b/9c/348b9ccc117ccac0133967ffb685e326.jpg"
        
        
    ]
    
    var image_cache = [String :UIImage]()
    let cellIdentifier = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func load_image(link:String, complitionHandler:@escaping (_ image:UIImage, _ link:String) -> Void)
    {
        
        let url:NSURL = NSURL(string: link)!
        let session = URLSession.shared
        
        let request = NSMutableURLRequest(url: url as URL)
        request.timeoutInterval = 10
        
        
        let task = session.dataTask(with: request as URLRequest) {
            (
            data,  response,  error) in
            
            guard let _:NSData = data as NSData?, let _:URLResponse = response, error == nil else {
                
                return
            }
            
            
            let image = UIImage(data: data!)
            
            if (image != nil)
            {
                complitionHandler(image!,link)
            }
            
        }
        
        task.resume()
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return categories.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section.isMultiple(of: 5){
            return ""
        }
        else{
           return categories[section]
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section.isMultiple(of: 5){
            return 70.0
        }
        else{
            return 130.0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell
        
        if indexPath.section.isMultiple(of: 5){
            cell = tableView.dequeueReusableCell(withIdentifier: "adCell", for: indexPath) as! AdTableViewCell
        }
        else{
            cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CategoryRow
        }
        
        
        return cell
    }
}

extension NetFlixViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "videoCell", for: indexPath) as! NetFlixCollectionViewCell
        cell.imgView.contentMode = .scaleAspectFit
        cell.imgView.clipsToBounds = true
        
        if image_cache[imageUrl[indexPath.row]] != nil {
            cell.imgView.image = image_cache[imageUrl[indexPath.row]]
        }
        else{
            load_image(link: imageUrl[indexPath.row]) { (image, url) in
                
                DispatchQueue.main.async {
                    cell.imgView.image = image
                    self.image_cache[url] = image
                }
            }
        }
        return cell
    }
}

extension NetFlixViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsPerRow:CGFloat = 4
        let hardCodedPadding:CGFloat = 5
        let itemWidth = (collectionView.bounds.width / itemsPerRow) - hardCodedPadding
        let itemHeight = collectionView.bounds.height - (2 * hardCodedPadding)
        return CGSize(width: itemWidth, height: itemHeight)
    }
}
