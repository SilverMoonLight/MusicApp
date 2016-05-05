//
//  APIManager.swift
//  MusicApp
//
//  Created by Grants Office on 5/3/16.
//  Copyright © 2016 Grants Office. All rights reserved.
//

import Foundation

class APIManager {
    
    func loadData(urlString:String, completion: [Videos]->  Void) {
        
        let config = NSURLSessionConfiguration.ephemeralSessionConfiguration()
        
        let session = NSURLSession(configuration: config)
        
       // let session = NSURLSession.sharedSession()
        let url = NSURL(string: urlString)
        
        let task = session.dataTaskWithURL(url!) {
            (data, response, error) -> Void in
            
           // print(response)
            
                if error != nil {
                    
                        print(error!.localizedDescription)
                    
                } else {
                   // completion(result: "NSURLSession successful")
                    //print(data)
                    do {
                        
                        if let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments) as? JSONDictionary,
                            feed = json["feed"] as? JSONDictionary, entries = feed["entry"] as? JSONArray {
                            
                            
                            var videos = [Videos]()
                            for entry in entries {
                                let entry = Videos(data: entry as! JSONDictionary)
                                videos.append(entry)
                            }
                            
                            let i = videos.count
                            print("iTubesApiManager - totoal count ---> \(i)")
                            print(" ")
                            
                            let priority = DISPATCH_QUEUE_PRIORITY_BACKGROUND
                            dispatch_async(dispatch_get_global_queue(priority, 0)) {
                                dispatch_async(dispatch_get_main_queue()) {
                                    completion(videos)
                                }
                            }
                        }
                    } catch {
                dispatch_async(dispatch_get_main_queue())  {
                    
                }
                    }
            }
        }
        task.resume()
    }
}