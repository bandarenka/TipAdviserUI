//
//  ViewController.swift
//  TipAdviserUI
//
//  Created by Admin on 15.10.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    @IBOutlet weak var billAmmountTextField: UITextField!
    @IBOutlet weak var calculateButton: UIButton!
    
    @IBOutlet weak var averageTipsLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var tipsAmmountLabel: UILabel!
    
    @IBOutlet weak var waitingTimeSlider: UISlider!
    @IBOutlet weak var serviceQualitySlider: UISlider!
    @IBOutlet weak var picker: UIPickerView!
    
    
    @IBAction func calculateTips(sender: AnyObject) {
        
        var billAmmount = (billAmmountTextField.text as NSString).floatValue
        
        var constraintsCriteria = ConstraintsCriteria(percentage: 0.2, upperBound: 25, downBound: 1)
        var qualityCriteria = QualityCriteria(waitingTime: waitingTimeSlider.value, serviceQuality: serviceQualitySlider.value, foodQuality: foodQualitySlider.value)
        
        var calculator = TipsCalculator(billAmmount: billAmmount, qualityCriteria: qualityCriteria, constraintsCriteria: constraintsCriteria)
        
        var recommendedTips = calculator.calculate()
        
        appDelegate.updateCurrentRestaraunt(calculator.averageSatisfaction, newTips: recommendedTips)
        updateCalculatedLabels(recommendedTips)
    }
    
    func updateCalculatedLabels(recommendedTips: Int) {
        
        tipsAmmountLabel.text = recommendedTips.description
        updateStatisticLabels()
    }
    
    
    func updateStatisticLabels() {
        
        ratingLabel.text = appDelegate.currentRestaurant.rating.description
        averageTipsLabel.text = appDelegate.currentRestaurant.averageTips.description
    }

    
    @IBOutlet weak var foodQualitySlider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.initRestaurantsPickerData()
        
        self.picker.delegate = self
        self.picker.dataSource = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // The number of columns of data
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return appDelegate.restaurantsCount()
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        appDelegate.setCurrentRestaraunt(row)
        return appDelegate.currentRestaurant.name
        
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        appDelegate.setCurrentRestaraunt(row)
        updateStatisticLabels()
        
    }

}

