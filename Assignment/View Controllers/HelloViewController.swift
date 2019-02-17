//
//  HelloViewController.swift
//  Assignment
//
//  Created by Muhammad Sajad on 17/02/2019.
//  Copyright © 2019 Muhammad Sajad. All rights reserved.
//

import UIKit

class HelloViewController: UIViewController {

    @IBOutlet weak var greetingLabel: UILabel! {
        didSet {
            updateUI()
        }
    }
    @IBOutlet weak var timeLabel: UILabel! {
        didSet {
            updateClock()
        }
    }
    
    //Model
    var name = "" {
        didSet {
            updateUI()
        }
    }
    
    //private api
    
    private weak var timer: Timer?
    
    private func updateUI() {
        greetingLabel?.text = "Hello \(name)"
    }
    
    private func updateClock() {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "dd/MM/yyyy HH:mm:ss.SSS"
        let date = Date()
        timeLabel.text = dateFormat.string(from: date)
    }
    
    //Life Cycle
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        timer = Timer.scheduledTimer(withTimeInterval: 0.001, repeats: true, block: { (timer) in
            self.updateClock()
        })
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer?.invalidate()
    }

}
