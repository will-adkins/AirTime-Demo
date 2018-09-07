//
//  PogoCountAlg.swift
//  AirTime
//
//  Created by Lincoln Fraley on 9/6/18.
//  Copyright © 2018 Dynepic, Inc. All rights reserved.
//

import Foundation

func sumSquares(arr: [Double]) -> Double {
    var sum = 0.0
    arr.forEach { sum += pow($0, 2) }
    return sqrt(sum)
}

func pogoCountAlg(data: [[Double]], frequency: Double) -> Int {
    
    let summedSquares = data.map { sumSquares(arr: $0) }
    
    let bufferSize = Int(ceil(frequency / 5.0))
    
    var summed = [Double]()
    for i in 0..<(summedSquares.count - bufferSize) {
        var sum = 0.0
        for j in i..<(i + bufferSize) {
            sum += summedSquares[j]
        }
        summed.append(sum)
    }
    let normalized = summed.map { $0 - summed[0] }
    
    var jumps = 0
    
    var i = 0
    while (i < normalized.count) {
        
        if (normalized[i] >= 20) {
            var j = 1
            
            while (j < Int(frequency)) {
                if (normalized[j + i] <= -2) {
                    
                    jumps += 1
                    i += j
                    break
                } else {
                    j += 1
                }
            }
            if (j == Int(frequency)) {
                i += 1
            }
        } else {
            i += 1
        }
    }
    
    return jumps
}
