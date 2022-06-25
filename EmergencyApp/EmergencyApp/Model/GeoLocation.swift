/*
 Copyright (C) 2022 by Rebvar ebrahimi
 Abstract:
    Models a GeoLocation including latitude and longitude.
 */

import Foundation
public protocol LocationAware {
    var latitude: Double {get set}
    var longitude: Double {get set}
    
    func getLocation() -> (lat: Double, long: Double)
    
}
