//
//  StateEnum.swift
//  Pulse_iOS
//
//  Created by Anna Harrison on 5/21/18.
//  Copyright © 2018 The Humanity Preservation Foundation. All rights reserved.
//

import Foundation

enum StateEnum {
    //PST States
    case ALASKA, CALIFORNIA, HAWAII, OREGON, WASHINGTON
    
    //MT States
    case ARIZONA, COLORADO, IDAHO, MONTANA, NEVADA, NEW_MEXICO, UTAH, WYOMING
    
    //WNC States
    case IOWA, KANSAS, MINNESOTA, MISSOURI, NEBRASKA, NORTH_DAKOTA, SOUTH_DAKOTA
    
    //WSC States
    case ARKANSAS, LOUISIANA, OKLAHOMA, TEXAS
    
    //ENC States
    case ILLINOIS, INDIANA, MICHIGAN, OHIO, WISCONSIN
    
    //ESC States
    case ALABAMA, KENTUCKY, MISSISSIPPI, TENNESSEE
    
    //MA States
    case NEW_JERSEY, NEW_YORK, PENNSYLVANIA
    
    //SA States
    case DELAWARE, FLORIDA, GEORGIA, MARYLAND, NORTH_CAROLINA, SOUTH_CAROLINA, VIRGINIA, WEST_VIRGINIA
    
    //NE States
    case CONNECTICUT, MAINE, MASSACHUSETTS, NEW_HAMPSHIRE, RHODE_ISLAND, VERMONT
    
    func getCode() -> String {
        switch self {
            case .ALASKA: return "AK"
            case .CALIFORNIA: return "CA"
            case .HAWAII: return "HI"
            case .OREGON: return "OR"
            case .WASHINGTON: return "WA"
            case .ARIZONA: return "AZ"
            case .COLORADO: return "CO"
            case .IDAHO: return "ID"
            case .MONTANA: return "MT"
            case .NEVADA: return "NV"
            case .NEW_MEXICO: return "NM"
            case .UTAH: return "UT"
            case .WYOMING: return "WY"
            case .IOWA: return "IA"
            case .KANSAS: return "KS"
            case .MINNESOTA: return "MN"
            case .MISSOURI: return "MO"
            case .NEBRASKA: return "NE"
            case .NORTH_DAKOTA: return "ND"
            case .SOUTH_DAKOTA: return "SD"
            case .ARKANSAS: return "AR"
            case .LOUISIANA: return "LA"
            case .OKLAHOMA: return "OK"
            case .TEXAS: return "TX"
            case .ILLINOIS: return "IL"
            case .INDIANA: return "IN"
            case .MICHIGAN: return "MI"
            case .OHIO: return "OH"
            case .WISCONSIN: return "WI"
            case .ALABAMA: return "AL"
            case .KENTUCKY: return "KY"
            case .MISSISSIPPI: return "MS"
            case .TENNESSEE: return "TN"
            case .NEW_JERSEY: return "NJ"
            case .NEW_YORK: return "NY"
            case .PENNSYLVANIA: return "PA"
            case .DELAWARE: return "DE"
            case .FLORIDA: return "FL"
            case .GEORGIA: return "GA"
            case .MARYLAND: return "MD"
            case .NORTH_CAROLINA: return "NC"
            case .SOUTH_CAROLINA: return "SC"
            case .VIRGINIA: return "VA"
            case .WEST_VIRGINIA: return "WV"
            case .CONNECTICUT: return "CT"
            case .MAINE: return "ME"
            case .MASSACHUSETTS: return "MA"
            case .NEW_HAMPSHIRE: return "NH"
            case .RHODE_ISLAND: return "RI"
            case .VERMONT: return "VT"
        }
    }
        
    func getName() -> String {
        switch self {
            case .ALASKA: return "Alaska"
            case .CALIFORNIA: return "California"
            case .HAWAII: return "Hawaii"
            case .OREGON: return "Oregon"
            case .WASHINGTON: return "Washington"
            case .ARIZONA: return "Arizona"
            case .COLORADO: return "Colorado"
            case .IDAHO: return "Idaho"
            case .MONTANA: return "Montana"
            case .NEVADA: return "Nevada"
            case .NEW_MEXICO: return "New Mexico"
            case .UTAH: return "Utah"
            case .WYOMING: return "Wyoming"
            case .IOWA: return "Iowa"
            case .KANSAS: return "Kansas"
            case .MINNESOTA: return "Minnesota"
            case .MISSOURI: return "Missouri"
            case .NEBRASKA: return "Nebraska"
            case .NORTH_DAKOTA: return "North Dakota"
            case .SOUTH_DAKOTA: return "South Dakota"
            case .ARKANSAS: return "Arkansas"
            case .LOUISIANA: return "Louisiana"
            case .OKLAHOMA: return "Oklahoma"
            case .TEXAS: return "Texas"
            case .ILLINOIS: return "Illinois"
            case .INDIANA: return "Indiana"
            case .MICHIGAN: return "Michigan"
            case .OHIO: return "Ohio"
            case .WISCONSIN: return "Wisconsin"
            case .ALABAMA: return "Alabama"
            case .KENTUCKY: return "Kentucky"
            case .MISSISSIPPI: return "Mississippi"
            case .TENNESSEE: return "Tennessee"
            case .NEW_JERSEY: return "New Jersey"
            case .NEW_YORK: return "New York"
            case .PENNSYLVANIA: return "Pennsylvania"
            case .DELAWARE: return "Delaware"
            case .FLORIDA: return "Florida"
            case .GEORGIA: return "Georgia"
            case .MARYLAND: return "Maryland"
            case .NORTH_CAROLINA: return "North Carolina"
            case .SOUTH_CAROLINA: return "South Carolina"
            case .VIRGINIA: return "Virginia"
            case .WEST_VIRGINIA: return "West Virginia"
            case .CONNECTICUT: return "Connecticut"
            case .MAINE: return "Maine"
            case .MASSACHUSETTS: return "Massachusetts"
            case .NEW_HAMPSHIRE: return "New Hampshire"
            case .RHODE_ISLAND: return "Rhode Island"
            case .VERMONT: return "Vermont"
            }
        }
    
