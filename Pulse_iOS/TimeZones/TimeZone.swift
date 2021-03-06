//
//  TimeZone.swift
//  Pulse_iOS
//
//  Created by Anna Harrison on 5/30/18.
//  Copyright © 2018 The Humanity Preservation Foundation. All rights reserved.
//

import Foundation
import UIKit

class TimeZone {
    
    private var states = [State]()
    private var name: String
    private var description: String
    private var code: String
    private var timeZoneEnum: TimeZoneEnum
    private var color: UIColor!
    private var colorCode: String
    private var scale: CATransform3D
    private var position: CGPoint
    
    private var labelBezierPathArray = [UIBezierPath]()
    private var labelShapeLayersArray = [CAShapeLayer]()//todo create function that sets this and call it in the init
    //todo create getter function for this array
    
    
    //todo implement var static final String COLOR_PREFIX = "map_";
    
    init(tzColorCode: String, tzEnum: TimeZoneEnum, tzStateEnums: [StateEnum], tzScale: CATransform3D, tzPosition: CGPoint) {
        self.scale = tzScale //todo create setScale function in Utils, call here; switch on the size of the mapView bounds or width or height
        self.position = tzPosition // todo create setPosition function in Utils, call here
        
        for stateEnum in tzStateEnums {
            let state = State(sEnum: stateEnum, stateScale: self.scale, statePosition: self.position)
            states.append(state)
        }
        self.timeZoneEnum = tzEnum
        self.code = tzEnum.getCode()
        self.name = tzEnum.getName()
        self.description = tzEnum.getDescription()
        
        
        self.colorCode = tzColorCode;
        self.color = self.getClrResource(qualifier: self.colorCode)
        
        if (!(self.timeZoneEnum == TimeZoneEnum.ALL)) { // needed because the ALL timezone shouldn't be seen
            self.setStateLayerSettings(color: self.color)
            self.setLabelLayerSettings()
        }
    }
    
    func getStates() -> [State] {
        return self.states
    }
    
    func getState(stateCode: String) -> State? {
        for state in self.getStates() {
            if (state.getCode() == stateCode) {
                return state
            }
        }
        return nil
    }
    /**
     * Sets each of the time zone's state's resources. Uses a StateEnum to find the right state.
     * @param resourceMap
     */
    
    func setResources(resourceDict: [StateEnum : [Resource]]) {
        for state in self.getStates() {
            for (key, value) in resourceDict {
                if (state.getEnum() == key) {
                    state.setResources(resourceList: value)
                }
            }
        }
    }
    
    func getStateChildAbuseResources(stateCode: String) -> [Resource] {
        let state = self.getState(stateCode: stateCode)
        return (state?.getChildAbuseResources())!
    }
    
    func getStateBullyingResources(stateCode: String) -> [Resource] {
        let state = self.getState(stateCode: stateCode)
        return (state?.getBullyingResources())!
    }
    
    func getStateDomesticViolenceResources(stateCode: String) -> [Resource] {
        let state = self.getState(stateCode: stateCode)
        return (state?.getDomesticViolenceResources())!
    }
    
    func getAllStateResources(stateCode: String) -> [Resource] {
        let state = self.getState(stateCode: stateCode)
        return (state?.getAllResources())!
    }
 
    func getDescription() -> String {
        return self.description
    }
    
    func getCode() -> String {
        return self.code
    }
    
    func getEnum() -> TimeZoneEnum {
        return self.timeZoneEnum
    }
    
    func getColorCode() -> String {
        return self.colorCode
    }
    
    func getName() -> String {
        return self.name
    }
    
    func getLabelShapeLayerArray() -> [CAShapeLayer] {
        return self.labelShapeLayersArray
    }
    
    /**
     * Used to change the time zone's fill color. Called when highlighting or unhighlighting the
     * time zone
     */
    func changeFillColor(qualifier: String) {
        self.color = self.getClrResource(qualifier: qualifier)
        self.setFillColor()
    }
    
    /**
     * Used to get time zone's fill color
     * @param qualifier
     * @return
     */
    func getClrResource(qualifier: String) -> UIColor {
    
    
        //todo implement folowwing using the stack overflow post about custome color class
    
        return UIColor.getMapColor(qualifier: qualifier)
    }
    
    /**
     * Sets the fill color of each state in the time zone
     */
    func setFillColor() {
        for state in self.states {
            state.setFillColor(color: self.color)
        }
    }
    
    func setStateLayerSettings(color: UIColor) {
        for state in self.states {
            state.setLayerSettings(color: self.color)
        }
    }
    
    func setLabelLayerSettings() {
        setLabelBezierPathArray()
        for path in self.labelBezierPathArray {
            let shapeLayer = CAShapeLayer()
            shapeLayer.path = path.cgPath
            shapeLayer.lineWidth = 2.0
            shapeLayer.strokeColor = UIColor.black.cgColor
            shapeLayer.fillColor = UIColor.lightGray.cgColor
            shapeLayer.position = self.position
            shapeLayer.transform = self.scale
            self.labelShapeLayersArray.append(shapeLayer)
        }
    }
    
    func setLabelBezierPathArray() {
        for string in self.timeZoneEnum.getLabelPathData() {
            let bezierPath = UIBezierPath(svgPath: string)
            self.labelBezierPathArray.append(bezierPath)
        }
    }
}
