//
//  Config.swift
//  Pulse_iOS
//
//  Created by Anna Harrison on 6/14/18.
//  Copyright © 2018 The Humanity Preservation Foundation. All rights reserved.
//

import Foundation

public class Config {
    final class categories {
        static let ALL_RESOURCES = "All Resources";
        static let CHILD_ABUSE = "Child Abuse";
        static let BULLYING = "Bullying";
        static let DOMESTIC_VIOLENCE = "Domestic Violence";
    }
    
    final class intents {
        static let ACTIVITY_EXTRA = "ActivityTitle";
        static let TIMEZONE_EXTRA = "TimeZone";
    }
    
    final class data {
        static let URL = "http://dev.humanitypreservationfoundation.org/wp-json/pulse/v1/states";
    }
}
