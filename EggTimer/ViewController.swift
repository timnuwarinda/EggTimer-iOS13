//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import Foundation

let eggTimes = ["Soft": 1, "Medium": 7, "Hard": 12]
class ViewController: UIViewController {
    var counter = 0
    var originalVal = 0
    var timer = Timer()
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var screenLabel: UILabel!
    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        timer.invalidate()
        screenLabel.text = hardness
        progressBar.progress = 0.0
        
        let value = eggTimes[hardness]!
        
        originalVal = value*60
        counter = value*60
     	
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
	
    }
    
    @objc func updateCounter() {
       //example functionality
        
       if counter > 0 {
           print(counter)
           counter -= 1
           progressBar.progress = 1.0 - (Float(counter)/Float(originalVal))
       }else {
           timer.invalidate()
           screenLabel.text = "Your Eggs Are Ready!!!"
        }
    

   }
}
