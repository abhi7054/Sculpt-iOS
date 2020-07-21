//
//  GIFViewController.swift
//  Sculpt
//
//  Created by Abhishek Dubey on 01/07/20.
//  Copyright © 2020 Dev Abhi. All rights reserved.
//

import UIKit

class GIFViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.loadGif(name: "splash")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.2) { [unowned self] in
            self.performSegue(withIdentifier: "s", sender: nil)
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
