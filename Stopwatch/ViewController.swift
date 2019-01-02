//
//  ViewController.swift
//  Stopwatch
//
//  Created by Dhawal Mahajan on 18/12/18.
//  Copyright © 2018 Dhawal Mahajan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK:Properties
    var counter = 1
    var stopWatch = Timer()
    var currentTime = 0
    //MARK:Outlets
    @IBOutlet var startBtn: UIButton!
    @IBOutlet var secondsLbl: UILabel!
    @IBOutlet var stopBtn: UIButton!
    @IBOutlet var minutesLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stopBtn.isEnabled = false
       // Do any additional setup after loading the view, typically from a nib.
    }
    
    @objc func updateTime() {
        currentTime += 1
        minutesLbl.text = "\(currentTime / 60)"
        secondsLbl.text = "\(currentTime % 60)"
        if currentTime == 3600 {
            currentTime = 0
        }
    }
    
    fileprivate func handleStartButtonEvent() {
        //start button
        startBtn.setTitle("Play", for: .normal)
        counter += 1
        stopWatch.invalidate()
        stopBtn.isEnabled = true
        
        if counter % 2 == 0 {
            //Pause Button
            stopWatch = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
            startBtn.setTitle("Pause", for: .normal)
        }
    }
    
    fileprivate func handleStopButtonEvent() {
        //stop button
        startBtn.titleLabel?.text = "Play"
        currentTime = 0
        minutesLbl.text = "0"
        secondsLbl.text = "0"
        stopWatch.invalidate()
    }
    
    //MARK:IBActions
    
    @IBAction func hasButtonPressed(_ sender: Any) {
        if let sender = sender as? UIButton {
            switch sender.tag {
            case 0:
                handleStartButtonEvent()
                break
            case 1:
                handleStopButtonEvent()
                break
            default:
                break
            }
        }
    }
    
}

