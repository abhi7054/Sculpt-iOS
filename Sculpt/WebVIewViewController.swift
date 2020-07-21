//
//  WebVIewViewController.swift
//  Sculpt
//
//  Created by Abhishek Dubey on 30/06/20.
//  Copyright © 2020 Dev Abhi. All rights reserved.
//

import UIKit
import WebKit
import youtube_ios_player_helper

class WebVIewViewController: UIViewController, YTPlayerViewDelegate {
    
    @IBOutlet weak var webView: WKWebView!
 
    
    var videoLink = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")

    }
    
    
  
    
    

   
}
