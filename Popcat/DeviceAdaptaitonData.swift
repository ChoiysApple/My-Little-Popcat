//
//  DeviceAdaptaitonData.swift
//  Popcat
//
//  Created by Daegeon Choi on 2021/05/13.
//

import Foundation
import UIKit

public var cellSizeRatio: CGFloat {
    get {
        let model = UIDevice.current.model
        if model == "iPad" {
            return 0.9
        } else {
            return 0.93
        }
    }
}

public var numberOfCells: CGFloat {
    get {
        let model = UIDevice.current.model
        if model == "iPad" {
            return 3.0
        } else {
            return 2.0
        }
    }
}