    func getTimeZoneStateCodes(timeZoneEnum:TimeZoneEnum) -> Array<StateEnum> {
        let ALLStates: [StateEnum] = [
            .ALABAMA,
            .ALASKA,
            .ARIZONA,
            .ARKANSAS,
            .CALIFORNIA,
            .COLORADO,
            .CONNECTICUT,
            .DELAWARE,
            .FLORIDA,
            .GEORGIA,
            .HAWAII,
            .IDAHO,
            .ILLINOIS,
            .INDIANA,
            .IOWA,
            .KANSAS,
            .KENTUCKY,
            .LOUISIANA,
            .MAINE,
            .MARYLAND,
            .MASSACHUSETTS,
            .MICHIGAN,
            .MINNESOTA,
            .MISSISSIPPI,
            .MISSOURI,
            .MONTANA,
            .NEBRASKA,
            .NEVADA,
            .NEW_HAMPSHIRE,
            .NEW_JERSEY,
            .NEW_MEXICO,
            .NEW_YORK,
            .NORTH_CAROLINA,
            .NORTH_DAKOTA,
            .OHIO,
            .OKLAHOMA,
            .OREGON,
            .PENNSYLVANIA,
            .RHODE_ISLAND,
            .SOUTH_CAROLINA,
            .SOUTH_DAKOTA,
            .TENNESSEE,
            .TEXAS,
            .UTAH,
            .VERMONT,
            .VIRGINIA,
            .WASHINGTON,
            .WEST_VIRGINIA,
            .WISCONSIN,
            .WYOMING
        ]
        
        let PSTStates: [StateEnum] = [
            .ALASKA,
            .CALIFORNIA,
            .HAWAII,
            .OREGON,
            .WASHINGTON
        ]
        
        let MTStates: [StateEnum] = [
            .ARIZONA,
            .COLORADO,
            .IDAHO,
            .MONTANA,
            .NEVADA,
            .NEW_MEXICO,
            .UTAH,
            .WYOMING
        ]
        
        let WNCStates: [StateEnum] = [
            .IOWA,
            .KANSAS,
            .MINNESOTA,
            .MISSOURI,
            .NEBRASKA,
            .NORTH_DAKOTA,
            .SOUTH_DAKOTA
        ]
        
        let WSCStates: [StateEnum] = [
            .ARKANSAS,
            .LOUISIANA,
            .OKLAHOMA,
            .TEXAS
        ]
        
        let ENCStates: [StateEnum] = [
            .ILLINOIS,
            .INDIANA,
            .MICHIGAN,
            .OHIO,
            .WISCONSIN
        ]
        
        let ESCStates: [StateEnum] = [
            .ALABAMA,
            .KENTUCKY,
            .MISSISSIPPI,
            .TENNESSEE
        ]
        
        let MAStates: [StateEnum] = [
            .NEW_JERSEY,
            .NEW_YORK,
            .PENNSYLVANIA
        ]
        
        let SAStates: [StateEnum] = [
            .DELAWARE,
            .FLORIDA,
            .GEORGIA,
            .MARYLAND,
            .NORTH_CAROLINA,
            .SOUTH_CAROLINA,
            .VIRGINIA,
            .WEST_VIRGINIA
        ]
        
        let NEStates: [StateEnum] = [
            .CONNECTICUT,
            .MAINE,
            .MASSACHUSETTS,
            .NEW_HAMPSHIRE,
            .RHODE_ISLAND,
            .VERMONT
        ]
        
        switch (timeZoneEnum) {
            case .ALL: return ALLStates;
            case .PST: return PSTStates;
            case .MT: return MTStates;
            case .WNC: return WNCStates;
            case .WSC: return WSCStates;
            case .ENC: return ENCStates;
            case .ESC: return ESCStates;
            case .MA: return MAStates;
            case .SA: return SAStates;
            case .NE: return NEStates;
        }

    }
}
