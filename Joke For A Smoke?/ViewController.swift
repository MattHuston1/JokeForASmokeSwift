//
//  ViewController.swift
//  Joke For A Smoke?
//
//  Created by Matt Huston on 1/8/19.
//  Copyright © 2019 Matt Huston. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    @IBOutlet weak var OneLiner: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func OneLiner(_ sender: Any) {
        
        Alamofire.request("https://www.reddit.com/r/oneliners/hot.json").responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                let JsonData = swiftyJsonVar["data"]
                let JsonChildren = JsonData["children"]
                let random = JsonChildren.randomElement()
                    print(random)
//                    print(swiftyJsonVar)
//                    print(JsonData["children"])
//                print(swiftyJsonVar["data"])
//                let dataArray = swiftyJsonVar.data.children
                

                }
            }
    }
    
}

