//
//  WorkoutViewController.swift
//  Sculpt
//
//  Created by Abhishek Dubey on 23/06/20.
//  Copyright © 2020 Dev Abhi. All rights reserved.
//

import UIKit
import StoreKit

class WorkoutViewController: UIViewController, UITextFieldDelegate, SKPaymentTransactionObserver, SKProductsRequestDelegate {
    
    @IBOutlet weak var subscriptionView: UIView!
    var productsRequest: SKProductsRequest!
    let productID = "Subscription"
    let baseURL = "https://www.sculptfitapp.com/"
    
    let imageNames = ["booty_sculpt", "tight_tummy", "arm_toner", "butt_and_core", "shutterstock_727673917", "six_pack_abs", "back_burner", "body_pump", "perfect_glutes", "beach_body", "tushy_toner", "reduce_cellulite", "booty_booster", "full_body_blast", "summer_abs", "tone_and_shape", "lift_and_firm", "flat_abs", "bubble_butt", "better_back", "slim_waist", "lean_legs", "tank_top_arms", "upper_body_sculpt", "full_body_sweat", "hiit_workout", "leg_shaper", "body_burn", "butt_and_thighs", "chest_toner", "perfect_body", "lower_body_hiit", "summer_body", "total_strength", "hot_legs", "bikini_body"]
    
    let equipmentLinks = ["booty-sculpt-glutes", "tight-tummy-abs", "arm-toner-arms", "butt-core-glutes-abs", "home-cardio-full-body", "6-pack-abs-abs", "back-burner-back", "body-pump-full-body", "perfect-glutes-glutes", "beach-body-full-body", "tushy-toner-glutes", "reduce-cellulite-full-body", "booty-booster-glutes", "full-body-blast-full-body", "summer-abs-abs", "tone-shape-full-body", "lift-firm-glutes","flat-abs-abs", "bubble-butt-glutes", "better-back-back", "slim-waist-abs", "lean-legs-legs", "tank-top-arms-arms", "upper-body-sculpt-upper-body", "full-body-sweat-full-body", "hiit-workout-full-body", "leg-shaper-legs-glutes", "body-burn-full-body", "butt-thighs-glutes-legs", "chest-toner-chest", "perfect-body-full-body", "lower-body-hitt-lower-body", "summer-body-full-body", "total-strength-full-body", "hot-legs-legs", "bikini-body-full-body"]
    
    let exerciseNames = ["Booty Sculpt", "Tight Tummy", "Arm Toner", "Butt & Core", "Home Cardio", "6 Pack Abs", "Back Burner", "Body Pump", "Perfect Glutes", "Beach Body", "Tushy Toner", "Reduce Cellulite", "Booty Booster", "Full Body Blast", "Summer Abs", "Tone & Shape", "Lift & Firm", "Flat Abs", "Bubble Butt", "Better Back", "Slim Waist", "Lean Legs", "Tank Top Arms", "Body Sculpt", "Full Body Sweat", "HIIT Workout", "Leg Shaper", "Body Burn", "Butt & Thighs", "Chest Toner", "Perfect Body", "Lower Body HIIT", "Summer Body", "Total Strength", "Hot Legs", "Bikini Body"]
    
    let workoutImageNames = ["booty_sculpt_in", "tight_tummy_in", "arm_toner_in", "butt_core_in", "home_cardio_in", "six_pack_abs_in", "back_burner_in", "body_pump_in", "perfect_glutes_in", "beach_body_in", "tushy_toner_in", "reduce_cellulite_in", "booty_booster_in", "full_body_blast_in", "summer_abs_in", "tone_shape_in", "lift_firm_in", "flat_abs_in", "bubble_butt_in", "better_back_in", "slim_waist_in", "lean_legs_in", "tank_top_arms_in", "upper_body_sculpt_in", "full_body_sweat_in", "hiit_in", "leg_shaper_in", "body_burn_in", "butt_thighs_in", "chest_toner_in", "perfect_body_in", "lean_legs_in", "summer_body_in", "total_strength_in", "hot_legs_in", "bikini_body_in"]
    
