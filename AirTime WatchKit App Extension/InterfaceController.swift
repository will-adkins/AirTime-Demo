//
//  InterfaceController.swift
//  AirTime WatchKit App Extension
//
//  Created by Lincoln Fraley on 9/7/18.
//  Copyright © 2018 Dynepic, Inc. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController, WorkoutManagerDelegate {

    @IBOutlet var titleLabel: WKInterfaceLabel!
    @IBOutlet var jumpCountLabel: WKInterfaceLabel!
    
    let workoutManager = WorkoutManager()
    var active = false
    var jumps = 0
    
   
    override init() {
        super.init()
        workoutManager.delegate = self
    }
    
    // MARK: WKInterfaceController
    
    override func willActivate() {
        super.willActivate()
        active = true
        
        // On re-activation, update with the cached values.
        updateLabels()
    }
    
    override func didDeactivate() {
        super.didDeactivate()
        active = false
    }

    @IBAction func start() {
        titleLabel.setText("Workout started")
        workoutManager.startWorkout()
    }
    
    @IBAction func stop() {
        titleLabel.setText("Workout stopped")
        workoutManager.stopWorkout()
    }
    
    // MARK: WorkoutManagerDelegate
    
    func didUpdateForehandSwingCount(_ manager: WorkoutManager, forehandCount: Int) {
        /// Serialize the property access and UI updates on the main queue.
        DispatchQueue.main.async {
            //            self.forehandCount = forehandCount
            self.updateLabels()
        }
    }
    
    func didUpdateBackhandSwingCount(_ manager: WorkoutManager, backhandCount: Int) {
        /// Serialize the property access and UI updates on the main queue.
        DispatchQueue.main.async {
            //            self.backhandCount = backhandCount
            self.updateLabels()
        }
    }
    
    func didUpdateJumpCount(_ manager: WorkoutManager, jumpCount: Int) {
        DispatchQueue.main.async {
            self.jumpCountLabel.setText("\(jumpCount)")
        }
    }
    
    // MARK: Convenience
    
    func updateLabels() {
        if active {
            //            jumpCountLabel.setText("\(backhandCount)")
        }
    }
}
