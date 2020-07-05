//
//  Game.swift
//  TicTacToe
//
//  Created by Marmik Shah on 23/8/2019.
//  Copyright © 2019 Marmik Shah. All rights reserved.
//

import Foundation

enum GameType {
    case PvC
    case PvP
    case PvPNetwork
}

class Game {
    var gameType : GameType?
    
    init(gameType : GameType) {
        self.gameType = gameType;
        
    }
}
