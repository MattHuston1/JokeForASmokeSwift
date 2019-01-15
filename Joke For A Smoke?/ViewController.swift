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
                let randomIndex = Int(arc4random_uniform(UInt32(JsonChildren.count)))
                let random = JsonChildren[randomIndex]
                let data = random["data"]
                let jokeTitle = data["title"]
                    print(jokeTitle)
                
                self.JokeTitle?.text = ("\(jokeTitle)")

                

            }
        }
    }
    
    @IBAction func DadJoke(_ sender: Any) {
        
        Alamofire.request("https://www.reddit.com/r/dadjokes/hot.json").responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                let JsonData = swiftyJsonVar["data"]
                let JsonChildren = JsonData["children"]
                let randomIndex = Int(arc4random_uniform(UInt32(JsonChildren.count)))
                let random = JsonChildren[randomIndex]
                let data = random["data"]
                let jokeTitle = data["title"]
                let jokeText = data["selftext"]
                print(jokeTitle)
                print(jokeText)
                print(jokeText.count)
                
                self.JokeTitle?.text = ("\(jokeTitle)\n\n\(jokeText)")
            }
        }
    }

    @IBAction func Jokes(_ sender: Any) {
        
        Alamofire.request("https://www.reddit.com/r/Jokes/hot.json").responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
//                print(swiftyJsonVar)
                let JsonData = swiftyJsonVar["data"]
                let JsonChildren = JsonData["children"]
                let randomIndex = Int(arc4random_uniform(UInt32(JsonChildren.count)))
                let random = JsonChildren[randomIndex]
                let data = random["data"]
                let jokeTitle = data["title"]
                let jokeText = data["selftext"]
                print(jokeTitle)
                print(jokeText)
                print(jokeText.count)
                if jokeText.count < 100 {
                    self.JokeTitle?.text = ("\(jokeTitle)\n\n\(jokeText)")
                }
               
                
                
                
                
                
            }
        }
    }
    
}
