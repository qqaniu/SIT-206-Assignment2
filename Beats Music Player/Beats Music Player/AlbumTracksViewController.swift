//
//  AlbumTracksViewController.swift
//  Beats Music Player
//
//  Created by Qani Qaniu on 18/5/17.
//  Copyright © 2017 Qani Qaniu. All rights reserved.
//

import UIKit
import AVFoundation

var songname = "Congratulations"
var albumsongs:[String] = []

class AlbumTracksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var albumSongTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = albumsongs[indexPath.row]
        cell.backgroundColor = UIColor.clear
        cell.textLabel?.textColor = UIColor.init(red: 236, green: 236, blue: 236, alpha: 100)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        do
        {
            let audioPath = Bundle.main.path(forResource: albumsongs[indexPath.row], ofType: ".mp3")
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
            gettingAlbumSongNames()
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
    func gettingAlbumSongNames()
    {
        let folderURL = URL(fileURLWithPath:Bundle.main.resourcePath!)
        
        do
        {
            let SongPath = try FileManager.default.contentsOfDirectory(at: folderURL, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
            
            //loop through the found urls
            for song in SongPath
            {
                var mySong = song.absoluteString
                
                if mySong.contains(".mp3") && mySong.contains("\(songname)")
                {
                    let findString = mySong.components(separatedBy: "/")
                    mySong = findString[findString.count-1]
                    mySong = mySong.replacingOccurrences(of: "%20", with: " ")
                    mySong = mySong.replacingOccurrences(of: ".mp3", with: "")
                    albumsongs.append(mySong)
                }
                
            }
            
            albumSongTableView.reloadData()
        }
        catch
        {
            print ("ERROR")
        }
    }
}

