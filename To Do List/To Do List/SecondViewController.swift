//
//  SecondViewController.swift
//  To Do List
//
//  Created by Rohan Kumar on 4/10/16.
//  Copyright © 2016 fishnchips. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet var item: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addItem(sender: AnyObject) {
        
        if item.text != ""{
        toDoList.append(item.text!)
        item.text=""
        NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")
        }
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {   //delegate method
        textField.resignFirstResponder()
        return true
    }
}

