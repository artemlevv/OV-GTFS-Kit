//
//  VehicleAnnotation.swift
//  OV-GTFS-Kit
//
//  Created by ARTEM on 28.11.2023.
//

import Foundation
import MapKit

/// Represents a vehicle annotation on the map with information such as coordinates, title, subtitle, image, and vehicle ID.
public class VehicleAnnotation: NSObject, MKAnnotation {
    
    /// The coordinate of the vehicle on the map.
    public dynamic var coordinate: CLLocationCoordinate2D
    /// The title of the vehicle annotation
    public let title: String?
    /// The subtitle of the vehicle annotation
    public let subtitle: String?
    /// The image representing the vehicle on the map
    public let image: UIImage
    /// The unique identifier for the vehicle
    public let vehicleID: String
    
    /// Initializes a new `VehicleAnnotation`.
    /// - Parameters:
    ///   - coordinate: The coordinate of the vehicle.
    ///   - title: The title of the vehicle annotation
    ///   - subtitle: The subtitle of the vehicle annotation
    ///   - image: The image representing the vehicle
    ///   - vehicleID: The unique identifier for the vehicle
    public init(
        coordinate: CLLocationCoordinate2D,
        title: String,
        subtitle: String,
        image: UIImage,
        vehicleID: String
      ) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
        self.image = image
        self.vehicleID = vehicleID
    }
}

/// Represents a custom annotation view for a vehicle on the map
public class VehicleAnnotationView: MKAnnotationView {
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    /// Initializes a new `VehicleAnnotationView` with the specified annotation and reuseIdentifier
    /// - Parameters:
    ///   - annotation: The annotation to associate with the view
    ///   - reuseIdentifier: A string identifying the view for reuse
    public override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        guard let attractionAnnotation = self.annotation as? VehicleAnnotation else { return }

        image = attractionAnnotation.image
    }
}

extension MKMapView{
    
    /// Adds vehicle annotations to the map based on GTFS and GTFS Realtime data
    /// - Parameters:
    ///   - gtfs: The static GTFS data
    ///   - gtfs_realtime: The GTFS Realtime data
    ///   - image: The image to use for annotations. If not provided, a default bus icon is used
    public func addVehicleAnnotations(gtfs: GTFS, gtfs_realtime: GTFSRealtime_FeedMessage,image: UIImage? = nil){
        for vehicle in gtfs_realtime.entity{
                
            let coordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees(vehicle.vehicle.position.latitude), longitude: CLLocationDegrees(vehicle.vehicle.position.longitude))
            let route = gtfs.routes.first(where: {$0.routeId == vehicle.vehicle.trip.routeID})
            let title: String = route?.routeShortName ?? ""
            let subtitle: String = route?.routeLongName ?? ""
        
            let anImage: UIImage = image ?? UIImage(systemName: "bus")!.withTintColor(UIColor.yellow)
            let vehicleID = vehicle.vehicle.vehicle.id
                
            let annotation = VehicleAnnotation(coordinate: coordinate, title: title, subtitle: subtitle, image: anImage, vehicleID: vehicleID)
            self.addAnnotation(annotation)
        }
    }
    
    /// Updates existing vehicle annotations on the map based on GTFS and GTFS Realtime data
    /// - Parameters:
    ///   - gtfs: The static GTFS data
    ///   - gtfs_realtime: The GTFS Realtime data
    ///   - update_image: The image to use for updated annotations. If not provided, a default bus icon is used
    public func updateVehicleAnnotations(gtfs: GTFS, gtfs_realtime: GTFSRealtime_FeedMessage, update_image: UIImage? = nil) {
        for anotation in self.annotations{
            if let vehicle = gtfs_realtime.entity.first(where: {$0.vehicle.vehicle.id == (anotation as? VehicleAnnotation)?.vehicleID}){
                let coordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees(vehicle.vehicle.position.latitude), longitude: CLLocationDegrees(vehicle.vehicle.position.longitude))
                (anotation as? VehicleAnnotation)?.coordinate = coordinate
            }
            
        }
        for vehicle in gtfs_realtime.entity {
            let coordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees(vehicle.vehicle.position.latitude), longitude: CLLocationDegrees(vehicle.vehicle.position.longitude))
            let vehicleID = vehicle.vehicle.vehicle.id
            
            if annotations.first(where: { ($0 as? VehicleAnnotation)?.vehicleID == vehicleID }) as? VehicleAnnotation == nil{
                let route = gtfs.routes.first(where: { $0.routeId == vehicle.vehicle.trip.routeID })
                let title: String = route?.routeShortName ?? ""
                let subtitle: String = route?.routeLongName ?? ""
                let anImage: UIImage = update_image ?? UIImage(systemName: "bus")!.withTintColor(UIColor.yellow)
                
                let annotation = VehicleAnnotation(coordinate: coordinate, title: title, subtitle: subtitle, image: anImage, vehicleID: vehicleID)
                self.addAnnotation(annotation)
            }
        }
    }
}
