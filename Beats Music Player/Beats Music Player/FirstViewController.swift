//
//  FirstViewController.swift
//  Beats Music Player
//
//  Created by Qani Qaniu on 18/5/17.
//  Copyright © 2017 Qani Qaniu. All rights reserved.
//

import UIKit
import AVFoundation

var audioPlayer = AVAudioPlayer()
var songs:[String] = []
var thisSong = 0
var audioStuffed = false
var counter = 0

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var myTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = songs[indexPath.row]
        cell.backgroundColor = UIColor.clear
        cell.textLabel?.textColor = UIColor.init(red: 236, green: 236, blue: 236, alpha: 100)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        do
        {
            let audioPath = Bundle.main.path(forResource: songs[indexPath.row], ofType: ".mp3")
            try audioPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
            audioPlayer.play()
            thisSong = indexPath.row
            audioStuffed = true
        }
        catch
        {
            print ("ERROR")
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        if counter == 0
        {
            gettingSongNames()
            counter = 1
        }
        else
        {
            
        }
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    
    //FUNCTION THAT GETS THE NAME OF THE SONGS
    func gettingSongNames()
    {
        let folderURL = URL(fileURLWithPath:Bundle.main.resourcePath!)
        
        do
        {
            let songPath = try FileManager.default.contentsOfDirectory(at: folderURL, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
            
            //loop through the found urls
            for song in songPath
            {
                var mySong = song.absoluteString
                
                if mySong.contains(".mp3")
                {
                    let findString = mySong.components(separatedBy: "/")
                    mySong = findString[findString.count-1]
                    mySong = mySong.replacingOccurrences(of: "%20", with: " ")
                    mySong = mySong.replacingOccurrences(of: ".mp3", with: "")
                    songs.append(mySong)
                }
                
            }
            
            myTableView.reloadData()
        }
        catch
        {
            print ("ERROR")
        }
    }
}

