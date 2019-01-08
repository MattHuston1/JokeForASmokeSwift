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
    @IBOutlet weak var JokeTitle: UILabel!
    
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
//                let random = JsonChildren.randomElement()!
                let randomIndex = Int(arc4random_uniform(UInt32(JsonChildren.count)))
//                print(JsonChildren[randomIndex])
                let random = JsonChildren[randomIndex]
                let data = random["data"]
                let jokeTitle = data["title"]
                    print(jokeTitle)
                
                self.JokeTitle?.text = ("\(jokeTitle)")
//                print(data)
//                        print(JsonChildren)
//                print(random)
//                    print(swiftyJsonVar)
//                print(swiftyJsonVar["data"])
//                let dataArray = swiftyJsonVar.data.children
                

                }
            }
    }
    
}

