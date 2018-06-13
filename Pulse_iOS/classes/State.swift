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

class State {
    var code: String
    var name: String
    var stateEnum: StateEnum
    var path: UIBezierPath
    var layer: CAShapeLayer
    var scale: CATransform3D
    var position: CGPoint
    
    var childAbuseResources = [Resource]()
    var bullyingResources = [Resource]()
    var domesticViolence = [Resource]()
    
    init(sEnum: StateEnum, scale: CATransform3D, position: CGPoint) {
        self.code = sEnum.getCode()
        self.name = sEnum.getName()
        self.stateEnum = sEnum
        self.path = UIBezierPath(svgPath: sEnum.getPath())
        self.layer = CAShapeLayer()
        self.scale = scale
        self.position = position
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
        if self.name == "South Carolina" {
            print("south carolina")
        }
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
    /* todo implement
    public void setResources(List<Resource> resourceList) {
    for (Resource resource : resourceList) {
    switch (resource.getCategory()) {
    case Config.categories.CHILD_ABUSE:
    this.mChildAbuseResource.add(resource);
    break;
    case Config.categories.BULLYING:
    this.mBullyingResource.add(resource);
    break;
    case Config.categories.DOMESTIC_VIOLENCE:
    this.mDomesticViolenceResource.add(resource);
    break;
    }
    }
    }
    
    public List<Resource> getChildAbuseResources() {
    return this.mChildAbuseResource;
    }
    
    public List<Resource> getBullyingResources() {
    return this.mBullyingResource;
    }
    
    public List<Resource> getDomesticViolenceResources() {
    return this.mDomesticViolenceResource;
    }
    
    public List<Resource> getAllResources() {
    List<Resource> resources = new ArrayList<>();
    resources.addAll(this.mChildAbuseResource);
    resources.addAll(this.mBullyingResource);
    resources.addAll(this.mDomesticViolenceResource);
    return resources;
    }
 */
}
