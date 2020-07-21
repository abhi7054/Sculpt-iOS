//
//  ProgressViewController.swift
//  Sculpt
//
//  Created by Abhishek Dubey on 01/07/20.
//  Copyright © 2020 Dev Abhi. All rights reserved.
//

import UIKit

class ProgressViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UIScrollViewDelegate {
   
    
    
    let string: String! = nil
    var imagePicker: UIImagePickerController!
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var slidingVIew: UIView!
    @IBOutlet weak var slideUpButton: UIButton!
    @IBOutlet weak var slideDownButton: UIButton!
    @IBOutlet weak var progressCollection: UICollectionView!
    @IBOutlet weak var beforeImageView: UIImageView!
    @IBOutlet weak var progressView: UIView!
    @IBOutlet weak var afterImageView: UIImageView!
    @IBOutlet weak var beforeScrollView: UIScrollView!
    
    let defaults = UserDefaults.standard
    var myarray: [String]!
    var dateArray: [String]!
                   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        beforeScrollView.minimumZoomScale = 1.0
        beforeScrollView.maximumZoomScale = 5.0
        
        myarray = defaults.stringArray(forKey: "SavedStringArray") ?? [String]()
        dateArray = defaults.stringArray(forKey: "date") ?? [String]()
        print(myarray)
        
       
        if myarray.count > 0 {
            
            progressView.isHidden = false
            
            let path = URL.urlInDocumentsDirectory(with: "image0.png").path
                  let image = UIImage(contentsOfFile: path)
                  
                  beforeImageView.image = image
            
            if myarray.count > 1{
                
                let path = URL.urlInDocumentsDirectory(with: "image1.png").path
                let image = UIImage(contentsOfFile: path)
                                 
                afterImageView.image = image
                
            }
            
        }
        
        
       
        
        progressCollection.delegate = self
        progressCollection.dataSource = self
        

       
        
    }
    
    
   func viewForZooming(in scrollView: UIScrollView) -> UIView? {
      
       return beforeImageView
   }
    
    
    @IBAction func slideUp(_ sender: UIButton) {
        
        
        slidingVIew.animShow()
        sender.isHidden = true
        slideDownButton.isHidden = false
        
    }
    
    @IBAction func slideDown(_ sender: UIButton) {
        
        slidingVIew.animHide()
        sender.isHidden = true
        slideUpButton.isHidden = false
        
    }
    @IBAction func takePhoto(_ sender: Any) {
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    @IBAction func importPhoto(_ sender: Any) {
        
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            
            imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        picker.dismiss(animated: true, completion: nil)
               guard var image = info[.originalImage] as? UIImage else {
                   fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
                
               }
        
        
            if let data = image.pngData() {
                
                image = fixOrientation(img: image)
                imageView.image = image
                let filename = getDocumentsDirectory().appendingPathComponent("image\(myarray.count).png")
                
                    
                do {
                    try data.write(to: filename)
                } catch {
                    print(error)
                }
                myarray.append("image\(myarray.count).png")
                
                let date = Date()
                let formatter = DateFormatter()

                formatter.dateFormat = "dd.MM.yyyy"

                let result = formatter.string(from: date)
                
                dateArray.append(result)
                
                defaults.set(myarray, forKey: "SavedStringArray")
                defaults.set(dateArray, forKey: "date")
                
                if myarray.count > 0 {
                    
                    progressView.isHidden = false
                    let path = URL.urlInDocumentsDirectory(with: "image0.png").path
                          let image = UIImage(contentsOfFile: path)
                          
                          beforeImageView.image = image
                    
                    if myarray.count > 1{
                        
                        let path = URL.urlInDocumentsDirectory(with: "image1.png").path
                        let image = UIImage(contentsOfFile: path)
                                         
                        afterImageView.image = image
                    }
                    
                }else{
                    
                     progressView.isHidden = true
                    
                }
                
                
                progressCollection.reloadData()
               }
        
        
        
        
    }
    
    func fixOrientation(img:UIImage) -> UIImage {

        if (img.imageOrientation == UIImage.Orientation.up) {
          return img;
      }

      UIGraphicsBeginImageContextWithOptions(img.size, false, img.scale);
      let rect = CGRect(x: 0, y: 0, width: img.size.width, height: img.size.height)
        img.draw(in: rect)

        let normalizedImage : UIImage = UIGraphicsGetImageFromCurrentImageContext()!
      UIGraphicsEndImageContext();
      return normalizedImage;

    }
   
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if myarray.count > 0{
            return myarray.count
        }
        else{
            return 0
        }
        
       }
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
           
        let cell = self.progressCollection.dequeueReusableCell(withReuseIdentifier: "progressCells", for: indexPath) as! ProgressCollectionViewCell
        
        let path = URL.urlInDocumentsDirectory(with: "image\(indexPath.row).png").path
        let image = UIImage(contentsOfFile: path)
        
        cell.imageView.image = image
        cell.beforeButton.tag = indexPath.row
        cell.beforeButton.addTarget(self,
                                    action: #selector(self.yourFunc(sender:)), for: .touchUpInside)
        cell.afterButton.tag = indexPath.row
        cell.afterButton.addTarget(self,
        action: #selector(self.afteryourFunc(sender:)), for: .touchUpInside)
        
        cell.dateLabel.text = dateArray[indexPath.row]
        
        return cell
        
        
        
       }
   
    @objc func yourFunc(sender : UIButton){
        print(sender.tag)
        let path = URL.urlInDocumentsDirectory(with: "image\(sender.tag).png").path
        let image = UIImage(contentsOfFile: path)
        
        beforeImageView.image = image
        
    }
    
    @objc func afteryourFunc(sender : UIButton){
          print(sender.tag)
          let path = URL.urlInDocumentsDirectory(with: "image\(sender.tag).png").path
          let image = UIImage(contentsOfFile: path)
          
          afterImageView.image = image
          
      }
    
}





extension URL {
    static var documentsDirectory: URL {
        let documentsDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        return URL(string: documentsDirectory)!
    }

    static func urlInDocumentsDirectory(with filename: String) -> URL {
        return documentsDirectory.appendingPathComponent(filename)
    }
}

extension UIView{
    func animShow(){
        UIView.animate(withDuration: 0.5, delay: 0, options: [.curveEaseIn],
                       animations: {
                        self.center.y -= self.bounds.height - 60
                        self.layoutIfNeeded()
        }, completion: nil)
        self.isHidden = false
    }
    func animHide(){
        UIView.animate(withDuration: 0.5, delay: 0, options: [.curveLinear],
                       animations: {
                        self.center.y += self.bounds.height - 60
                        self.layoutIfNeeded()

        },  completion: {(_ completed: Bool) -> Void in
        
            })
    }
}

extension UIImageView {
  func enableZoom() {
    let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(startZooming(_:)))
    isUserInteractionEnabled = true
    addGestureRecognizer(pinchGesture)
  }

  @objc
  private func startZooming(_ sender: UIPinchGestureRecognizer) {
    let scaleResult = sender.view?.transform.scaledBy(x: sender.scale, y: sender.scale)
    guard let scale = scaleResult, scale.a > 1, scale.d > 1 else { return }
    sender.view?.transform = scale
    sender.scale = 1
  }
}
