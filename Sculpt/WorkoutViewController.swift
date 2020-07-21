//
//  WorkoutViewController.swift
//  Sculpt
//
//  Created by Abhishek Dubey on 23/06/20.
//  Copyright © 2020 Dev Abhi. All rights reserved.
//

import UIKit
import StoreKit

class WorkoutViewController: UIViewController, UITextFieldDelegate, SKPaymentTransactionObserver {
    
    
   
    @IBOutlet weak var subscriptionView: UIView!
    
    
    let productID = "Sculpt_IAP"
    
    let imageNames = ["booty_sculpt", "tight_tummy", "arm_toner", "butt_and_core", "home_cardio", "six_pack_abs", "back_burner", "body_pump", "perfect_glutes", "beach_body", "tushy_toner", "reduce_cellulite", "booty_booster", "full_body_blast", "summer_abs", "tone_and_shape", "lift_and_firm", "flat_abs", "bubble_butt", "better_back", "slim_waist", "lean_legs", "tank_top_arms", "upper_body_sculpt", "full_body_sweat", "hiit_workout", "leg_shaper", "body_burn", "butt_and_thighs", "chest_toner", "perfect_body", "lower_body_hiit", "summer_body", "total_strength", "hot_legs", "bikini_body"]
    
    let exerciseNames = ["Booty Sculpt", "Tight Tummy", "Arm Toner", "Butt & Core", "Home Cardio", "6 Pack Abs", "Back Burner", "Body Pump", "Perfect Glutes", "Beach Body", "Tushy Toner", "Reduce Cellulite", "Booty Booster", "Full Body Blast", "Summer Abs", "Tone & Shape", "Lift & Firm", "Flat Abs", "Bubble Butt", "Better Back", "Slim Waist", "Lean Legs", "Tank Top Arms", "Upper Body Sculpt", "Full Body Sweat", "Hiit Workout", "Leg Shaper", "Body Burn", "Butt & Thighs", "Chest Toner", "Perfect Body", "Lower Body Hiit", "Summer Body", "Total Strength", "Hot Legs", "Bikini Body"]
    
    let workoutImageNames = ["booty_sculpt_in", "tight_tummy_in", "arm_toner_in", "butt_core_in", "home_cardio_in", "six_pack_abs_in", "back_burner_in", "body_pump_in", "perfect_glutes_in", "beach_body_in", "tushy_toner_in", "reduce_cellulite_in", "booty_booster_in", "full_body_blast_in", "summer_abs_in", "tone_shape_in", "lift_firm_in", "flat_abs_in", "bubble_butt_in", "better_back_in", "slim_waist_in", "lean_legs_in", "tank_top_arms_in", "upper_body_sculpt_in", "full_body_sweat_in", "hiit_in", "leg_shaper_in", "body_burn_in", "butt_thighs_in", "chest_toner_in", "perfect_body_in", "lean_legs_in", "summer_body_in", "total_strength_in", "hot_legs_in", "bikini_body_in"]

    let durations = ["8 Mins", "7 Mins", "6 Mins", "6 Mins", "6 Mins", "12 Mins", "7 Mins", "6 Mins", "6 Mins", "6 Mins", "7 Mins", "7 Mins", "6 Mins", "6 Mins", "5 Mins", "6 Mins", "19 Mins", "6 Mins", "9 Mins", "8 Mins", "5 Mins", "7 Mins", "6 Mins", "6 Mins", "8 Mins", "16 Mins", "9 Mins", "10 Mins", "11 Mins", "32 Mins", "16 Mins", "9 Mins", "10 Mins", "23 Mins", "3 Mins", "10 Mins"]
    
    let videoId = ["8cLbCA-o424", "UW8mThzLYsY", "fLzzb_q8wY4", "vctkeSYoq-c", "Od3pKp73zDQ", "8cLbCA-o424", "ZQLPZev-PV0", "ko5CB_AL3L8", "qjAnKGfJSJQ", "6E2hSkOBLyE", "CmMoFwPgRUk", "uwKUSIEbvVM", "6ozwproCDjE", "UbZhRnDEyUU", "8cLbCA-o424", "8cLbCA-o424", "8cLbCA-o424", "8cLbCA-o424", "8cLbCA-o424", "8cLbCA-o424", "8cLbCA-o424", "8cLbCA-o424", "8cLbCA-o424", "8cLbCA-o424", "8cLbCA-o424", "8cLbCA-o424", "8cLbCA-o424", "8cLbCA-o424", "8cLbCA-o424", "8cLbCA-o424", "8cLbCA-o424", "8cLbCA-o424", "8cLbCA-o424", "8cLbCA-o424", "8cLbCA-o424", "8cLbCA-o424"]
    
