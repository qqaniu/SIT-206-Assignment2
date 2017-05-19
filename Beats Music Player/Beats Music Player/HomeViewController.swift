//
//  HomeViewController.swift
//  Beats Music Player
//
//  Created by Qani Qaniu on 18/5/17.
//  Copyright © 2017 Qani Qaniu. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var playResumeButton: UIButton!
    
    @IBAction func playpause(_ sender: UIButton)
    {
        if audioStuffed == true && audioPlayer.isPlaying
        {
            audioPlayer.pause()
            sender.setImage(#imageLiteral(resourceName: "play"), for: .normal)
        }
        else if audioStuffed == true && audioPlayer.isPlaying == false
        {
            audioPlayer.play()
            sender.setImage(#imageLiteral(resourceName: "pause"), for: .normal)
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if audioStuffed == true && audioPlayer.isPlaying
        {
            songName.text = songs[thisSong]
            playResumeButton.setImage(#imageLiteral(resourceName: "pause"), for: .normal)
            
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    @IBOutlet weak var songName: UILabel!
    
}

