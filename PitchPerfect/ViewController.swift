//
//  ViewController.swift
//  PitchPerfect
//
//  Created by Michael Doroff on 10/11/16.
//  Copyright © 2016 Michael Doroff. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var recordingLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(animated: Bool) {
        print("Hello World")
    }


    @IBAction func recordAudio(sender: AnyObject) {
    
        recordingLabel.text = "Recording in progress"
    }


}

