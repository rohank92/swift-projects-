//
//  ViewController.swift
//  Whats the weather
//
//  Created by Rohan Kumar on 4/13/16.
//  Copyright © 2016 fishnchips. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var city: UITextField!
    
    @IBOutlet var result: UILabel!
    
    @IBAction func getWeather(sender: AnyObject) {
        
        var wasSuccessful = false
        
        let attemptedUrl = NSURL(string:"http://www.weather-forecast.com/locations/" + city.text!.stringByReplacingOccurrencesOfString(" ", withString: "-") + "/forecasts/latest")
     
        if let url = attemptedUrl {
            
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) -> Void in
                
            if let webContent = data {
                    
                let decodedContent = NSString(data: webContent, encoding: NSUTF8StringEncoding)
                
                let weatherSiteSourceArray = decodedContent?.componentsSeparatedByString("3 Day Weather Forecast Summary:</b><span class=\"read-more-small\"><span class=\"read-more-content\"> <span class=\"phrase\">")
                   
                if weatherSiteSourceArray?.count > 1 {
                        
                    let infoNeeded = weatherSiteSourceArray![1].componentsSeparatedByString("</span>")
                        
                    print(infoNeeded[0])
                    
                    if infoNeeded.count > 1 {
                            
                        wasSuccessful = true
                        
                        let weatherSummary = infoNeeded[0].stringByReplacingOccurrencesOfString( "&deg;" , withString: "º")
                            
                        dispatch_async(dispatch_get_main_queue(), { () -> Void in
                                
                        self.result.text = weatherSummary
                                
                        })
                    }
                        
                }
                if wasSuccessful == false {
                    
                    self.result.text = "Couldn't find the city you looked for. Please retry with a CITY name"
                }
            } else {
                
                self.result.text = "Couldn't find the city you looked for. Please retry with a CITY name"
            }
            
        }
            
        task.resume()
            
        }
}
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