    let durations = ["8 Mins", "7 Mins", "6 Mins", "6 Mins", "5 Mins", "5 Mins", "7 Mins", "6 Mins", "8 Mins", "6 Mins", "7 Mins", "7 Mins", "6 Mins", "6 Mins", "6 Mins", "6 Mins", "7 Mins", "6 Mins", "8 Mins", "6 Mins", "6 Mins", "6 Mins", "7 Mins", "5 Mins", "5 Mins", "6 Mins", "6 Mins", "10 Mins", "8 Mins", "6 Mins", "16 Mins", "6 Mins", "7 Mins", "7 Mins", "3 Mins", "6 Mins"]
    
    let videoId = ["8cLbCA-o424", "UW8mThzLYsY", "fLzzb_q8wY4", "vctkeSYoq-c", "Od3pKp73zDQ", "_EQicz7a1D8", "ZQLPZev-PV0", "ko5CB_AL3L8", "qjAnKGfJSJQ", "6E2hSkOBLyE", "CmMoFwPgRUk", "uwKUSlEbvVM", "6ozwproCDjE", "UbZhRnDEyUU", "4kdjbFmyjKE", "8cLbCA-o424", "vySzH9cdDsg", "QB2WbY4UcEw", "VXYQGFNgtfU", "0Bl0EPYrlNY", "zLaeHPtQGgw", "k-CH0U_X9sY", "MjSCyON9J88", "O0wGJnxgdm0", "UGSxQTQQqhk", "Y_5QYa4ZNQY", "E6zKZUIECOU", "8cLbCA-o424", "4xG3xPLNLyY", "Viec8vS_zVE", "8cLbCA-o424", "ixR2RUumgHU", "oAFlMq2XNUw", "DKkHw9MI9yA", "8cLbCA-o424", "118d0aUXwEs"]
    
    let difficulties = ["Intermediate", "Intermediate", "Beginner", "Beginner", "Beginner", "Advanced", "Beginner", "Intermediate", "Beginner", "Intermediate", "Advanced", "Intermediate", "Advanced", "Intermediate", "Advanced", "Intermediate", "Beginner", "Advanced", "Intermediate", "Intermediate", "Advanced", "Intermediate", "Intermediate", "Intermediate", "Advanced", "Beginner", "Intermediate", "Intermediate", "Beginner", "Intermediate", "Intermediate", "Beginner", "Intermediate", "Intermediate", "Intermediate", "Intermediate"]
    
    let descriptions = ["Target your butt from different angles to sculpt your new perfect peach.",
                        "Tighten and tone your abdominals that is quick and efficient.",
                        "Firm your biceps and triceps with innovative exercises that will sculpt your arms.",
                        "Get your rear in gear with a goal to tighten your tummy.",
                        "Burn unwanted calories to slim and trim by elevating your heart rate.",
                        "Tighten and tone your stomach while sculpting your abdominals.",
                        "Shape your back with this high intensity upper body workout.",
                        "Improve your strength and stamina with this full-body circuit.",
                        "Shape and sculpt your new and improved bubble butt with innovative exercises.",
                        "Get the beach body you always wanted before your wear your Summer swimsuit.",
                        "Tighten your buns and sculpt your curves while shaping your booty.",
                        "Eliminate unwanted cellulite by following this high intensity full-body workout.",
                        "Sculpt your assets with a goal to tone, lift and enhance your glutes.",
                        "Improve your strength and endurance with this full-body workout.",
                        "Get the abs you always wanted just in time for Summer.",
                        "Sculpt your new and improved physique with this full-body circuit.",
                        "Sculpt your body with a goal to shape and tone your tush.",
                        "Stimulate your abdominals from different angles to tighten your tummy.",
                        "Round, lift and enhance your booty with fun, creative program design.",
                        "Eliminate back fat and improve your posture while you tone and sculpt your upper body.",
                        "Reduce your waistline with high intensity interval training.",
                        "Reduce your waistline with high intensity interval training.",
                        "Tone and shape your legs without using exercise equipment.",
                        "Target your triceps to eliminate arm fat while sculpting your arms.",
                        "Shape your upper body with this creative circuit training routine.",
                        "Elevate your heart rate with an exercise routine that will make your body sweat.",
                        "Spike your heart rate with high intensity interval training.",
                        "Shape your legs that will target your inner thighs, glutes and hamstrings.",
                        "Tone and sculpt your figure with this high intensity full-body circuit.",
                        "Round your glutes and lean your legs with this lower body exercise routine.",
                        "Reduce unwanted body fat around your chest by sculpting your upper body.",
                        "Change and transform your body with this full-body circuit training routine.",
                        "Increase your heart rate to burn those extra calories during this lower body workout.",
                        "Tone your new and improved beach body to shape and sculpt your physique.",
                        "Improve your strength and endurance during this full-body workout.",
                        "Shape your legs with innovative training techniques that will sculpt your lower body.",
                        "Change and transform your physique with this beach body workout."]
    
