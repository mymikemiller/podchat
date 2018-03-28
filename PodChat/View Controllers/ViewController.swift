//
//  ViewController.swift
//  PodChat
//
//  Created by Michael Miller on 3/26/18.
//  Copyright © 2018 Puffin Labs. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchPodcasts(term: "Daily Tech News Show") { (feedUrls) in
            print(feedUrls)
        }
    }
    
    func searchPodcasts(term: String, completion: @escaping ([String]?) -> Void) {
        Alamofire.request(
            URL(string: "https://itunes.apple.com/search")!,
            method: .get,
            parameters: ["entity": "podcast",
                         "term": term])
            .validate()
            .responseJSON { (response) -> Void in
                guard response.result.isSuccess else {
                    print("Error while searching iTunes: \(response.result.error)")
                    completion(nil)
                    return
                }
                
                if let result = response.result.value {
                    let json = JSON(result)
                    
                    json["results"].forEach({ (str, json) in
                        print(json["feedUrl"])
                        print(json["artworkUrl100"])
                    })
                }
                
//
//                let rooms = rows.flatMap({ (roomDict) -> RemoteRoom? in
//                    return RemoteRoom(jsonData: roomDict)
//                })
                
                completion(["testUrs"])
        }
    }
}
