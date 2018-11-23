//
//  State.swift
//  Pulse_iOS
//
//  Created by Anna Harrison on 5/30/18.
//  Copyright © 2018 The Humanity Preservation Foundation. All rights reserved.
//

import Foundation
import UIKit
import SVGPath
import ObjectMapper

class State {
    private var code: String
    private var name: String
    private var stateEnum: StateEnum
    private var path: UIBezierPath
    private var layer: CAShapeLayer
    private var scale: CATransform3D
    private var position: CGPoint
    
    private var childAbuseResources = [Resource]()
    private var bullyingResources = [Resource]()
    private var domesticViolenceResources = [Resource]()
    private var allResources = [Resource]()
    
    init(sEnum: StateEnum, stateScale: CATransform3D, statePosition: CGPoint) {
        self.code = sEnum.getCode()
        self.name = sEnum.getName()
        self.stateEnum = sEnum
        self.path = UIBezierPath(svgPath: sEnum.getPath())
        self.layer = CAShapeLayer()
        self.scale = stateScale
        self.position = statePosition
        self.setLayerPath()
    }
    
    func getCode() -> String {
        return self.code;
    }
    
    func getName() -> String {
        return self.name;
    }
    
    func getEnum() -> StateEnum {
        return self.stateEnum;
    }
    
    func getPath() -> UIBezierPath {
        return self.path;
    }
    
    func getLayer() -> CAShapeLayer {
        return self.layer;
    }
    
    func setLayerPath() {
        self.layer.path = self.path.cgPath
    }
    
    func setFillColor(color: UIColor) {
        self.layer.fillColor = color.cgColor
    }
    
    func setLayerSettings(color: UIColor) {
        self.layer.strokeColor = UIColor.white.cgColor
        self.layer.lineWidth = 1.0
        self.layer.transform = self.scale
        self.layer.position = self.position
        // self.layer.frame = self.mapView.bounds
        //self.layer.bounds = (self.layer.path!.boundingBox)
        self.setFillColor(color: color)
    }
    
    /**
     * Sets the states resources based on category
     */
    
    func setResources(resourceList: [Resource]) {
        for resource in resourceList {
            self.allResources.append(resource)
            switch (resource.getCategory()) {
            case Config.categories.CHILD_ABUSE:
                self.childAbuseResources.append(resource);
                break;
            case Config.categories.BULLYING:
                self.bullyingResources.append(resource);
                break;
            default:
                self.domesticViolenceResources.append(resource);
                break;
            }
        }
    }
    
    func getChildAbuseResources() -> [Resource] {
        return self.childAbuseResources
    }
    
    func getBullyingResources() -> [Resource] {
        return self.bullyingResources
    }
    
    func getDomesticViolenceResources() -> [Resource] {
        return self.domesticViolenceResources
    }
    
    func getAllResources() -> [Resource] {
        return self.allResources
    }
}
