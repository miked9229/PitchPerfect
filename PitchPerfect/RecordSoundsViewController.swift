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
    
    
    override func viewWillAppear(_ animated: Bool) {
        stopRecordingButton.isEnabled = false
    }
    

    @IBAction func recordAudio(_ sender: AnyObject) {
    
        configureRecordingButtons(true)
        
        
        // Declares a place in the User's home directory
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
    
        print(dirPath)
        // Declares a sound file
        let recordingName = "recordedVoice.wav"
    
        let pathArray = [dirPath, recordingName]
        
        // Grabs the file path
        let filePath = URL.fileURL(withPathComponents: pathArray)
    
        print(filePath)
        // Declares an AVAudioSession
        
        let session = AVAudioSession.sharedInstance()
        
       // Tries to set a cateogry
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord)
        
        // tries to put the audio recorder at the file path
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        
        
        
        // records the audio.
        audioRecorder.delegate = self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }


    @IBAction func stopRecording(_ sender: AnyObject) {
        configureRecordingButtons(false)
        
        //Stopping the audo recording
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
        
    
    
    }
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        print("AVAudioRecorder did finish recording")
        if (flag) {
            performSegue(withIdentifier: "stopRecording", sender: audioRecorder.url)
        } else {
            print("AVAudioRecorder did finish recording")
        }
        
    
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "stopRecording" {
            let playSoundsVC = segue.destination as! PlaySoundsViewController
            let recordedAudioURL = sender as! URL
            playSoundsVC.recordedAudioURL = recordedAudioURL
        }
    }
    
    
    func configureRecordingButtons(_ isRecording: Bool) {
        
        recordingLabel.text = isRecording ? "Recording in progress" : "Tap to record"
        recordingButton.isEnabled = isRecording ? false : true
        stopRecordingButton.isEnabled = isRecording ? true: false
    }
    
}

