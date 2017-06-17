//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by Michael Doroff on 10/18/16.
//  Copyright © 2016 Michael Doroff. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {

    
    
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    
    
    var recordedAudioURL: URL!
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    enum ButtonType: Int { case echo = 0, reverb, fast, slow, chipmunk, vader }
    
    @IBAction func playSoundForButton(_ sender: AnyObject) {
        switch(ButtonType(rawValue: sender.tag)!) {
        case .echo:
            playSound(echo: true)
        case .reverb:
            playSound(reverb: true)
        case .fast:
            playSound(rate:1.5)
        case .slow:
            playSound(rate: 0.5)
        case .chipmunk:
            playSound(pitch: 1000)
        case .vader:
            playSound(pitch:-1000)
        
        }
        configureUI(.playing)
        stopButton.isEnabled = true
        
    }
    
    @IBAction func stopButtonPressed(_ sender: AnyObject) {
        print("Stop audio button pressed")
        stopAudio()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()

        // Do any additional setup after loading the view.
    }


    override func viewWillAppear(_ animated: Bool) {
        configureUI(.notPlaying)
    }
    

}
