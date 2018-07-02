//
//  MapView.swift
//  Pulse_iOS
//
//  Created by Anna Harrison on 5/29/18.
//  Copyright © 2018 The Humanity Preservation Foundation. All rights reserved.
//

import Foundation
import UIKit
import SVGPath

class MapView: UIView {
    static var timeZoneTitlesAndStates = [
        TimeZoneEnum.PST : StateEnum.getTimeZoneStateCodes(timeZoneEnum: TimeZoneEnum.PST),
        TimeZoneEnum.MT : StateEnum.getTimeZoneStateCodes(timeZoneEnum: TimeZoneEnum.MT),
        TimeZoneEnum.WNC : StateEnum.getTimeZoneStateCodes(timeZoneEnum: TimeZoneEnum.WNC),
        TimeZoneEnum.WSC : StateEnum.getTimeZoneStateCodes(timeZoneEnum: TimeZoneEnum.WSC),
        TimeZoneEnum.ENC : StateEnum.getTimeZoneStateCodes(timeZoneEnum: TimeZoneEnum.ENC),
        TimeZoneEnum.ESC : StateEnum.getTimeZoneStateCodes(timeZoneEnum: TimeZoneEnum.ESC),
        TimeZoneEnum.MA : StateEnum.getTimeZoneStateCodes(timeZoneEnum: TimeZoneEnum.MA),
        TimeZoneEnum.SA : StateEnum.getTimeZoneStateCodes(timeZoneEnum: TimeZoneEnum.SA),
        TimeZoneEnum.NE : StateEnum.getTimeZoneStateCodes(timeZoneEnum: TimeZoneEnum.NE),
        TimeZoneEnum.ALL : StateEnum.getTimeZoneStateCodes(timeZoneEnum: TimeZoneEnum.ALL)
        ]
    var timeZones = [String : TimeZone]()
    var highlightedTimeZone: TimeZoneEnum?
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.timeZoneAndStateCreation()
        self.setup(inputView: self)
        
