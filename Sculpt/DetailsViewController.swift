//
//  DetailsViewController.swift
//  Sculpt
//
//  Created by Abhishek Dubey on 30/06/20.
//  Copyright © 2020 Dev Abhi. All rights reserved.
//

import UIKit
import youtube_ios_player_helper

class DetailsViewController: UIViewController, YTPlayerViewDelegate {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var difficultyLabel: UILabel!
    @IBOutlet weak var exerciseNameLabel: UILabel!
    @IBOutlet weak var exerciseImageView: UIImageView!
    @IBOutlet weak var getReadyView: UIView!
    @IBOutlet weak var startButton: UIButton!
  
    @IBOutlet var youtubePayer: YTPlayerView!
    @IBOutlet weak var loadingView: UIView!
    
    
    var titleToSet = ""
    var imageName: String!
    var duration: String!
    var difficulty: String!
    var exerciseName: String!
    var exerciseImageName: String!
    var videoID: String!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        getReadyView.isHidden = true
        
        title = titleToSet
        
        
        image.image = UIImage(named: imageName)
        durationLabel.text = duration
        difficultyLabel.text = difficulty
        exerciseNameLabel.text = exerciseName
        exerciseImageView.image = UIImage(named: exerciseImageName)
        
        let mainWindow = UIApplication.shared.keyWindow!
       
        mainWindow.addSubview(loadingView);
        
        youtubePayer.delegate = self
    }
    
    @IBAction func startAction(_ sender: Any) {
        
        getReadyView.isHidden = false
        startButton.isEnabled = false
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.description == "videoSegue"{
            
            let vc = segue.destination as! WebVIewViewController
            
            vc.videoLink = "https://www.youtube.com/watch?v=b1dkJXjuTsg"
            
        }
        
    }
    
    
    @IBAction func okayAction(_ sender: Any) {
        
        loadingView.isHidden = false
        self.youtubePayer.load(withVideoId: self.videoID, playerVars:["playsinline": 0])
        
        
        
       
               
        
    }
    @IBAction func exitAction(_ sender: Any) {
        
        startButton.isEnabled = true
        getReadyView.isHidden = true
    }
    
    @IBAction func likeButton(_ sender: UIButton) {
        
        if sender.currentImage == UIImage(named: "heart"){
            
            sender.setImage(UIImage(named: "heart_selected"), for: .normal)
            
        }else{
            
            sender.setImage(UIImage(named: "heart"), for: .normal)
                      
            
        }
        
    }
    
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        
        let value = UIInterfaceOrientation.landscapeRight.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        playerView.playVideo()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) { [unowned self] in
            self.loadingView.isHidden = true
            
        }
        
    }
    
    
   
  
    @IBAction func equipmentNeeded(_ sender: Any) {
        
        openBrowser(string: "https://www.sculptfitapp.com/equipments")
        
    }
    
    func openBrowser(string: String){
       
           if let url = URL(string: string) {
                 UIApplication.shared.open(url)
             }
           
       }
    
}