    let trainigTypes = ["Abs & Core", "Fat Loss", "Legs & Thighs", "Butt", "Stretch", "Low Impact", "HIIT", "Back & Chest", "Full Body", "Cardio", "Arms & Shoulder"]
    let difficultyOptions = ["Beginner", "Intermediate", "Advanced"]
    let lengthOptions = ["5-7 mins", "8-15 mins", "15+ mins"]
    
    var filters: [String] = ["", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""]
    
    var selectedIndex: Int!
    let defaults = UserDefaults.standard
    
    var likedArray: [String]!
    var likedImageArray: [String]!
    var likedDifficultyArray: [String]!
    var likedDurationArray: [String]!
    var likedVideoIdArray: [String]!
    var likedExerciseImage: [String]!
    var likedDescriptionArray: [String]!
    var workoutData: [workoutInfo] = []
    var filteredData: [workoutInfo] = []
    var indexesToRemove: [Int] = []
    var currentFilter = [String]()
    
    
    
    
    var searchedExercises: [String] = []
    var exerciseSearched = false
    var searchedImageName: [String] = []
    var searchedWorkoutImageName: [String] = []
    var searchedDuration: [String] = []
    var searchedVideoId: [String] = []
    var searchedDiffucty: [String] = []
    var searchedEquipment: [String] = []
    var searchedDescription: [String] = []
    var isSearched = false
    
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
        
        likedArray = defaults.stringArray(forKey: "likedArray") ?? [String]()
        
        if UserDefaults.standard.bool(forKey: "purchased") {
            subscriptionView.isHidden = true
            if let items = tabBarController?.tabBar.items {
                items[1].isEnabled = true
                items[2].isEnabled = true
                items[3].isEnabled = true
            }
            workoutTableView.isUserInteractionEnabled = true
            searchView.isUserInteractionEnabled = true
            searchWorkoutTextField.isUserInteractionEnabled = true
            
        }else{
            
            
            subscriptionView.isHidden = false
            if let items = tabBarController?.tabBar.items {
                items[1].isEnabled = false
                items[2].isEnabled = false
                items[3].isEnabled = false
            }
            workoutTableView.isUserInteractionEnabled = false
            searchView.isUserInteractionEnabled = false
            searchWorkoutTextField.isUserInteractionEnabled = false
            
        }
        subscriptionView.isHidden = true
        
