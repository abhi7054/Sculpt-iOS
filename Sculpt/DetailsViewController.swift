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
  
    @IBOutlet weak var likedButton: UIButton!
    @IBOutlet var youtubePayer: YTPlayerView!
    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var exerciseDescriptionLabel: UILabel!
    
    
    var titleToSet = ""
    var imageName: String!
    var duration: String!
    var difficulty: String!
    var exerciseName: String!
    var exerciseImageName: String!
    var videoID: String!
    var equipmentLink: String!
    var exerciseDescription: String!
    
    let defaults = UserDefaults.standard
    
    var likedArray: [String]!
    var likedImageArray: [String]!
    var likedDifficultyArray: [String]!
    var likedDurationArray: [String]!
    var likedVideoIdArray: [String]!
    var likedExerciseImage: [String]!
    var likedDescriptionArray: [String]!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        getReadyView.isHidden = true
        
        title = titleToSet
        
        likedArray = defaults.stringArray(forKey: "likedArray") ?? [String]()
        likedImageArray = defaults.stringArray(forKey: "likedImageArray") ?? [String]()
        likedDifficultyArray = defaults.stringArray(forKey: "likedDifficultyArray") ?? [String]()
        likedDurationArray = defaults.stringArray(forKey: "likedDurationArray") ?? [String]()
        likedVideoIdArray = defaults.stringArray(forKey: "likedVideoIdArray") ?? [String]()
        likedExerciseImage = defaults.stringArray(forKey: "likedExerciseImageArray") ?? [String]()
        likedDescriptionArray = defaults.stringArray(forKey: "likedDescriptionArray") ?? [String]()
        
        print(likedArray)
        print(likedImageArray)
        print(likedDifficultyArray)
        print(likedDurationArray)
        print(likedVideoIdArray)
        print(likedExerciseImage)
        
        
        
        image.image = UIImage(named: imageName)
        durationLabel.text = duration
        difficultyLabel.text = difficulty
        exerciseNameLabel.text = exerciseName
        exerciseImageView.image = UIImage(named: exerciseImageName)
        exerciseDescriptionLabel.text = exerciseDescription
        
        if likedArray.contains(exerciseName){
            
            likedButton.setImage(UIImage(named: "heart_selected"), for: .normal)
        }
        
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
            
            likedArray.append(exerciseName)
            likedDurationArray.append(duration)
            likedDifficultyArray.append(difficulty)
            likedImageArray.append(imageName)
            likedExerciseImage.append(exerciseImageName)
            likedVideoIdArray.append(videoID)
            likedDescriptionArray.append(exerciseDescription)
            defaults.set(likedArray, forKey: "likedArray")
            defaults.set(likedImageArray, forKey: "likedImageArray")
            defaults.set(likedDifficultyArray, forKey: "likedDifficultyArray")
            defaults.set(likedDurationArray, forKey: "likedDurationArray")
            defaults.set(likedVideoIdArray, forKey: "likedVideoIdArray")
            defaults.set(likedExerciseImage, forKey: "likedExerciseImageArray")
            defaults.set(likedDescriptionArray, forKey: "likedDescriptionArray")
            
        }else{
            
            sender.setImage(UIImage(named: "heart"), for: .normal)
                        
           
            if likedArray.count > 0{
                likedArray.removeAll(where: { $0 == exerciseName})
                defaults.set(likedArray, forKey: "likedArray")
                defaults.set(likedImageArray, forKey: "likedImageArray")
                defaults.set(likedDifficultyArray, forKey: "likedDifficultyArray")
                defaults.set(likedDurationArray, forKey: "likedDurationArray")
                defaults.set(likedVideoIdArray, forKey: "likedVideoIdArray")
                defaults.set(likedExerciseImage, forKey: "likedExerciseImageArray")
                defaults.set(likedDescriptionArray, forKey: "likedDescriptionArray")
            }
           
            
        }
        
    }
    
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        
        let value = UIInterfaceOrientation.landscapeRight.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        playerView.playVideo()
        getReadyView.isHidden = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) { [unowned self] in
            self.loadingView.isHidden = true
            self.startButton.isEnabled = true
            
        }
        
    }
    
    
   
  
    @IBAction func equipmentNeeded(_ sender: Any) {
        
        openBrowser(string: equipmentLink)
        
    }
    
    func openBrowser(string: String){
       
           if let url = URL(string: string) {
                 UIApplication.shared.open(url)
             }
           
       }
    
}