    let difficulties = ["Intermediate", "Intermediate"]
    
    var selectedIndex: Int!
    
    
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var workoutTableView: UITableView!
    @IBOutlet weak var searchWorkoutTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        SKPaymentQueue.default().add(self)
        
        searchWorkoutTextField.delegate = self
        searchWorkoutTextField.addTarget(self, action: #selector(myTargetFunction), for: .touchDown)
        searchWorkoutTextField.returnKeyType = .search
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")

        view.addGestureRecognizer(tap)
        tap.cancelsTouchesInView = false
        
        }
    
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
           
        for transaction in transactions {
            
            if transaction.transactionState == .purchased{
                    
                subscriptionView.isHidden = true
                
            }else{
                subscriptionView.isHidden = false
            }
            
        }
        
       }
    
    @IBAction func closeAppButton(_ sender: Any) {
        
        
        
    }
    @IBAction func purchaseButton(_ sender: Any) {
        
        if SKPaymentQueue.canMakePayments(){
            
            let paymentRequest = SKMutablePayment()
            
            paymentRequest.productIdentifier = productID
            
            SKPaymentQueue.default().add(paymentRequest)
            
            
        }
        
    }
    @IBAction func searchSelection(_ sender: UIButton) {
        
        if sender.backgroundColor == .none{
            
            sender.backgroundColor = .lightGray
            
        }else{
            
            sender.backgroundColor = .none
            
        }
        
    }
    
    
    
    @objc func dismissKeyboard() {
        
        view.endEditing(true)
        
    }
    
    @objc func myTargetFunction(textField: UITextField) {
               print("myTargetFunction")
        searchView.isHidden = false
           }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        searchView.isHidden = true
        self.view.endEditing(true)
        return false
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "workoutSegue"{
            
            let vc = segue.destination as! DetailsViewController
            
            vc.titleToSet = self.exerciseNames[self.selectedIndex]
            vc.imageName = self.imageNames[self.selectedIndex]
            vc.duration = self.durations[self.selectedIndex]
            vc.difficulty = self.difficulties[0]
            vc.exerciseName = self.exerciseNames[self.selectedIndex]
            vc.exerciseImageName = self.workoutImageNames[self.selectedIndex]
            vc.videoID = self.videoId[self.selectedIndex]
            
            
        }
        
    }

}

extension WorkoutViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        let cell = self.workoutTableView.dequeueReusableCell(withIdentifier: "workoutCell") as! WorkoutTableViewCell
        cell.selectionStyle = .none
        
        if indexPath.row != 4{
            cell.workoutImage.image = UIImage(named: imageNames[indexPath.row])
        }
        
        cell.exerciseNameTextView.text = self.exerciseNames[indexPath.row]
        cell.durationTextView.text = self.durations[indexPath.row]
        cell.difficultyTextView.text = self.difficulties[0]
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print(indexPath.row)
        
        self.selectedIndex = indexPath.row
    
        
        performSegue(withIdentifier: "workoutSegue", sender: self)
        
    }
    
    
   
}
@IBDesignable extension UIButton {

       @IBInspectable var borderWidth: CGFloat {
           set {
               layer.borderWidth = newValue
           }
           get {
               return layer.borderWidth
           }
       }

       @IBInspectable var cornerRadius: CGFloat {
           set {
               layer.cornerRadius = newValue
           }
           get {
               return layer.cornerRadius
           }
       }

       @IBInspectable var borderColor: UIColor? {
           set {
               guard let uiColor = newValue else { return }
               layer.borderColor = uiColor.cgColor
           }
           get {
               guard let color = layer.borderColor else { return nil }
               return UIColor(cgColor: color)
           }
       }
    
   }
   