        workoutTableView.isUserInteractionEnabled = true
        searchView.isUserInteractionEnabled = true
        searchWorkoutTextField.isUserInteractionEnabled = true
        for i in 0...exerciseNames.count-1{
            if likedArray.contains(exerciseNames[i]){
                filters[i] = filters[i]+"Yes"
            }
            filters[i] = filters[i] + difficulties[i]
            if (((i > 0 && i < 17 && i != 8) || (i == 17)) || (i>18 && i<25) || (i == 31) || (i == 32) || (i == 34) || (i==25) || (i==26) || (i==29) || (i==33) || (i==35)){
                filters[i] = filters[i]+"5-7 mins"
            }else if(i == 0 || i == 18 || i == 27 || i == 28 || i == 35 || i == 8){
                filters[i] = filters[i]+"8-15 mins"
            }else{
                filters[i] = filters[i]+"15+ mins"
            }
            
            if ((i >= 0 && i < 6) || (i > 6 && i < 14) || [14, 16, 17, 18, 20, 21, 22, 23, 24, 25, 26, 28, 29, 31, 32, 33, 35].contains(i)) {
                filters[i] = filters[i] + "Abs & Core"
            }
            if [5, 7, 9, 11, 13, 23, 24, 31].contains(i) {
                filters[i] = filters[i] + "Fat Loss"
            }
            if [7, 9, 11, 13, 21, 23, 24, 25, 26, 28, 31, 32, 33, 35].contains(i) {
                filters[i] = filters[i] + "Legs & Thighs"
            }
            if [0, 3, 7, 8, 9, 11, 12, 13, 16, 18, 21, 23, 24, 25, 26, 28, 31, 32, 33, 35].contains(i) {
                filters[i] = filters[i] + "Butt"
            }
            if [0, 1, 3, 6, 8, 10, 12, 14, 16, 17, 18, 19, 20, 21, 22, 25, 26, 28, 29, 32, 33, 35].contains(i) {
                filters[i] = filters[i] + "Stretch"
            }
            if [0, 1, 2, 3, 6, 8, 10, 12, 14, 16, 17, 18, 19, 20, 21, 22, 25, 26, 28, 32, 33, 35].contains(i) {
                filters[i] = filters[i] + "Low Impact"
            }
            if [7, 9, 11, 13, 23, 24, 31].contains(i) {
                filters[i] = filters[i] + "HIIT"
            }
            
            if [6, 7, 9, 11, 13, 19, 23, 24, 25, 28, 29, 32, 33, 35].contains(i) {
                filters[i] = filters[i] + "Back & Chest"
            }
            if [1, 4, 5, 7, 9, 11, 13, 14, 17, 20, 21, 23, 24, 25, 26, 28, 29, 31, 32, 33, 35].contains(i) {
                filters[i] = filters[i] + "Full Body"
            }
            if [7, 9, 11, 13, 23, 24, 31].contains(i) {
                filters[i] = filters[i] + "Cardio"
            }
            
            workoutData.append(workoutInfo(name: exerciseNames[i], difficulty: difficulties[i], duration: durations[i], imageNames: imageNames[i], workoutImages: workoutImageNames[i], equipmentURL: equipmentLinks[i], videoId: videoId[i], description: descriptions[i], filters:filters[i]))
        }
        
        print(filters.count)
        print(exerciseNames.count)
                
