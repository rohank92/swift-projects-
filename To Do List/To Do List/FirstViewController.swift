//
//  FirstViewController.swift
//  To Do List
//
//  Created by Rohan Kumar on 4/10/16.
//  Copyright © 2016 fishnchips. All rights reserved.
//

import UIKit

var toDoList = [String]()

class FirstViewController: UIViewController, UITableViewDelegate {

  
    
    @IBOutlet var ToDoListTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if NSUserDefaults.standardUserDefaults().objectForKey("toDoList") != nil{
        toDoList = NSUserDefaults.standardUserDefaults().objectForKey("toDoList") as! [String]
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    internal func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
       return toDoList.count
        
    }
    
    internal func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        cell.textLabel?.text = toDoList[indexPath.row]
        return cell
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        ToDoListTable.reloadData()
    }
    
    internal func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        if editingStyle == UITableViewCellEditingStyle.Delete{
            toDoList.removeAtIndex(indexPath.row)
            NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "ToDoList")
            ToDoListTable.reloadData()
        }
        
    }
    


}

