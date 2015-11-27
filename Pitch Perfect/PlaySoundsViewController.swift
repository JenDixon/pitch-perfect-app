//
//  PlaySoundsViewController.swift
//  Pitch Perfect
//
//  Created by Jennifer Dixon on 11/3/15.
//  Copyright © 2015 Jennifer Dixon. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {

    @IBOutlet weak var PlaySoundButton: UIButton!
    @IBOutlet weak var PlaySoundsFast: UIButton!
    @IBOutlet weak var StopAudio: UIButton!
    @IBOutlet weak var PlayChipmunkButton: UIButton!
    @IBOutlet weak var PlayDarthVader: UIButton!
    
    var quotePlayer: AVAudioPlayer!
    var receivedAudio: RecordedAudio!
    
    var audioEngine:AVAudioEngine!
    var audioFile:AVAudioFile!
    
    func playSounds(rate: Float) {
        quotePlayer!.stop()
        quotePlayer!.rate = rate
        quotePlayer!.play()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        try! quotePlayer = AVAudioPlayer(contentsOfURL: receivedAudio!.filePathUrl)
        quotePlayer.enableRate = true
        
        audioEngine = AVAudioEngine()
        audioFile = try! AVAudioFile(forReading: receivedAudio.filePathUrl)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func playSoundsSlowly(sender: UIButton) {
        audioEngine.stop()
        audioEngine.reset()
        self.playSounds(0.5)
    }
    
    @IBAction func playSoundsFast(sender: UIButton) {
        audioEngine.stop()
        audioEngine.reset()
        self.playSounds(1.5)
    }
    
    @IBAction func playChipmunkAudio(sender: UIButton) {
        playAudioWithVariablePitch(1000)
    }
    
    @IBAction func playDarthVaderAudio(sender: UIButton) {
        playAudioWithVariablePitch(-1000)
    }
    
    func playAudioWithVariablePitch(pitch: Float){
        quotePlayer.stop()
        audioEngine.stop()
        audioEngine.reset()
        
        let audioPlayerNode = AVAudioPlayerNode()
        audioEngine.attachNode(audioPlayerNode)
        
        let changePitchEffect = AVAudioUnitTimePitch()
        changePitchEffect.pitch = pitch
        audioEngine.attachNode(changePitchEffect)
        
        audioEngine.connect(audioPlayerNode, to: changePitchEffect, format: nil)
        audioEngine.connect(changePitchEffect, to: audioEngine.outputNode, format: nil)
        
        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        try! audioEngine.start()
        
        audioPlayerNode.play()
    }
    
    @IBAction func stopAudio(sender: UIButton) {
        quotePlayer!.stop()
    }
}
