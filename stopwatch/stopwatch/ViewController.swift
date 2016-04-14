//
//  ViewController.swift
//  stopwatch
//
//  Created by Rohan Kumar on 2/25/16.
//  Copyright © 2016 fishnchips. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var timer = NSTimer()
    
    var time = 0
    
    @IBOutlet var timeLabel: UILabel!
    
    @IBAction func pause(sender: AnyObject) {
        timer.invalidate()
        
    }
    
    @IBAction func play(sender: AnyObject) {
         timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("result"), userInfo: nil, repeats: true)
    }
    
    
    @IBAction func reset(sender: AnyObject) {
        timer.invalidate()
        timeLabel.text = "0 s"
        time = 0
    }
    
    func result(){
        print("1 second has passed")
        time++
        timeLabel.text = String(time) + " s"
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
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

