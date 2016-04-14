//
//  ViewController.swift
//  times tables
//
//  Created by Rohan Kumar on 4/9/16.
//  Copyright © 2016 fishnchips. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {

    @IBOutlet var slider: UISlider!
    
    @IBOutlet var statement: UILabel!
    @IBOutlet var table: UITableView!
    @IBAction func sliderMoved(sender: AnyObject) {
        
        table.reloadData()
        statement.text = String(Int(slider.value))
    }
   
    internal func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 20
    }
    
    
    internal func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
        let timesTable = Int(slider.value)
        
        cell.textLabel?.text = String(Int(slider.value)) + " x " + String((indexPath.row+1)) + " = " + String(timesTable * (indexPath.row + 1))
        
        return cell
        
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

