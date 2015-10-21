//
//  Criteria.swift
//  TipAdviserUI
//
//  Created by Admin on 21.10.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

import Foundation

class QualityCriteria {
    var waitingTime = Float(0.0)
    var serviceQuality = Float(0.0)
    var foodQuality = Float(0.0)
    
    init(waitingTime: Float, serviceQuality: Float, foodQuality: Float)
    {
        self.waitingTime = waitingTime
        self.serviceQuality = serviceQuality
        self.foodQuality = foodQuality
    }
    
    func calculateSatisfaction() -> Float{
        return (waitingTime + serviceQuality + foodQuality) / 3
    }
}

class ConstraintsCriteria {
    var percentage: Float
    var upperBound: Int
    var downBound : Int
    
    init(percentage: Float, upperBound: Int, downBound:Int) {
        self.percentage = percentage
        self.downBound = downBound
        self.upperBound = upperBound
    }
    
    func trimAmmountToConformCriteria(ammount: Int) -> Int {
        
        
        if ammount > upperBound {
            return upperBound
        }
        
        if ammount < downBound {
            return downBound
        }
        
        return ammount

    }
    
}