        //let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: Selector(("longPressed:")))
        //self.addGestureRecognizer(longPressRecognizer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.timeZoneAndStateCreation()
        self.setup(inputView: self)
        
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))
        self.addGestureRecognizer(longPressRecognizer)
    }
    
    override func draw(_ rect: CGRect) {
        let deviceHeight = UIScreen.main.bounds.height
        let deviceWidth = UIScreen.main.bounds.width
        self.frame.size.width = deviceWidth * 0.93
        self.frame.size.height = deviceHeight * 0.35 // todo calculate height based off of width
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let point = touch!.location(in: self)
        
        for timezone in self.timeZones.values {
            if (timezone.getEnum() != TimeZoneEnum.ALL ) {
                for state in timezone.getStates() {
                    let p = self.layer.convert(point, to:state.getLayer())
                    if ((state.getLayer().path!.contains(p))) {
                        self.changeHighlightedTimeZone(timeZoneEnum: timezone.getEnum())
                    }
                }
            }
            
        }
    }
    
    @objc func handleLongPress(sender: UILongPressGestureRecognizer) {
        self.changeHighlightedTimeZone(timeZoneEnum: TimeZoneEnum.ALL)
    
    }
    
    /**
     * Changes timeZone's fill color to the highlight color. If a timeZone has
     * already been highlighted, changes that time zone's color back to it's original color.
     * Finally, sets this.highlightedTimeZone to the <code>TimeZone</code> that owns the passed in
     * <code>timeZoneEnum </code> to keep track of which <code>TimeZone</code> is currently
     * highlighted
     * @param timeZoneEnum instance of TimeZoneEnum
     */
    func changeHighlightedTimeZone(timeZoneEnum: TimeZoneEnum) {
        if (self.highlightedTimeZone != nil) {
            self.resetHighlightedTimeZone();
        }
        self.setHighlightedTimeZone(timeZoneEnum: timeZoneEnum);
        self.highlightedTimeZone = timeZoneEnum;
    }
    
    /**
     * Highlight time zone
     */
    func setHighlightedTimeZone(timeZoneEnum: TimeZoneEnum) {
        if (timeZoneEnum == TimeZoneEnum.ALL) {
            for timezone in self.timeZones.values {
                if (timezone.getEnum() != (TimeZoneEnum.ALL)) { // needed to fix leak causing a couple of the timezones to highlight to the ALL timezone color
                    self.changeTimeZoneFillColor(timeZone: timezone, qualifier: "highlight");
                }
            }
        } else {
            let timeZone = self.getTimeZone(timeZoneEnum: timeZoneEnum);
            self.changeTimeZoneFillColor(timeZone: timeZone!, qualifier: "highlight");
        }
    }
    
    /**
     * Unhighlight time zone
     */
    func resetHighlightedTimeZone() {
        if (self.highlightedTimeZone == (TimeZoneEnum.ALL)) { //needed so that each time zone gets their original color
            for timezone in self.timeZones.values {
                if (timezone.getEnum() != (TimeZoneEnum.ALL)) { // needed to fix leak causing a couple of the timezones to highlight to the ALL timezone color
                    self.changeTimeZoneFillColor(timeZone: timezone, qualifier: timezone.getColorCode());
                }
            }
        } else {
            let tz = self.getTimeZone(timeZoneEnum: self.highlightedTimeZone!)
            self.changeTimeZoneFillColor(timeZone: tz!, qualifier: tz!.getColorCode());
        }
    }

    
    /**
     * Changes the timezones fill color and calls <code>invalidate()</code> to redraw the map.
     * @param qualifier string used to get appropriate color resource
     *                  options: "highlight", "1", "2", "3", "4", "5"
     */
    func changeTimeZoneFillColor(timeZone: TimeZone, qualifier: String) {
        timeZone.changeFillColor(qualifier: qualifier);
    }
    
    /**
     * Returns TimeZone object that has <code>timeZoneEnum</code> as its enum.
     */
    func getTimeZone(timeZoneEnum: TimeZoneEnum) -> TimeZone? {
        for timezone in self.timeZones.values {
            if (timezone.getEnum() == timeZoneEnum) {
                return timezone;
            }
        }
        return nil;
    }

    
    func timeZoneAndStateCreation() {
        for (tzEnum, stateArray) in MapView.timeZoneTitlesAndStates {
            var tz: TimeZone
            switch tzEnum {
                case .ALL:
                    tz = TimeZone(tzColorCode: "0", tzEnum: tzEnum, tzStateEnums: stateArray, tzScale: self.calculateScale(), tzPosition: self.calculatePosition())
                    break
                case .PST:
                    tz = TimeZone(tzColorCode: "1", tzEnum: tzEnum, tzStateEnums: stateArray, tzScale: self.calculateScale(), tzPosition: self.calculatePosition())
                    break
                case .MT, .ENC:
                    tz = TimeZone(tzColorCode: "2", tzEnum: tzEnum, tzStateEnums: stateArray, tzScale: self.calculateScale(), tzPosition: self.calculatePosition())
                    break
                case .WSC, .MA:
                    tz = TimeZone(tzColorCode: "3", tzEnum: tzEnum, tzStateEnums: stateArray, tzScale: self.calculateScale(), tzPosition: self.calculatePosition())
                    break
                case .ESC, .NE:
                    tz = TimeZone(tzColorCode: "4", tzEnum: tzEnum, tzStateEnums: stateArray, tzScale: self.calculateScale(), tzPosition: self.calculatePosition())
                    break
                case .WNC, .SA:
                    tz = TimeZone(tzColorCode: "5", tzEnum: tzEnum, tzStateEnums: stateArray, tzScale: self.calculateScale(), tzPosition: self.calculatePosition())
                    break
            }
            self.timeZones.add([tz.getEnum().getCode() : tz])
            
        }
    }
    
    func calculateScale() -> CATransform3D {//todo: make more accurate
        print("width")
        print(self.frame.size.width)
        print("height")
        print(self.frame.size.height)
        self.draw(CGRect())
        let width = self.frame.size.width
        let divisor = CGFloat(870.674418605)
        let scale = width/divisor
        return CATransform3DMakeScale(scale, scale, scale)
    }
    
    func calculatePosition() -> CGPoint { //todo: make more accurate
        self.draw(CGRect())
        let width = self.frame.size.width
        let divisor = CGFloat(-9.86)
        let position = width/divisor
        return CGPoint(x: position, y: 0)
    }
    
    func setup(inputView: UIView) {
        for timeZone in self.timeZones.values {
            if (timeZone.getEnum() != TimeZoneEnum.ALL) {
                for state in timeZone.getStates() {
                    self.layer.addSublayer(state.getLayer())
                }
            }
        }
        
        /*
        for timeZone in self.timeZones.values {
            if (timeZone.getEnum() != TimeZoneEnum.ALL) {
                for layer in timeZone.getLabelShapeLayerArray() {
                    self.layer.addSublayer(layer)
                }
            }
        }
 */
    }
    
    
}