        view.addGestureRecognizer(tap)
        tap.cancelsTouchesInView = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateLikedWorkout()
    }

    @IBOutlet var textView: UITextView!
    override func viewDidLayoutSubviews() {
        self.textView.setContentOffset(.zero, animated: false)
    }
    
    func updateLikedWorkout() {
        likedArray = defaults.stringArray(forKey: "likedArray") ?? [String]()
        for item in workoutData {
            let isLiked = likedArray.contains(item.name)
            let withLikeFilter = item.filters.contains("Yes")
            if isLiked && !withLikeFilter {
                item.filters += "Yes"
            } else if !isLiked && withLikeFilter {
                item.filters = item.filters.replacingOccurrences(of: "Yes", with: "")
            }
        }
        updateFilter()
        _ = textFieldShouldReturn(searchWorkoutTextField)
    }
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in transactions {
            switch transaction.transactionState {
            case .purchasing, .deferred: break
            case .purchased, .restored:
                SKPaymentQueue.default().finishTransaction(transaction)
                subscriptionView.isHidden = true
                UserDefaults.standard.set(true, forKey: "purchased")
                if let items = tabBarController?.tabBar.items {
                    items[1].isEnabled = true
                    items[2].isEnabled = true
                    items[3].isEnabled = true
                }
                workoutTableView.isUserInteractionEnabled = true
                searchView.isUserInteractionEnabled = true
                searchWorkoutTextField.isUserInteractionEnabled = true
            case .failed:
                SKPaymentQueue.default().finishTransaction(transaction)
                subscriptionView.isHidden = false
                if let items = tabBarController?.tabBar.items {
                    items[1].isEnabled = false
                    items[2].isEnabled = false
                    items[3].isEnabled = false
                }
                workoutTableView.isUserInteractionEnabled = false
                searchView.isUserInteractionEnabled = false
                searchWorkoutTextField.isUserInteractionEnabled = false
            @unknown default:
                break
            }
        }
    }
        
    @IBAction func purchaseButton(_ sender: Any) {
        if (SKPaymentQueue.canMakePayments()) {
            let productID:NSSet = NSSet(object: self.productID);
            productsRequest = SKProductsRequest(productIdentifiers: productID as! Set<String>);
            productsRequest.delegate = self;
            productsRequest.start();
            print("Fetching Products");
        }else{
            print("Can't make purchases");
        }
    }
    
    func buyProduct(product: SKProduct){
        print("Sending the Payment Request to Apple");
        let payment = SKPayment(product: product)
        SKPaymentQueue.default().add(payment);
        
    }
    @IBAction func restorePurchase(_ sender: Any) {
        
        SKPaymentQueue.default().restoreCompletedTransactions()
        
    }
    
    
    
    
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        let count : Int = response.products.count
        if (count>0) {
            let validProduct: SKProduct = response.products[0] as SKProduct
            if (validProduct.productIdentifier == self.productID) {
                print(validProduct.localizedTitle)
                print(validProduct.localizedDescription)
                print(validProduct.price)
                buyProduct(product: validProduct);
            } else {
                print(validProduct.productIdentifier)
            }
        } else {
            print("nothing")
        }
    }
    
    func request(_ request: SKRequest, didFailWithError error: Error) {
        print("Error Fetching product information");
    }
    
    @IBAction func searchSelection(_ sender: UIButton) {
        let filterTitle = sender.titleLabel!.text!
        if sender.backgroundColor == .none{
            sender.backgroundColor = .lightGray
            currentFilter.append(filterTitle)
        }else{
            sender.backgroundColor = .none
            currentFilter.removeAll{ $0 == filterTitle}
        }
        updateFilter()
    }
    
    func updateFilter() {
        filteredData = []
        let currentTraining = currentFilter.filter{[unowned self] in self.trainigTypes.contains($0)}
        let currentDifficulties = currentFilter.filter{[unowned self] in self.difficultyOptions.contains($0)}
        let currentLengths = currentFilter.filter{[unowned self] in self.lengthOptions.contains($0)}
        let isLiked = currentFilter.contains("Yes")
        for items in workoutData {
            if !currentTraining.contains(where: { !items.filters.contains($0) }) &&
                (currentDifficulties.isEmpty || currentDifficulties.contains(where: { items.filters.contains($0)})) && (currentLengths.isEmpty || currentLengths.contains(where: { items.filters.contains($0)})) && (!isLiked || items.filters.contains("Yes")) {
                filteredData.append(items)
            }
            
        }
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
        
    }
    
    @objc func myTargetFunction(textField: UITextField) {
        print("myTargetFunction")
        view.endEditing(false)
        searchView.isHidden = false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchView.isHidden = true
        self.view.endEditing(true)
        
        searchedExercises.removeAll()
        searchedImageName.removeAll()
        searchedWorkoutImageName.removeAll()
        searchedDuration.removeAll()
        searchedVideoId.removeAll()
        searchedDiffucty.removeAll()
        searchedEquipment.removeAll()
        searchedDescription.removeAll()
        
        //workoutTableView.reloadData()
        if textField.text!.isEmpty == false{
            for i in 0..<filteredData.count {
                if filteredData[i].name.lowercased().contains(String(textField.text!).lowercased()){
                    isSearched = true
                    print(filteredData[i].name)
                    
                    searchedExercises.append(filteredData[i].name)
                    searchedImageName.append(filteredData[i].imageNames)
                    searchedWorkoutImageName.append(filteredData[i].workoutImages)
                    searchedDuration.append(filteredData[i].duration)
                    searchedVideoId.append(filteredData[i].videoId)
                    searchedDiffucty.append(filteredData[i].difficulty)
                    searchedEquipment.append(filteredData[i].equipmentURL)
                    searchedDescription.append(filteredData[i].description)
                }
            }
            
            print(searchedExercises)
            workoutTableView.reloadData()
        } else {
            for i in 0..<filteredData.count {
                isSearched = true
                print(filteredData[i].name)
                
                searchedExercises.append(filteredData[i].name)
                searchedImageName.append(filteredData[i].imageNames)
                searchedWorkoutImageName.append(filteredData[i].workoutImages)
                searchedDuration.append(filteredData[i].duration)
                searchedVideoId.append(filteredData[i].videoId)
                searchedDiffucty.append(filteredData[i].difficulty)
                searchedEquipment.append(filteredData[i].equipmentURL)
                searchedDescription.append(filteredData[i].description)
            }
            workoutTableView.reloadData()
        }
        return false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "workoutSegue"{
            let vc = segue.destination as! DetailsViewController
            if filteredData.count > 0{
            }
            if isSearched{
                
                vc.titleToSet = self.searchedExercises[self.selectedIndex]
                vc.imageName = self.searchedImageName[self.selectedIndex]
                vc.duration = self.searchedDuration[self.selectedIndex]
                vc.difficulty = self.searchedDiffucty[self.selectedIndex]
                vc.exerciseName = self.searchedExercises[self.selectedIndex]
                vc.exerciseImageName = self.searchedWorkoutImageName[self.selectedIndex]
                vc.videoID = self.searchedVideoId[self.selectedIndex]
                vc.equipmentLink = self.baseURL+self.searchedEquipment[self.selectedIndex]
                vc.exerciseDescription = self.searchedDescription[self.selectedIndex]
                
            }else{
                vc.titleToSet = self.exerciseNames[self.selectedIndex]
                vc.imageName = self.imageNames[self.selectedIndex]
                vc.duration = self.durations[self.selectedIndex]
                vc.difficulty = self.difficulties[0]
                vc.exerciseName = self.exerciseNames[self.selectedIndex]
                vc.exerciseImageName = self.workoutImageNames[self.selectedIndex]
                vc.videoID = self.videoId[self.selectedIndex]
                vc.exerciseDescription = self.descriptions[self.selectedIndex]
                vc.equipmentLink = self.baseURL+self.equipmentLinks[self.selectedIndex]
            }
        }
    }
    
    //TNC
    @IBAction func privacyPolicyButtonTouched(_ sender: Any) {
        let vc = WebBrowser(nibName: "WebBrowser", bundle: .main)
        vc.fileName = "PrivacyPolicy.html"
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func termsAndConditionButtonTouched(_ sender: Any) {
        let vc = WebBrowser(nibName: "WebBrowser", bundle: .main)
        vc.fileName = "Terms & Condition.html"
        self.present(vc, animated: true, completion: nil)
    }
}

extension WorkoutViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearched{
            return searchedExercises.count
        }
        return imageNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.workoutTableView.dequeueReusableCell(withIdentifier: "workoutCell") as! WorkoutTableViewCell
        cell.selectionStyle = .none
        
        if isSearched{
            cell.exerciseNameTextView.text = self.searchedExercises[indexPath.row]
            cell.workoutImage.image = UIImage(named: searchedImageName[indexPath.row])
            cell.durationTextView.text = self.searchedDuration[indexPath.row]
            cell.difficultyTextView.text = self.searchedDiffucty[indexPath.row]
        }else{
            cell.workoutImage.image = UIImage(named: imageNames[indexPath.row])
            cell.exerciseNameTextView.text = self.exerciseNames[indexPath.row]
            cell.durationTextView.text = self.durations[indexPath.row]
            cell.difficultyTextView.text = self.difficulties[indexPath.row]
        }
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
