//
//  DriverAnnotation.swift
//  UberClone
//
//  Created by Mac$hawn on 3/24/25.
//

import MapKit

class DriverAnnotation: NSObject, MKAnnotation {
    dynamic var coordinate: CLLocationCoordinate2D
    var uid: String?
    
    init(uid: String, coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
        self.uid = uid
    }
    
    func updateAnnotationPosition(withCoordinate coordinate: CLLocationCoordinate2D) {
        UIView.animate(withDuration: 0.2) {
            self.coordinate = coordinate
        }
    }
}
