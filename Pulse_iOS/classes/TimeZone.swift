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
    
    var states = [State]()
    var name: String
    var description: String
    var code: String
    var timeZoneEnum: TimeZoneEnum
    var color: UIColor!
    var colorCode: String
    var scale: CATransform3D
    var position: CGPoint
    
    var labelBezierPathArray = [UIBezierPath]()
    var labelShapeLayersArray = [CAShapeLayer]()//todo create function that sets this and call it in the init
    //todo create getter function for this array
    
    
    //todo implement var static final String COLOR_PREFIX = "map_";
    
    init(colorCode: String, timeZoneEnum: TimeZoneEnum, timeZoneStates: [StateEnum], scale: CATransform3D, position: CGPoint) {
        self.scale = scale //todo create setScale function in Utils, call here; switch on the size of the mapView bounds or width or height
        print("Scale:")
        print(scale)
        self.position = position // todo create setPosition function in Utils, call here
        
        for stateEnum in timeZoneStates {
            let state = State(sEnum: stateEnum, scale: self.scale, position: self.position)
            states.append(state)
        }
        self.timeZoneEnum = timeZoneEnum
        self.code = timeZoneEnum.getCode()
        self.name = timeZoneEnum.getName()
        self.description = timeZoneEnum.getDescription()
        
        
        self.colorCode = colorCode;
        self.color = self.getClrResource(qualifier: self.colorCode)
        //self.color = UIColor.blue
        
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
    /*
    public void setResources(Map<StateEnum, List<Resource>> resourceMap) {
    for (State state : this.getStates()) {
    for (Map.Entry<StateEnum, List<Resource>> entry : resourceMap.entrySet())
    if (entry.getKey().equals(state.getEnum())) {
    state.setResources(entry.getValue());
    }
    }
    }
    
    public List<Resource> getStateChildAbuseResources(String stateCode) {
    State state = this.getState(stateCode);
    return state.getChildAbuseResources();
    }
    
    public List<Resource> getStateBullyingResources(String stateCode) {
    State state = this.getState(stateCode);
    return state.getBullyingResources();
    }
    
    public List<Resource> getStateDomesticViolenceResources(String stateCode) {
    State state = this.getState(stateCode);
    return state.getDomesticViolenceResources();
    }
    
    public List<Resource> getAllStateResources(String stateCode) {
    State state = this.getState(stateCode);
    return state.getAllResources();
    }
 */
    
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
