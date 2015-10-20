//
//  ViewController.swift
//  TipAdviserUI
//
//  Created by Admin on 15.10.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var calculateButton: UIButton!
    
    @IBOutlet weak var tipsAmmountLabel: UILabel!
    
    @IBOutlet weak var waitingTimeSlider: UISlider!
    
    @IBOutlet weak var serviceQualitySlider: UISlider!
    
   
    @IBOutlet weak var picker: UIPickerView!
    
    @IBOutlet weak var billAmmountTextField: UITextField!
    
    var pickerData: [String] = [String]()
    
    @IBAction func calculateTips(sender: AnyObject) {
        
        
        var waitingTimeValue: Float
        var serviceQualityValue: Float
        var foodQualityValue: Float
        var billAmmount: Float
        var recommendedTips: Int
        
        waitingTimeValue = waitingTimeSlider.value
        serviceQualityValue = serviceQualitySlider.value
        foodQualityValue = foodQualitySlider.value
        
        
        billAmmount = (billAmmountTextField.text as NSString).floatValue
        
        recommendedTips = calculateTips(billAmmount, waitingTime: waitingTimeValue, serviceQuality: serviceQualityValue, foodQuality: foodQualityValue)
        
        tipsAmmountLabel.text = recommendedTips.description
    }
    
    func calculateTips(billAmmount: Float, waitingTime: Float, serviceQuality: Float, foodQuality: Float) -> Int  {
        if billAmmount < 5 {
            return 0
        }
        
        var averageSatisfaction: Float
        var percentage: Float
        
        var upperBound = 25
        var downBound = 1
        
        percentage = 0.2
        averageSatisfaction = (waitingTime + serviceQuality + foodQuality) / 3
        
        var recommendedRate = percentage * averageSatisfaction
        var calculatedAmmount = recommendedRate * billAmmount
        var intCalculatedAmmount = Int(calculatedAmmount)
        
        if intCalculatedAmmount > upperBound {
            return upperBound
        }
            
        if intCalculatedAmmount < downBound {
            return downBound
        }
        
       return Int(calculatedAmmount)
        
    
    }
    
    @IBOutlet weak var foodQualitySlider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.picker.delegate = self
        self.picker.dataSource = self
        pickerData = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5", "Item 6"]

        // Do any additional setup after loading the view, typically from a nib.
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
        return pickerData.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }

}

