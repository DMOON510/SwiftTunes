//
//  SecondViewController.swift
//  SwiftTunes
//
//  Created by Donna Moon on 8/13/21.
//  Copyright © 2021 Donna Moon. All rights reserved.
//

import UIKit
import AVFoundation

class SecondViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var myImageView: UIImageView!
    
    
    @IBAction func play(_ sender: Any) {
        if audioPlayer.isPlaying == false
        {
        audioPlayer.play()
        }
    }
    @IBAction func pause(_ sender: Any) {
        if audioPlayer.isPlaying
        {
            audioPlayer.pause()
        }
    }
    @IBAction func prev(_ sender: Any) {
        if currentSong != 0
        {
            playSong(thisOne: songs[currentSong-1])
            currentSong = currentSong - 1
            label.text = songs[currentSong]
        }
        else
        {
            currentSong = songs.count-1
            playSong(thisOne:songs[currentSong])
            label.text = songs[currentSong]
        }
        
    }
    
    @IBAction func next(_ sender: Any) {
        if currentSong < songs.count-1
        {
        playSong(thisOne: songs[currentSong+1])
        currentSong = currentSong + 1
        label.text = songs[currentSong]
        }
        else
        {
            currentSong = 0
            playSong(thisOne:songs[currentSong])
            label.text = songs[currentSong]
        }
    }
    
    @IBAction func slider(_ sender: UISlider) {
        audioPlayer.volume = sender.value
    }
    
    func playSong(thisOne:String)
    {
        do
        {
            let audioPath = Bundle.main.path(forResource: thisOne, ofType: ".mp3")
            try audioPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
            audioPlayer.play()
        }
        catch
        {
            print("Error!")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = songs[currentSong]
        // Do any additional setup after loading the view.
    }

}
