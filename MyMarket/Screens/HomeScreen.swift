//
//  HomeScreen.swift
//  MyMarket
//
//  Created by Mohamed Ghazy on 4/24/21.
//  Copyright © 2021 Mohamed Ghazy. All rights reserved.
//

import UIKit
import iCarousel

class HomeScreen: UIViewController {
    
    let myCarousel: iCarousel = {
        let view = iCarousel()
        view.type = .coverFlow2
        view.isPagingEnabled = true
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureMyCarousel()
    }
    
    func configureMyCarousel(){
        myCarousel.dataSource = self
        myCarousel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(myCarousel)
        myCarousel.frame = CGRect(x: 0, y: view.frame.size.height*0.18, width: view.frame.size.width, height: view.frame.size.height*0.2)
        
    }
}


extension HomeScreen: iCarouselDataSource{
    
    func numberOfItems(in carousel: iCarousel) -> Int {
        return 3
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width/1.3, height: self.view.frame.size.height*0.2))
        view.backgroundColor = .systemGreen
        let imageView = UIImageView(frame: view.bounds)
        view.addSubview(imageView)
        imageView.contentMode = .scaleToFill
        imageView.image       = UIImage(named: "vig\(index+1)")
        return view
    }
    
}
