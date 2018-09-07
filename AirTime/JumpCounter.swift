//
//  JumpCounter.swift
//  SwingWatch WatchKit Extension
//
//  Created by Lincoln Fraley on 9/7/18.
//  Copyright © 2018 Apple Inc. All rights reserved.
//

import Foundation

class JumpCounter {
    
    let frequency = 60
    let bufferSize = 12
    var buffer = [Double]()
    var initialSum: Double?
    var currentPeak: Double?
    var jumpTestCounter = 0
    var incrementJump: ((_ jump: Int) -> Void)?
    var jumps = 0
    
    func input(x: Double, y: Double, z: Double) {
        //  Get sum of squares of components
        let sumOfSquares = sumSquares(arr: [x, y, z])
        
        //  If there is a current peak, continue adding to buffer to get next normalized data point
        if currentPeak != nil {
            
            testForJump(sumOfSquares: sumOfSquares)
          
        //  Else, continue to add to buffer to get next peak
        } else {
            
            buffer.append(sumOfSquares)
            
            //  If buffer has reached buffer size, get sum of buffer
            if buffer.count == bufferSize {
                let sum = buffer.reduce(0, { $0 + $1 })
                
                //  If there is already an initialSum, subtract it from the sum to get the normalized data
                if let initialSum = initialSum {
                    let normalized = sum - initialSum
                    
                    //  If normalized is greater than 20, set it as the currentPeak
                    if normalized >= 20 {
                        currentPeak = normalized
                    }
                } else {
                    initialSum = sum
                }
                
                buffer.removeAll()
            }
        }
    }
    
    func testForJump(sumOfSquares: Double) {
        
        //  If buffer has reached buffer size, get sum
        if buffer.count == bufferSize {
            let sum = buffer.reduce(0, { $0 + $1 })
            let normalized = sum - initialSum!
            
            //  Jump found
            if normalized <= -2 {
                jumps += 1
                incrementJump?(jumps)
                
                currentPeak = nil
            } else {
                
                jumpTestCounter += 1
                
                if (jumpTestCounter >= frequency) {
                    
                    currentPeak = nil
                    jumpTestCounter = 0
                }
            }
            
            buffer.removeAll()
        } else {
            buffer.append(sumOfSquares)
        }
    }
    
}
