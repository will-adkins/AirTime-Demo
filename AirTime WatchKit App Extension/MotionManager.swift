/*
 Copyright (C) 2016 Apple Inc. All Rights Reserved.
 See LICENSE.txt for this sample’s licensing information
 
 Abstract:
 This class manages the CoreMotion interactions and 
         provides a delegate to indicate changes in data.
 */

import Foundation
import CoreMotion
import WatchKit

/**
 `MotionManagerDelegate` exists to inform delegates of motion changes.
 These contexts can be used to enable application specific behavior.
 */
protocol MotionManagerDelegate: class {
    func didUpdateForehandSwingCount(_ manager: MotionManager, forehandCount: Int)
    func didUpdateBackhandSwingCount(_ manager: MotionManager, backhandCount: Int)
    func didUpdateJumpCount(_ manager: MotionManager, jumpCount: Int)
}

class MotionManager {
    // MARK: Properties
    
    let motionManager = CMMotionManager()
    let queue = OperationQueue()
    
    let frequency = 60.0
    let sampleInterval = 1.0 / 60.0
    let bufferSize = 12
    
    
    weak var delegate: MotionManagerDelegate?

    /// Swing counts.
    var jumpCount = 0
    var possibleJumpCounter = 0
    var buffer = [Double]()
    var initialSum: Double?
    var currentNormalized: Double?
    let jumpCounter = JumpCounter()
    
    
    var recentDetection = false

    // MARK: Initialization
    
    init() {
        // Serial queue for sample handling and calculations.
        queue.maxConcurrentOperationCount = 1
        queue.name = "MotionManagerQueue"
        jumpCounter.incrementJump = updateJumpCountDelegate
        
    }

    // MARK: Motion Manager

    func startUpdates() {
        if !motionManager.isDeviceMotionAvailable {
            print("Device Motion is not available.")
            return
        }

        // Reset everything when we start.
        resetAllState()

        motionManager.deviceMotionUpdateInterval = sampleInterval
        motionManager.startDeviceMotionUpdates(to: queue) { (deviceMotion: CMDeviceMotion?, error: Error?) in
            if error != nil {
                print("Encountered error: \(error!)")
            }

            if deviceMotion != nil {
                self.processDeviceMotion(deviceMotion!)
            }
        }
    }

    func stopUpdates() {
        if motionManager.isDeviceMotionAvailable {
            motionManager.stopDeviceMotionUpdates()
        }
    }

    // MARK: Motion Processing
    
    func processDeviceMotion(_ deviceMotion: CMDeviceMotion) {
        let gravity = deviceMotion.gravity
        
        
        jumpCounter.input(x: gravity.x, y: gravity.y, z: gravity.z)
    }

    // MARK: Data and Delegate Management
    
    func resetAllState() {
        

        jumpCount = 0
        currentNormalized = nil
        buffer = [Double]()
        possibleJumpCounter = 0
        recentDetection = false

        
    }

    func incrementJumpCountAndUpdateDelegate() {
        if (!recentDetection) {
        }
    }

    func updateJumpCountDelegate(jump: Int) {
        delegate?.didUpdateJumpCount(self, jumpCount: jumpCount)
    }
}
