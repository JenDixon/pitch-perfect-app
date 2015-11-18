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
    
    var quotePlayer: AVAudioPlayer!
    var receivedAudio: RecordedAudio!
    
    func playSounds(rate: Float) {
        quotePlayer!.stop()
        quotePlayer!.rate = rate
        quotePlayer!.play()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        try! quotePlayer = AVAudioPlayer(contentsOfURL: receivedAudio!.filePathUrl)
        quotePlayer.enableRate = true

        
        
//        if let quotePlayer = self.setupAudioPlayerWithFile("gump_quote", type: "mp3"){
//            self.quotePlayer = quotePlayer
//        }
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func playSoundsSlowly(sender: UIButton) {
        self.playSounds(0.5)
    }
    
    @IBAction func playSoundsFast(sender: UIButton) {
        self.playSounds(1.5)
    }
    
    @IBAction func stopAudio(sender: UIButton) {
        quotePlayer!.stop()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
