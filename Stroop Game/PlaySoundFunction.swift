//
//  PlaySoundFunction.swift
//  
//
//  Created by Justin Lewis on 12/4/18.
//

import AVFoundation


///// Plays sound "soundName".mp3
var player:AVAudioPlayer = AVAudioPlayer()
func playSound (_ soundName: String){
    let audioPath = NSString(string: Bundle.main.path(forResource: soundName, ofType: "mp3")!)
    do {
        player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath as String))
    } catch _ {
        print("ERROR: in playSound function")
    }
    player.play()
}
