//
//  ViewController.swift
//  Permanent Storage
//
//  Created by Rohan Kumar on 4/10/16.
//  Copyright © 2016 fishnchips. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //NSUserDefaults.standardUserDefaults().setObject("Rohan", forKey: "name")
        
        let userName = NSUserDefaults.standardUserDefaults().objectForKey("name")! as! NSString
        
        print(userName)
        
        //let arr = [1,2,3,4]
        //NSUserDefaults.standardUserDefaults().setObject(arr, forKey: "Array")
        let returnedArray = NSUserDefaults.standardUserDefaults().objectForKey("Array") as! NSArray
        
        
        for x in returnedArray{
            print(x)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

