//
//  Elevator.swift
//  State Pattern
//
//  Created by Ramazan Karami on 5/10/21.
//

import AppKit

class Elevator {

    private var state: ElevatorStateProtocol!

    init() {
        self.setState(state: CloseState())
    }

    private func setState(state: ElevatorStateProtocol?) {
        guard let state = state else { return }
        self.state = state
    }

    func close() {
        self.setState(state: self.state?.pressCloseButton())
    }

    func open() {
        self.setState(state: self.state?.pressOpenButton())
    }

    func move() {
        self.setState(state: self.state?.pressMoveButton())
    }

    func stop() {
        self.setState(state: self.state?.pressStopButton())
    }
    
    var displayText: String {
        return state.displayText
    }
    
    var lightColor: NSColor {
        return state.lightsColor
    }
    
    var isPlayMusic: Bool {
        return state.playMusic
    }
}
