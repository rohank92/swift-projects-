//
//  ViewController.swift
//  Downloading Web Content
//
//  Created by Rohan Kumar on 4/11/16.
//  Copyright © 2016 fishnchips. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var webView: UIWebView!
    
    
    override func viewDidLoad() {
        
        let url = NSURL(string: "https://www.zomato.com/")
        
//        webView.loadRequest(NSURLRequest(URL: url!))
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) { (data, response, Error) -> Void in
            
            let dataFromUrl = data
            if (dataFromUrl != nil){
                
                let decodedData = NSString(data: data!, encoding: NSUTF8StringEncoding)
         
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.webView.loadHTMLString(String(decodedData), baseURL: nil)
                })
                
                
            }
            
        }
        task.resume()
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

