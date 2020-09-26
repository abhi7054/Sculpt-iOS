//
//  MoreViewController.swift
//  Sculpt
//
//  Created by Abhishek Dubey on 01/07/20.
//  Copyright © 2020 Dev Abhi. All rights reserved.
//

import UIKit
import StoreKit

class MoreViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var table1: UITableView!
    let firstList = ["About Sculpt", "Restore Purchases", "Sculpt Website"]
    let secondList = ["Rate Us", "Contact Us", "Stream To TV", "Terms & Conditions", "Privacy Policy"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.table1{
            return firstList.count
        }else{
            return secondList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == self.table1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
            cell!.selectionStyle = .none
            cell?.textLabel?.text = firstList[indexPath.row]
            return cell!
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellTwo")!
            cell.selectionStyle = .none
            cell.textLabel?.text = secondList[indexPath.row]
            return cell
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            if tableView == table1{
                openBrowser(string: "https://www.sculptfitapp.com/about")
            }else{
                openBrowser(string: "itms-apps://itunes.apple.com/app/id1521720885")
            }
        }
        
        if indexPath.row == 1{
            if tableView != table1{
                let email = "ken@kenrawlins.com"
                if let url = URL(string: "mailto:\(email)") {
                    if #available(iOS 10.0, *) {
                        UIApplication.shared.open(url)
                    } else {
                        UIApplication.shared.openURL(url)
                    }
                }
            }else{
                SKPaymentQueue.default().restoreCompletedTransactions()
            }
        }
        
        if indexPath.row == 2 {
            if tableView == table1{
                openBrowser(string: "https://www.sculptfitapp.com/homes")
            }else{
                openBrowser(string: "https://support.apple.com/en-gb/guide/iphone/iphd29858fd3/ios")
            }
        }
        if indexPath.row == 3 {
            openBrowser(string: "https://www.hypertapp.com")
        }
        if indexPath.row == 4 {
            openBrowser(string: "https://www.hypertapp.com")
        }
    }
    
    func openBrowser(string: String){
        if let url = URL(string: string) {
            UIApplication.shared.open(url)
        }
    }
}
