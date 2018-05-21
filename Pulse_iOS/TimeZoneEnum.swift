//
//  TimeZoneEnum.swift
//  Pulse_iOS
//
//  Created by Anna Harrison on 5/21/18.
//  Copyright © 2018 The Humanity Preservation Foundation. All rights reserved.
//

import Foundation

enum TimeZoneEnum {
    case ALL, PST, MT, WNC, WSC, ENC, ESC, MA, SA, NE
    
    func getCode() -> String {
        switch self {
            case .ALL: return "ALL"
            case .PST: return "PST"
            case .MT: return "MT"
            case .WNC: return "WNC"
            case .WSC: return "WSC"
            case .ENC: return "ENC"
            case .ESC: return "ESC"
            case .MA: return "MA"
            case .SA: return "SA"
            case .NE: return "NE"
        }
    }
    
    func getName() -> String {
        switch self {
            case .ALL: return "All Regions"
            case .PST: return "Pacific"
            case .MT: return "Mountain"
            case .WNC: return "West North Central"
            case .WSC: return "West South Central"
            case .ENC: return "East North Central"
            case .ESC: return "East South Central"
            case .MA: return "Mid Atlantic"
            case .SA: return "South Atlantic"
            case .NE: return "New England"
        }
    }
    
}
