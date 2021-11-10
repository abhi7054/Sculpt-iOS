//
//  FoodViewController.swift
//  Sculpt
//
//  Created by Abhishek Dubey on 01/07/20.
//  Copyright © 2020 Dev Abhi. All rights reserved.
//

import UIKit
import WebKit
import PDFKit

class FoodViewController: UIViewController {
    
    
    @IBOutlet weak var pdfView: PDFView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        if let path = Bundle.main.path(forResource: "ken_rawlins_ebook", ofType: "pdf") {
            if let pdfDocument = PDFDocument(url: URL(fileURLWithPath: path)) {
                pdfView.displayMode = .singlePageContinuous
                pdfView.autoScales = true
                pdfView.displayDirection = .vertical
                pdfView.document = pdfDocument
                
                
            }
            
            
            
        }
        
    }
}
