//
//  State.swift
//  State Pattern
//
//  Created by Ramazan Karami on 5/10/21.
//

import AppKit

protocol ElevatorStateProtocol {

    var displayText: String { get }
    var playMusic: Bool { get }
    var lightsColor: NSColor { get }

    func pressCloseButton() -> ElevatorStateProtocol?
    func pressOpenButton() -> ElevatorStateProtocol?
    func pressMoveButton() -> ElevatorStateProtocol?
    func pressStopButton() -> ElevatorStateProtocol?
}

