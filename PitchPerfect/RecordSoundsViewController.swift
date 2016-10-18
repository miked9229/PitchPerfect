//
//  RecordSoundsViewController.swift
//  PitchPerfect
//
//  Created by Michael Doroff on 10/11/16.
//  Copyright © 2016 Michael Doroff. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController , AVAudioRecorderDelegate {

    
    @IBOutlet weak var stopRecordingButton: UIButton!
    @IBOutlet weak var recordingButton: UIButton!
    @IBOutlet weak var recordingLabel: UILabel!
    
    var audioRecorder: AVAudioRecorder!
    
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
        print("Recording button pressed")
        stopRecordingButton.enabled = true
        recordingButton.enabled = false
        
        
        // Declares a place in the User's home directory
        let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
    
        print(dirPath)
        // Declares a sound file
        let recordingName = "recordedVoice.wav"
    
        let pathArray = [dirPath, recordingName]
        
        // Grabs the file path
        let filePath = NSURL.fileURLWithPathComponents(pathArray)
    
        print(filePath)
        // Declares an AVAudioSession
        
        let session = AVAudioSession.sharedInstance()
        
       // Tries to set a cateogry
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord)
        
        // tries to put the audio recorder at the file path
        try! audioRecorder = AVAudioRecorder(URL: filePath!, settings: [:])
        
        
        
        // records the audio.
        audioRecorder.delegate = self
        audioRecorder.meteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }


    @IBAction func stopRecording(sender: AnyObject) {
        print("Stop recording button pressed")
        recordingLabel.text = "Tap to record"
        stopRecordingButton.enabled = false
        recordingButton.enabled = true
        
        //Stopping the audo recording
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
        
    
    
    }
    func audioRecorderDidFinishRecording(recorder: AVAudioRecorder, successfully flag: Bool) {
        print("AVAudioRecorder did finish recording")
        if (flag) {
            self.performSegueWithIdentifier("stopRecording", sender: audioRecorder.url)
        } else {
            print("AVAudioRecorder did finish recording")
        }
        
    
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "stopRecording" {
            let playSoundsVC = segue.destinationViewController as! PlaySoundsViewController
            let recordedAudioURL = sender as! NSURL
            playSoundsVC.recordedAudioURL = recordedAudioURL
        }
    }
    
    
}

