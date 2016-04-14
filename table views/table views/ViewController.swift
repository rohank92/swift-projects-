//
//  ViewController.swift
//  table views
//
//  Created by Rohan Kumar on 4/9/16.
//  Copyright © 2016 fishnchips. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    var cellContent = ["rohan", "sharanya" , "spriha" , "ankita"]
    
     internal func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return cellContent.count
    
    }
    
    internal func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        cell.textLabel?.text = cellContent[indexPath.row]
        return cell
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

