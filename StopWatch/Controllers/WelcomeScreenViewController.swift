//
//  WelcomeScreenViewController.swift
//  StopWatch
//
//  Created by Claudiu Haidu on 06/10/2018.
//  Copyright © 2018 Claudiu Haidu. All rights reserved.
//

import UIKit

class WelcomeScreenViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool){
        print("Will Appear");
        makeStatusBarBlack()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("Did Appear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("Did Disappear")
    }
}
