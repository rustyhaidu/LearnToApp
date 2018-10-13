//
//  ViewController.swift
//  StopWatch
//
//  Created by Claudiu Haidu on 06/10/2018.
//  Copyright © 2018 Claudiu Haidu. All rights reserved.
//

import UIKit

class StopWatchViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var lapButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var elapsedTableView: UITableView!
    
    weak var timer: Timer!
    // counter used in method timeDidIncrease which is not used
    var counter = 0.0
    var isStarted = false
    
    var startTime: Double = 0
    var time: Double = 0
    var status: Bool = false
    
    //override var preferredStatusBarStyle: UIStatusBarStyle {return .default}
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        makeStatusBarWhite()
        configureInterface()
    }
    
    func configureInterface() {
        startButton.layer.cornerRadius = startButton.frame.size.height/2
        lapButton.layer.cornerRadius = lapButton.frame.size.width/2
    }
    
    // MARK: - Actions
    @IBAction func didTapStart(_ sender: Any) {
        if(!isStarted){
            configureTimer()
            isStarted = true
            startButton.backgroundColor = UIColor.red
            startButton.setTitle("Stop", for: .normal)
            lapButton.setTitle("Lap", for: .normal)
            
        }else{
            timer.invalidate()
            startButton.setTitle("Start", for: .normal)
            isStarted = false
            startButton.backgroundColor = UIColor.init(red: 0, green: 143, blue: 0, alpha: 1)
            lapButton.setTitle("Reset", for: .normal)
        }
        lapButton.isEnabled = true;
        lapButton.isUserInteractionEnabled = true;
    }
    
    
    @IBAction func didTapLap(_ sender: Any) {
        if(lapButton.titleLabel!.text == "Reset"){
            lapButton.isEnabled = false;
        }else if(lapButton.titleLabel!.text == "Lap"){
            
        }
        
        timeLabel.text = "00:00:00"
    }
    
    func configureTimer(){
        startTime = Date().timeIntervalSinceReferenceDate - time
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    // not used, was replaced with update counter
    @objc func timeDidIncrease(){
        counter += 0.1;
        //timeLabel.text = String(round(counter*100)/100) // "\(counter)"
    }
    
    @objc func updateCounter() {
        
        // Calculate total time since timer started in seconds
        time = Date().timeIntervalSinceReferenceDate - startTime
        
        // Calculate minutes
        let minutes = UInt8(time / 60.0)
        time -= (TimeInterval(minutes) * 60)
        
        // Calculate seconds
        let seconds = UInt8(time)
        time -= TimeInterval(seconds)
        
        // Calculate milliseconds
        // Format time vars with leading zero
        //find out the fraction of milliseconds to be displayed.
        let fraction = UInt8(time * 100)
        
        let strMinutes = String(format: "%02d", minutes)
        let strSeconds = String(format: "%02d", seconds)
        let strFraction = String(format: "%02d", fraction)
        
        //concatenate minuets, seconds and milliseconds as assign it to the UILabel
        timeLabel.text = "\(strMinutes):\(strSeconds):\(strFraction)"
        
        
    }
    
}

