//
//  ViewController.swift
//  StopWatch
//
//  Created by Gabriel Allen on 8/4/16.
//  Copyright © 2016 Gabriel Allen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var timeLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func stopTime(sender: AnyObject) {
        timeLabel.text = "1:00"
    }
    
    @IBAction func startTime(sender: AnyObject) {
        timeLabel.text = "0:00"
    }

}

