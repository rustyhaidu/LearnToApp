//
//  Extensions.swift
//  StopWatch
//
//  Created by Claudiu Haidu on 06/10/2018.
//  Copyright © 2018 Claudiu Haidu. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func makeStatusBarWhite() {
        UIApplication.shared.statusBarStyle = .lightContent
    }
    
    func makeStatusBarBlack() {
        UIApplication.shared.statusBarStyle = .default
    }
    
}
