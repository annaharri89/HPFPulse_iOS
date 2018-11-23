//
//  Resource.swift
//  Pulse_iOS
//
//  Created by Anna Harrison on 5/30/18.
//  Copyright © 2018 The Humanity Preservation Foundation. All rights reserved.
//

import Foundation

class Resource {
    private var id: Int
    private var orgName: String
    private var url: String
    private var phoneNumber: String
    private var category: String
    private var stateName: String
    private var stateEnum: StateEnum
    
    
    init(resourceCategory: String, resourceId: Int, resourceOrgName: String, resourcePhone: String, resourceStateEnum: StateEnum, resourceUrl: String) {
        self.category = resourceCategory
        self.id = resourceId
        self.orgName = resourceOrgName
        self.phoneNumber = resourcePhone
        self.stateEnum = resourceStateEnum
        self.stateName = resourceStateEnum.getName()
        self.url = resourceUrl
    }
    
    
    func getCategory() -> String {
        return self.category
    }
    
    func getId() -> CLong { //todo check this is the right type; in android it returned a 'long'
        return self.id
    }
    
    func getName() -> String {
        return self.orgName
    }
    
    func getPhoneNumber() -> String {
        return self.phoneNumber
    }
    
    func getStateEnum() -> StateEnum {
        return self.stateEnum
    }
    
    
    func getStateName() -> String {
        return self.stateName
    }
    
    func getUrl() -> String {
        return self.url
    }

}
