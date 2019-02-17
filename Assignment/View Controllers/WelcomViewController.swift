//
//  ViewController.swift
//  Assignment
//
//  Created by Muhammad Sajad on 17/02/2019.
//  Copyright © 2019 Muhammad Sajad. All rights reserved.
//

import UIKit

class WelcomViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //Mark:- Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier ==  "submitSegue" {
            if let name = nameTextField.text,
                !name.isEmpty {
                let helloVC = segue.destination as! HelloViewController
                helloVC.name = name
            } else {
                let alertVC = UIAlertController(title: "Missing Name", message: "Please make sure to put in your name before proceeding.", preferredStyle: .alert)
                let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                
                alertVC.addAction(cancelAction)
                self.present(alertVC, animated: true, completion: nil)
            }
        }
    }
}

