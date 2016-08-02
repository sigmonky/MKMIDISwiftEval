//
//  ViewController.swift
//  MKMIDISwiftEval
//
//  Created by Randy Weinstein on 7/30/16.
//  Copyright © 2016 fakeancient. All rights reserved.
//

import UIKit
import MIKMIDI

class ViewController: UIViewController {
    
    let synthesizer = MIKMIDISynthesizer()
    let sequencer = MIKMIDISequence()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            let _ = try sequencer.addTrack()
            let track = sequencer.tracks[0]
            let note1 = MIKMIDINoteEvent(timeStamp: 0.0,note:60,velocity:100,duration:5,channel:0)
            let note2 = MIKMIDINoteEvent(timeStamp: 0.0,note:63,velocity:100,duration:5,channel:0)
            track.addEvents([note1!,note2!])
            
        } catch {
            
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: UI Action Handlers
    @IBAction func playMIDI(sender: AnyObject) {
        
        let soundfont = NSBundle.mainBundle().URLForResource("Grand Piano", withExtension: "sf2")
        
        do {
            
            let _ = try synthesizer!.loadSoundfontFromFileAtURL(soundfont!)
            let note:UInt = 60
            let noteOn1 = MIKMIDINoteOnCommand(note: note, velocity: 100, channel: 0, midiTimeStamp: MIDITimeStamp(0.0))
            let noteOn2 = MIKMIDINoteOnCommand(note: note + 3, velocity: 100, channel: 0, midiTimeStamp: MIDITimeStamp(0.0))
            
            synthesizer!.handleMIDIMessages([noteOn1,noteOn2])
        } catch  {
            
        }
        
    }



}

