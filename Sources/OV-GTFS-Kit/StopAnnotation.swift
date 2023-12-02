//
//  StopAnnotation.swift
//  OV-GTFS-Kit
//
//  Created by ARTEM on 29.11.2023.
//

import Foundation
import MapKit


/// A custom map annotation representing information about a stop in a transit system
/// Conforms to the `MKAnnotation` protocol, providing essential properties for display on a map
public class StopAnnotation: NSObject, MKAnnotation {
    
    /// The geographic coordinate of the stop
    public let coordinate: CLLocationCoordinate2D
    /// The title or name of the stop
    public let title: String?
    /// A description or additional information about the stop
    public let subtitle: String?
    /// An image representing the stop, such as an icon or symbol
    public let image: UIImage

    init(
      coordinate: CLLocationCoordinate2D,
      title: String,
      subtitle: String,
      image: UIImage
    ) {
      self.coordinate = coordinate
      self.title = title
      self.subtitle = subtitle
      self.image = image
    }
}


/// Annotation view for public transport stops
public class StopAnnotationView: MKAnnotationView {
  public required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

  public override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
    super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
    guard let attractionAnnotation = self.annotation as? StopAnnotation else { return }

      image = attractionAnnotation.image
  }
}

extension MKMapView{
    /// Adds stop annotations to the map using information from the provided GTFS (General Transit Feed Specification) data
    /// - Parameters:
    ///   - gtfs: Static GTFS data
    ///   - image: An optional UIImage to be used as the default image for stop annotations
    public func addStopAnnotations(gtfs: GTFS, image: UIImage? = nil){
        for stop in gtfs.stops{
            if let stopLat = stop.stopLat, let stopLon = stop.stopLon{
                let coordinate = CLLocationCoordinate2D(latitude: stopLat, longitude: stopLon)
                let title = stop.stopName ?? ""
                let subtitle = stop.stopDesc ?? ""
                let anImage: UIImage = image ?? UIImage(systemName: "figure.wave.circle.fill")!.withTintColor(UIColor.blue)

                let annotation = StopAnnotation(coordinate: coordinate, title: title, subtitle: subtitle, image: anImage)
                self.addAnnotation(annotation)
            }
        }
    }
}
