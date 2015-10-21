//
//  TipsCalculator.swift
//  TipAdviserUI
//
//  Created by Admin on 21.10.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

import Foundation

class TipsCalculator {
    
    var billAmmount = Float(0.0)
    var qualityCriteria: QualityCriteria
    var constraintsCriteria: ConstraintsCriteria
    var averageSatisfaction = Float(0.0)
    var percentage = 0.2
    
    
    
    
    init(var billAmmount: Float, qualityCriteria: QualityCriteria, constraintsCriteria: ConstraintsCriteria) {
        self.billAmmount = billAmmount
        self.qualityCriteria = qualityCriteria
        self.constraintsCriteria = constraintsCriteria
        self.averageSatisfaction = qualityCriteria.calculateSatisfaction()
    }
    
    func calculate() -> Int {
        var recommendedRate = constraintsCriteria.percentage * averageSatisfaction
        var calculatedAmmount = Int(recommendedRate * billAmmount)
                
        return constraintsCriteria.trimAmmountToConformCriteria(calculatedAmmount)
    }
    
}