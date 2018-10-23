//
//  TimeZoneMappable.swift
//  Pulse_iOS
//
//  Created by Anna Harrison on 10/11/18.
//  Copyright © 2018 The Humanity Preservation Foundation. All rights reserved.
//

import Foundation
import ObjectMapper

class TimeZoneMappable: Mappable {
    var code: String?
    var states: [[StateMappable]]?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        code <- map["code"]
        states <- map["states"]
    }
}

class StateMappable: Mappable {
    var code: String?
    var domesticViolenceResources: [[ResourceMappable]]?
    var childAbuseResources: [[ResourceMappable]]?
    var bullyingResources: [[ResourceMappable]]?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        code <- map["code"]
        domesticViolenceResources <- map["domesticViolenceResources"]
        childAbuseResources <- map["childAbuseResources"]
        bullyingResources <- map["bullyingResources"]
    }
}

class ResourceMappable: Mappable {
    var id: Int?
    var orgName: String?
    var orgPhone: String?
    var orgUrl: String?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        orgName <- map["orgName"]
        orgPhone <- map["orgPhone"]
        orgUrl <- map["orgUrl"]
    }
}
