//
//  Type.swift
//  Construction Chayos
//
//  Created by Rebecca Stewart on 2019-07-01.
//  Copyright © 2019 Rebecca Stewart. All rights reserved.
//

import Foundation

struct PhysicsCategory {
    static let None:     UInt32 = 0 << 0
    static let Player:   UInt32 = 1 << 1
    static let Brick:    UInt32 = 1 << 2
    static let TrafficCone: UInt32 = 1 << 3
    static let Board:    UInt32 = 1 << 4
    
}

enum GameState: Int {
    case initial=0, start, play, pause, quit
}

