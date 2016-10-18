//
//  ViewController.swift
//  PitchPerfect
//
//  Created by Michael Doroff on 10/11/16.
//  Copyright © 2016 Michael Doroff. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var stopRecordingButton: UIButton!
    @IBOutlet weak var recordingButton: UIButton!
    
    @IBOutlet weak var recordingLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        stopRecordingButton.enabled = false
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func recordAudio(sender: AnyObject) {
    
        recordingLabel.text = "Recording in progress"
        stopRecordingButton.enabled = true
        recordingButton.enabled = false
    }


    @IBAction func stopRecording(sender: AnyObject) {
        print("Stop recording button pressed")
        recordingLabel.text = "Tap to record"
        stopRecordingButton.enabled = false
        recordingButton.enabled = true
        
    
    
    }
}

