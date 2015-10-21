//
//  Restaurant.swift
//  TipAdviserUI
//
//  Created by Admin on 21.10.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

import Foundation


class Restaurant
{
    let name: String
    let address: String
    
    var rates: [Float]
    var rating: Float
    var averageTips: Int
    var tips: [Int]
    
    func updateRating(newRating: Float)
    {
        self.rates.append(newRating)
        var sum = self.rates.reduce(0, combine: +)
        self.rating =  Float(sum) / Float(self.rates.count)
    }
    
    func updateTips(newTips: Int)
    {
        self.tips.append(newTips)
        var sum = self.tips.reduce(0, combine: +)
        self.averageTips =  sum / self.tips.count
    }
    
    
    
    init(name: String, address: String)
    {
        self.name = name
        self.address = address
        self.rating = 0
        self.rates = [Float]()
        self.tips = [Int]()
        self.averageTips = 0
    }
    
    convenience init()
    {
        self.init(name: "", address: "")
    }
}