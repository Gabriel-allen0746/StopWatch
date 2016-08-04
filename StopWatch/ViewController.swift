//
//  ViewController.swift
//  StopWatch
//
//  Created by Gabriel Allen on 8/4/16.
//  Copyright © 2016 Gabriel Allen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = NSTimer()
    var counter = 0
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var timeLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        stopButton.enabled = !stopButton.enabled
        stopButton.hidden = !stopButton.hidden
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func altButtonState() {
        startButton.hidden = !startButton.hidden
        startButton.enabled = !startButton.enabled
        
        stopButton.hidden = !stopButton.hidden
        stopButton.enabled = !stopButton.enabled
    }

    @IBAction func stopTime(sender: AnyObject) {
        timer.invalidate()
        altButtonState()
        counter = 0
    }
    
    @IBAction func startTime(sender: AnyObject) {
        validateTimer()
        altButtonState()
    }
    
    func validateTimer() {
        timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: #selector(ViewController.updateTime), userInfo: nil, repeats: true)
    }
    
    func updateTime() {
        counter += 1
        
        let (minutes, seconds, miliseconds) = calculateTimeUnits()
        
        timeLabel.text = "\(minutes):\(seconds):\(miliseconds)"
    }
    
    func calculateTimeUnits() -> (String, String, String){
        var remainingCounter = counter
        
        let minutes = remainingCounter / (60 * 100)
        remainingCounter -= minutes * 60 * 100
        
        let seconds = remainingCounter / 100
        remainingCounter -= seconds * 100
        
        let miliseconds = remainingCounter
        
        let stringMinutes = String(format: "%02d", minutes)
        let stringSeconds = String(format: "%02d", seconds)
        let stringMiliseconds = String(format:"%02d", miliseconds)
        
        return (stringMinutes, stringSeconds, stringMiliseconds)
    }

}

