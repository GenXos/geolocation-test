//
//  GetCoords.swift
//  geolocation-test
//
//  Created by Todd Fields on 2016-03-13.
//  Copyright © 2016 Skullgate Studios. All rights reserved.
//

import Foundation
import CoreLocation

class GetCoords {

    var _address: String!
    var _latitude: Double!
    var _longitude: Double!
    
    var address: String {
        if _address == nil {
            _address = ""
        }
        return _address
    }
    
    var latitude: Double {
        if _latitude == nil {
            _latitude = 0.0
        }
        return _latitude
    }
    
    var longitude: Double {
        if _longitude == nil {
            _longitude = 0.0
        }
        return _longitude
    }
    
    init (address: String) {
        
        self._address = address
        //transformAddress(address)
        print(getLatitude(self._address))
        print(longitude)
        
    }
    
    func getLatitude(address: String) {
        
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString("\(address)", completionHandler: {(placemarks, error)->Void in
            
            if let placemark = placemarks![0] as? CLPlacemark {
                
                self._latitude = placemark.location!.coordinate.latitude
                
            }
            
        })
    }
    
    func transformAddress(address: String) {
    
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString("\(address)", completionHandler: {(placemarks, error)->Void in
            
            if let placemark = placemarks![0] as? CLPlacemark {
                
                self._latitude = placemark.location!.coordinate.latitude
                self._longitude = placemark.location!.coordinate.longitude

                
            }
            
        })
    }
}
