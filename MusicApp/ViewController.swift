//
//  ViewController.swift
//  MusicApp
//
//  Created by Grants Office on 5/3/16.
//  Copyright © 2016 Grants Office. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var videos = [Videos]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let api = APIManager()
        api.loadData("https://itunes.apple.com/us/rss/topmusicvideos/limit=10/json", completion: didLoadData)
    }

    func didLoadData(videos: [Videos]){
        
        for (index, item) in videos.enumerate() {
            print("\(index) name = \(item.vName)")
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

