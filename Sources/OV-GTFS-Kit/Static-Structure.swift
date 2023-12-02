//
//  Static-Structure.swift
//  OV-GTFS-Kit
//
//  Created by ARTEM on 29.11.2023.
//

import Foundation

/// A struct representing information about a transit agency
public struct Agency: Codable, FromCSVLine {
    /// The unique identifier of the agency
    public let agencyId: String?
    /// The name of the transit agency
    public let agencyName: String
    /// The URL of the transit agency's website
    public let agencyUrl: String
    /// The timezone in which the agency operates
    public let agencyTimezone: String
    /// The language used by the agency (optional)
    public let agencyLang: String?
    /// The phone number for contacting the agency (optional)
    public let agencyPhone: String?
    /// The URL for fare information on the agency's website (optional)
    public let agencyFareUrl: String?
    /// The email address for contacting the agency (optional)
    public let agencyEmail: String?

    public init(line: CSVLine) {
        agencyId = line["agency_id"]
        agencyName = line["agency_name"]!
        agencyUrl = line["agency_url"]!
        agencyTimezone = line["agency_timezone"]!
        agencyLang = line["agency_lang"]
        agencyPhone = line["agency_phone"]
        agencyFareUrl = line["agency_fare_url"]
        agencyEmail = line["agency_email"]
    }
}

/// A struct representing information about a transit stop
public struct Stop: Codable, FromCSVLine {
    /// The unique identifier of the stop
    public let stopId: String
    /// The code associated with the stop (optional)
    public let stopCode: String?
    /// The name of the stop (optional)
    public let stopName: String?
    /// A description or additional information about the stop (optional)
    public let stopDesc: String?
    /// The latitude of the stop's location (optional)
    public let stopLat: Double?
    /// The longitude of the stop's location (optional)
    public let stopLon: Double?
    /// The zone ID of the stop (optional)
    public let zoneId: String?
    /// The URL of the stop (optional)
    public let stopUrl: String?
    /// The type of location (e.g., stop, station) (optional)
    public let locationType: LocationType?
    /// The ID of the parent station (optional)
    public let parentStation: String?
    /// The timezone of the stop (optional)
    public let stopTimezone: String?
    /// Indicates whether wheelchair boarding is available at the stop (optional)
    public let wheelchairBoarding: WheelchairAccessible?
    /// The ID of the level for the stop (optional)
    public let levelId: String?
    /// The platform code for the stop (optional)
    public let platformCode: String?

    public init(line: CSVLine) {
        stopId = line["stop_id"]!
        stopCode = line["stop_code"]
        stopName = line["stop_name"]
        stopDesc = line["stop_desc"]
        stopLat = Double.from(line["stop_lat"])
        stopLon = Double.from(line["stop_lon"])
        zoneId = line["zone_id"]
        stopUrl = line["stop_url"]
        locationType = LocationType.from(line["location_type"])
        parentStation = line["parent_station"]
        stopTimezone = line["stop_timezone"]
        wheelchairBoarding = WheelchairAccessible.from(line["wheelchair_boarding"])
        levelId = line["level_id"]
        platformCode = line["platform_code"]
    }
}

/// An enumeration representing the type of location in transit systems
public enum LocationType: Int, Codable {
    /// Represents a stop
    case stop = 0
    /// Represents a station
    case station = 1
    /// Represents an entrance or exit
    case entranceOrExit = 2
    /// Represents a generic node
    case genericNode = 3
    /// Represents a boarding area
    case boardingArea = 4

    /// Creates a `LocationType` from a string representation.
    static func from(_ string: String?) -> LocationType? {
        if let string = string {
            if let int = Int(string) {
                return LocationType(rawValue: int) ?? .stop

            } else {
                return .stop
            }

        } else {
            return nil
        }
    }
}

/// An enumeration representing the wheelchair accessibility status of a transit location
public enum WheelchairAccessible: Int, Codable {
    /// No information available about wheelchair accessibility
    case noInformation = 0
    /// The location is wheelchair accessible
    case wheelchairAccessible = 1
    /// The location is not wheelchair accessible
    case notWheelchairAccessible = 2

    /// Creates a `WheelchairAccessible` from a string representation
    static func from(_ string: String?) -> WheelchairAccessible? {
        if let string = string {
            if let int = Int(string) {
                return WheelchairAccessible(rawValue: int) ?? .noInformation

            } else {
                return .noInformation
            }

        } else {
            return nil
        }
    }
}

/// A struct representing information about a transit route
public struct Route: Codable, FromCSVLine {
    /// The unique identifier of the route
    public let routeId: String
    /// The unique identifier of the agency associated with the route (optional)
    public let agencyId: String?
    /// The short name of the route (optional)
    public let routeShortName: String?
    /// The long name of the route (optional)
    public let routeLongName: String?
    /// A description or additional information about the route (optional)
    public let routeDesc: String?
    /// The type of the route (e.g., bus, subway) as per the `RouteType` enum
    public let routeType: RouteType
    /// The URL of the route (optional)
    public let routeUrl: String?
    /// The color associated with the route (optional)
    public let routeColor: String?
    /// The text color associated with the route (optional)
    public let routeTextColor: String?
    /// The sort order of the route (optional)
    public let routeSortOrder: Int?

    public init(line: CSVLine) {
        routeId = line["route_id"]!
        agencyId = line["agency_id"]
        routeShortName = line["route_short_name"]
        routeLongName = line["route_long_name"]
        routeDesc = line["route_desc"]
        routeType = RouteType.from(line["route_type"])!
        routeUrl = line["route_url"]
        routeColor = line["route_color"]
        routeTextColor = line["route_text_color"]
        routeSortOrder = Int.from(line["route_sort_order"])
    }
}

/// An enumeration representing the type of transit route
public enum RouteType: Int, Codable {
    /// Tram, streetcar, or light rail
    case tramStreetcaseOrLightRail = 0
    /// Subway or metro
    case subwayOrMetro = 1
    /// Rail
    case rail = 2
    /// Bus
    case bus = 3
    /// Ferry
    case ferry = 4
    /// Cable car
    case cableCar = 5
    /// Gondola or suspended cable car
    case gondolaOrSuspendedCableCar = 6
    /// Funicular
    case funicular = 7

    /// Creates a `RouteType` from a string representation.
    static func from(_ string: String?) -> RouteType? {
        if let string = string {
            if let int = Int(string) {
                return RouteType(rawValue: int) ?? .tramStreetcaseOrLightRail

            } else {
                return .tramStreetcaseOrLightRail
            }

        } else {
            return nil
        }
    }
}

/// A struct representing information about a transit trip
public struct Trip: Codable, FromCSVLine {
    /// The unique identifier of the route associated with the trip
    public let routeId: String
    /// The unique identifier of the service associated with the trip
    public let serviceId: String
    /// The unique identifier of the trip
    public let tripId: String
    /// The headsign or destination of the trip (optional)
    public let tripHeadsign: String?
    /// The short name of the trip (optional)
    public let tripShortName: String?
    /// The direction of the trip as per the `Direction` enum (optional)
    public let directionId: Direction?
    /// The block ID associated with the trip (optional)
    public let blockId: String?
    /// The shape ID associated with the trip (optional)
    public let shapeId: String?
    /// Indicates whether the trip is wheelchair accessible (optional)
    public let wheelchairAccessible: WheelchairAccessible?
    /// Indicates whether bikes are allowed on the trip (optional)
    public let bikesAllowed: BikesAllowed?

    public init(line: CSVLine) {
        routeId = line["route_id"]!
        serviceId = line["service_id"]!
        tripId = line["trip_id"]!
        tripHeadsign = line["trip_headsign"]
        tripShortName = line["trip_short_name"]
        directionId = Direction.from(line["direction_id"])
        blockId = line["block_id"]
        shapeId = line["shape_id"]
        wheelchairAccessible = WheelchairAccessible.from(line["wheelchair_accessible"])
        bikesAllowed = BikesAllowed.from(line["bikes_allowed"])
    }
}

/// An enumeration representing the direction of travel for a transit trip
public enum Direction: Int, Codable {
    /// The trip travels in one direction
    case travelInOneDirection = 0
    /// The trip travels in the opposite direction
    case travelInOppositeDirection = 1

    static func from(_ string: String?) -> Direction? {
        if let string = string {
            if let int = Int(string) {
                return Direction(rawValue: int) ?? .travelInOneDirection

            } else {
                return .travelInOneDirection
            }

        } else {
            return nil
        }
    }
}

/// An enumeration representing the policy for allowing bicycles on a transit trip
public enum BikesAllowed: Int, Codable {
    /// No information available about bike policy
    case noBikeInformation = 0
    /// At least one bicycle is allowed on the trip
    case atleastOneBicycle = 1
    /// No bicycles are allowed on the trip
    case noBicyclesAllowed = 2

    static func from(_ string: String?) -> BikesAllowed? {
        if let string = string {
            if let int = Int(string) {
                return BikesAllowed(rawValue: int) ?? .noBikeInformation

            } else {
                return .noBikeInformation
            }

        } else {
            return nil
        }
    }
}

/// A struct representing information about a stop time in a transit trip
public struct StopTime: Codable, FromCSVLine {
    /// The unique identifier of the trip associated with the stop time
    public let tripId: String
    /// The arrival time at the stop (optional)
    public let arrivalTime: String?
    /// The departure time from the stop (optional)
    public let departureTime: String?
    /// The unique identifier of the stop associated with the stop time
    public let stopId: String
    /// The sequence order of the stop within the trip
    public let stopSequence: Int
    /// The headsign or destination of the stop (optional)
    public let stopHeadsign: String?
    /// The type of pickup at the stop as per the `PickupType` enum (optional)
    public let pickupType: PickupType?
    /// The type of drop-off at the stop as per the `DropOffType` enum (optional)
    public let dropOffType: DropOffType?
    /// The distance traveled along the shape (optional)
    public let shapeDistTraveled: Float?
    /// Indicates whether the stop is a timepoint as per the `Timepoint` enum (optional)
    public let timepoint: Timepoint?

    public init(line: CSVLine) {
        tripId = line["trip_id"]!
        arrivalTime = line["arrival_time"]
        departureTime = line["departure_time"]
        stopId = line["stop_id"]!
        stopSequence = Int(line["stop_sequence"]!)!
        stopHeadsign = line["stop_headsign"]
        pickupType = PickupType.from(line["pickup_type"])
        dropOffType = DropOffType.from(line["drop_off_type"])
        shapeDistTraveled = Float.from(line["shape_dist_traveled"])
        timepoint = Timepoint.from(line["timepoint"])
    }
}

/// An enumeration representing the type of pickup available at a transit stop.
public enum PickupType: Int, Codable {
    /// Regularly scheduled pickup.
    case regularlyScheduled = 0
    /// No pickup available.
    case noPickupAvailable = 1
    /// Pickup available by contacting the agency by phone.
    case phoneAgencyForPickup = 2
    /// Pickup available by coordinating with the driver.
    case coordinateWithDriver = 3

    static func from(_ string: String?) -> PickupType? {
        if let string = string {
            if let int = Int(string) {
                return PickupType(rawValue: int) ?? .regularlyScheduled

            } else {
                return .regularlyScheduled
            }

        } else {
            return nil
        }
    }
}

/// An enumeration representing the type of drop-off available at a transit stop.
public enum DropOffType: Int, Codable {
    /// Regularly scheduled drop-off.
    case regularlyScheduled = 0
    /// No drop-off available.
    case noDropOffAvailable = 1
    /// Drop-off available by contacting the agency by phone.
    case phoneAgencyForDropOff = 2
    /// Drop-off available by coordinating with the driver.
    case coordinateWithDriver = 3

    static func from(_ string: String?) -> DropOffType? {
        if let string = string {
            if let int = Int(string) {
                return DropOffType(rawValue: int) ?? .regularlyScheduled

            } else {
                return .regularlyScheduled
            }

        } else {
            return nil
        }
    }
}
/// An enumeration representing the type of timepoint at a transit stop.
public enum Timepoint: Int, Codable {
    /// The timepoint is approximate.
    case approximate = 0
    /// The timepoint is exact.
    case exact = 1

    static func from(_ string: String?) -> Timepoint? {
        if let string = string {
            if let int = Int(string) {
                return Timepoint(rawValue: int) ?? .exact

            } else {
                return .exact
            }
        } else {
            return nil
        }
    }
}

/// A struct representing information about the availability of transit service on different days of the week.
public struct GTFSCalendar: Codable, FromCSVLine {
    /// The unique identifier of the service associated with the calendar.
    public let serviceId: String
    /// Indicates whether service is available on Monday as per the `ServiceAvailable` enum.
    public let monday: ServiceAvailable
    /// Indicates whether service is available on Tuesday as per the `ServiceAvailable` enum.
    public let tuesday: ServiceAvailable
    /// Indicates whether service is available on Wednesday as per the `ServiceAvailable` enum.
    public let wednesday: ServiceAvailable
    /// Indicates whether service is available on Thursday as per the `ServiceAvailable` enum.
    public let thursday: ServiceAvailable
    /// Indicates whether service is available on Friday as per the `ServiceAvailable` enum.
    public let friday: ServiceAvailable
    /// Indicates whether service is available on Saturday as per the `ServiceAvailable` enum.
    public let saturday: ServiceAvailable
    /// Indicates whether service is available on Sunday as per the `ServiceAvailable` enum.
    public let sunday: ServiceAvailable
    /// The start date of the service availability period.
    public let startDate: String
    /// The end date of the service availability period.
    public let endDate: String

    public init(line: CSVLine) {
        serviceId = line["service_id"]!
        monday = ServiceAvailable.from(line["monday"]!)
        tuesday = ServiceAvailable.from(line["tuesday"]!)
        wednesday = ServiceAvailable.from(line["wednesday"]!)
        thursday = ServiceAvailable.from(line["thursday"]!)
        friday = ServiceAvailable.from(line["friday"]!)
        saturday = ServiceAvailable.from(line["saturday"]!)
        sunday = ServiceAvailable.from(line["sunday"]!)
        startDate = line["start_date"]!
        endDate = line["end_date"]!
    }
}

/// An enumeration representing the availability of transit service on a specific day of the week.
public enum ServiceAvailable: Int, Codable {
    /// Transit service is not available.
    case notAvailableForAll = 0
    /// Transit service is available.
    case availableForAll = 1

    static func from(_ string: String) -> ServiceAvailable {
        if let int = Int(string) {
            return ServiceAvailable(rawValue: int) ?? .notAvailableForAll

        } else {
            return .notAvailableForAll
        }
    }
}

/// A struct representing information about exceptional dates and service changes in a transit calendar.
public struct CalendarDate: Codable, FromCSVLine {
    /// The unique identifier of the service associated with the calendar date.
    public let serviceId: String
    /// The date for which an exception or service change occurs.
    public let date: String
    /// The type of exception as per the `ExceptionType` enum.
    public let exceptionType: ExceptionType

    public init(line: CSVLine) {
        serviceId = line["service_id"]!
        date = line["date"]!
        exceptionType = ExceptionType.from(line["exception_type"]!)
    }
}

/// An enumeration representing the type of exception in a transit calendar date
public enum ExceptionType: Int, Codable {
    /// Indicates that transit service is added on the specified date.
    case serviceAdded = 1
    /// Indicates that transit service is removed on the specified date.
    case serviceRemoved = 2

    static func from(_ string: String) -> ExceptionType {
        if let int = Int(string) {
            return ExceptionType(rawValue: int) ?? .serviceAdded

        } else {
            return .serviceAdded
        }
    }
}

/// A struct representing fare information for transit services.
public struct FareAttribute: Codable, FromCSVLine {
    /// The unique identifier of the fare.
    public let fareId: String
    /// The price of the fare.
    public let price: Float
    /// The currency type of the fare
    public let currencyType: String
    /// The payment method for the fare as per the `PaymentMethod` enum.
    public let paymentMethod: PaymentMethod
    /// The transfer allowance for the fare as per the `TransfersAllowed` enum.
    public let transfers: TransfersAllowed
    /// The unique identifier of the agency associated with the fare (optional)
    public let agencyId: String?
    /// The duration of time, in seconds, that a ticket is valid for transfers (optional)
    public let transferDuration: Int?

    public init(line: CSVLine) {
        fareId = line["fare_id"]!
        price = Float.from(line["price"]!)!
        currencyType = line["currency_type"]!
        paymentMethod = PaymentMethod.from(line["payment_method"]!)
        transfers = TransfersAllowed.from(line["transfers"]!)
        agencyId = line["agency_id"]
        transferDuration = Int.from(line["transfer_duration"])
    }
}

/// An enumeration representing the payment method for transit fares.
public enum PaymentMethod: Int, Codable {
    /// Indicates that the fare can be paid on board the transit vehicle.
    case farePaidOnBoard = 0
    /// Indicates that the fare must be paid before boarding the transit vehicle.
    case fareMustBePaidBeforeBoarding = 1

    static func from(_ string: String) -> PaymentMethod {
        if let int = Int(string) {
            return PaymentMethod(rawValue: int) ?? .farePaidOnBoard

        } else {
            return .farePaidOnBoard
        }
    }
}

/// An enumeration representing the number of transfers allowed for a transit fare.
public enum TransfersAllowed: Int, Codable {
    /// Indicates that no transfers are allowed for the transit fare.
    case noTransfers = 0
    /// Indicates that one transfer is allowed for the transit fare.
    case oneTransfer = 1
    /// Indicates that two transfers are allowed for the transit fare.
    case twoTransfers = 2
    /// Indicates that unlimited transfers are allowed for the transit fare.
    case unlimitedTransfers = -1

    static func from(_ string: String) -> TransfersAllowed {
        if let int = Int(string) {
            return TransfersAllowed(rawValue: int) ?? .unlimitedTransfers

        } else {
            return .unlimitedTransfers
        }
    }
}

/// A struct representing fare rules for transit services.
public struct FareRule: Codable, FromCSVLine {
    /// The unique identifier of the fare associated with the rule.
    public let fareId: String
    /// The unique identifier of the route to which the fare rule applies (optional).
    public let routeId: String?
    /// The unique identifier of the origin stop to which the fare rule applies (optional).
    public let originId: String?
    /// The unique identifier of the destination stop to which the fare rule applies (optional).
    public let destinationId: String?
    /// The unique identifier of a stop or station that must be contained in the trip for the fare rule to apply (optional).
    public let containsId: String?

    public init(line: CSVLine) {
        fareId = line["fare_id"]!
        routeId = line["route_id"]
        originId = line["origin_id"]
        destinationId = line["destination_id"]
        containsId = line["contains_id"]
    }
}

/// A struct representing geographic shapes for transit routes.
public struct Shape: Codable, FromCSVLine {
    /// The unique identifier of the shape (optional).
    public let shapeId: String?
    /// The latitude of the shape point.
    public let shapePtLat: Double
    /// The longitude of the shape point.
    public let shapePtLon: Double
    /// The sequence order of the shape point in the route.
    public let shapePtSequence: Int
    /// The cumulative distance traveled along the shape from the start of the route (optional).
    public let shapeDistTraveled: Float?

    public init(line: CSVLine) {
        shapeId = line["shape_id"]
        shapePtLat = Double.from(line["shape_pt_lat"])!
        shapePtLon = Double.from(line["shape_pt_lon"])!
        shapePtSequence = Int.from(line["shape_pt_sequence"])!
        shapeDistTraveled = Float.from(line["shape_dist_traveled"])
    }
}
/// A struct representing frequency-based scheduling information for transit trips.
public struct Frequency: Codable, FromCSVLine {
    /// The unique identifier of the trip associated with the frequency.
    public let tripId: String
    /// The start time of the frequency-based schedule.
    public let startTime: String
    /// The end time of the frequency-based schedule.
    public let endTime: String
    /// The time, in seconds, between consecutive vehicle departures.
    public let headwaySecs: Int
    /// Indicates whether exact times are specified for the frequency.
    public let exactTimes: ExactTimes?

    public init(line: CSVLine) {
        tripId = line["trip_id"]!
        startTime = line["start_time"]!
        endTime = line["end_time"]!
        headwaySecs = Int.from(line["headway_secs"])!
        exactTimes = ExactTimes.from(line["exact_times"])
    }
}

/// An enumeration representing whether transit trips are scheduled based on exact times or frequencies.
public enum ExactTimes: Int, Codable {
    /// Indicates that transit trips are scheduled based on frequencies.
    case frequencyBasedTrips = 0
    /// Indicates that transit trips are scheduled based on exact times.
    case scheduleBasedTrips = 1

    static func from(_ string: String?) -> ExactTimes? {
        if let string = string {
            if let int = Int(string) {
                return ExactTimes(rawValue: int) ?? .frequencyBasedTrips

            } else {
                return .frequencyBasedTrips
            }

        } else {
            return .frequencyBasedTrips
        }
    }
}

/// A struct representing transfer information between transit stops.
public struct Transfer: Codable, FromCSVLine {
    /// The unique identifier of the stop where the transfer begins.
    public let fromStopId: String
    /// The unique identifier of the stop where the transfer ends.
    public let topStopId: String
    /// The type of transfer as per the `TransferType` enum.
    public let transferType: TransferType
    /// The minimum time, in seconds, required to transfer between stops (optional).
    public let minTransferTime: Int?

    public init(line: CSVLine) {
        fromStopId = line["from_stop_id"]!
        topStopId = line["top_stop_id"]!
        transferType = TransferType.from(line["transfer_type"]!)
        minTransferTime = Int.from(line["min_transfer_time"])
    }
}

/// An enumeration representing the type of transfer between transit stops.
public enum TransferType: Int, Codable {
    /// Indicates that the transfer is recommended but not mandatory.
    case recommendedTransferPoint = 0
    
    /// Indicates that the transfer is time-based, and the rider should check for specific timings.
    case timeTransferPoint = 1
    /// Indicates that the transfer requires a minimum amount of time.
    case minimumTimeTransfer = 2
    /// Indicates that transfer between stops is not possible.
    case transferNotPossible = 3

    static func from(_ string: String) -> TransferType {
        if let int = Int(string) {
            return TransferType(rawValue: int) ?? .recommendedTransferPoint

        } else {
            return .recommendedTransferPoint
        }
    }
}

/// A struct representing pathways connecting transit stops, such as pedestrian walkways or tunnels
public struct Pathway: Codable, FromCSVLine {
    /// The unique identifier of the pathway.
    public let pathwayId: String
    /// The unique identifier of the stop where the pathway begins.
    public let fromStopId: String
    /// The unique identifier of the stop where the pathway ends.
    public let toStopId: String
    /// The mode of the pathway as per the `PathwayMode` enum.
    public let pathwayMode: PathwayMode
    /// Indicates whether the pathway is bidirectional or unidirectional.
    public let isBidirectional: Bidirectional
    /// The length of the pathway in meters (optional).
    public let length: Float?
    /// The time, in seconds, to traverse the pathway (optional).
    public let transversalTime: Int?
    /// The number of stairs along the pathway (optional).
    public let stairCount: Int?
    /// The maximum slope of the pathway (optional).
    public let maxSlope: Float?
    /// The minimum width of the pathway in meters (optional).
    public let minWidth: Float?
    /// The signposted name of the pathway (optional).
    public let signpostedAs: String?
    /// The reversed signposted name of the pathway (optional).
    public let reversedSignpostedAs: String?

    public init(line: CSVLine) {
        pathwayId = line["pathway_id"]!
        fromStopId = line["from_stop_id"]!
        toStopId = line["to_stop_id"]!
        pathwayMode = PathwayMode.from(line["pathway_mode"]!)
        isBidirectional = Bidirectional.from(line["is_bidirectional"]!)
        length = Float.from(line["length"])
        transversalTime = Int.from(line["transversal_time"])
        stairCount = Int.from(line["stair_count"])
        maxSlope = Float.from(line["max_slope"])
        minWidth = Float.from(line["min_width"])
        signpostedAs = line["signposted_as"]
        reversedSignpostedAs = line["reversed_signposted_as"]
    }
}

/// An enumeration representing the directionality of a pathway, indicating whether it is bidirectional or unidirectional.
public enum Bidirectional: Int, Codable {
    /// Indicates that the pathway is unidirectional.
    case unidirectional = 0
    /// Indicates that the pathway is bidirectional.
    case bidirectional = 1

    static func from(_ string: String) -> Bidirectional {
        if let int = Int(string) {
            return Bidirectional(rawValue: int) ?? .unidirectional

        } else {
            return .unidirectional
        }
    }
}

/// An enumeration representing the mode of a pathway, indicating the type of structure connecting transit stops.
public enum PathwayMode: Int, Codable {
    /// Indicates a walkway as the mode of the pathway.
    case walkway = 1
    /// Indicates stairs as the mode of the pathway.
    case stairs = 2
    /// Indicates a moving sidewalk or travelator as the mode of the pathway.
    case movingSidewalkOrTravelator = 3
    /// Indicates an escalator as the mode of the pathway.
    case escalator = 4
    /// Indicates an elevator as the mode of the pathway.
    case elevator = 5
    /// Indicates a fare gate as the mode of the pathway.
    case fareGate = 6

    static func from(_ string: String) -> PathwayMode {
        if let int = Int(string) {
            return PathwayMode(rawValue: int) ?? .walkway

        } else {
            return .walkway
        }
    }
}

/// A struct representing a level or floor within a transit facility.
public struct Level: Codable, FromCSVLine {
    /// The unique identifier of the level.
    public let levelId: String
    /// The index or number representing the position of the level within the transit facility.
    public let levelIndex: Float
    /// The name or description of the level (optional).
    public let levelName: String?

    public init(line: CSVLine) {
        levelId = line["level_id"]!
        levelIndex = Float.from(line["level_index"])!
        levelName = line["level_name"]
    }
}

/// A struct representing information about the transit feed, including details about the publisher, language, and version.
public struct FeedInfo: Codable, FromCSVLine {
    /// The name of the organization that publishes the transit feed.
    public let feedPublisherName: String
    /// The URL of the organization that publishes the transit feed.
    public let feedPublisherUrl: String
    /// The language code of the transit feed.
    public let feedLang: String
    /// The start date when the feed becomes effective (optional).
    public let feedStartDate: String?
    /// The end date when the feed expires (optional)
    public let feedEndDate: String?
    /// The version of the transit feed (optional)
    public let feedVersion: String?
    /// The email contact for the organization publishing the feed (optional)
    public let feedContactEmail: String?
    /// The URL contact for the organization publishing the feed (optional)
    public let feedContactUrl: String?

    public init(line: CSVLine) {
        feedPublisherName = line["feed_publisher_name"]!
        feedPublisherUrl = line["feed_publisher_url"]!
        feedLang = line["feed_lang"]!
        feedStartDate = line["feed_start_date"]
        feedEndDate = line["feed_end_date"]
        feedVersion = line["feed_version"]
        feedContactEmail = line["feed_contact_email"]
        feedContactUrl = line["feed_contact_url"]
    }
}

/// A struct representing a translation entry for a specific field in a table, providing language-specific content.
public struct Translation: Codable, FromCSVLine {
    /// The name of the table associated with the translation.
    public let tableName: TableName
    /// The name of the field within the table that is being translated.
    public let fieldName: String
    /// The language code of the translation.
    public let language: String
    /// The translated content for the specified field and language.
    public let translation: String
    /// The optional record identifier associated with the translation.
    public let recordId: String?

    public init(line: CSVLine) {
        tableName = TableName.from(line["table_name"]!)
        fieldName = line["field_name"]!
        language = line["language"]!
        translation = line["translation"]!
        recordId = line["record_id"]
    }
}

/// An enumeration representing the names of tables within a transit database.
public enum TableName: String, Codable {
    /// The "agency" table.
    case agency
    /// The "stops" table.
    case stops
    /// The "routes" table.
    case routes
    /// The "trips" table.
    case trips
    /// The "stop_times" table.
    case stopTimes = "stop_times"
    /// The "feed_info" table.
    case feedInfo = "feed_info"

    static func from(_ string: String) -> TableName {
        TableName(rawValue: string) ?? .agency
    }
}

/// A struct representing attribution information for a transit agency, route, or trip.
public struct Attribution: Codable, FromCSVLine {
    /// The attribution ID.
    public let attributionId: String?
    /// The agency ID associated with the attribution.
    public let agencyId: String?
    /// The route ID associated with the attribution.
    public let routeId: String?
    /// The trip ID associated with the attribution.
    public let tripId: String?
    /// The name of the organization providing the attribution
    public let organizationName: String
    /// Indicates whether the organization is a producer
    public let isProducer: HasRole?
    /// Indicates whether the organization is an operator
    public let isOperator: HasRole?
    /// Indicates whether the organization is an authority
    public let isAuthority: HasRole?
    /// The URL for the attribution
    public let attributionUrl: String?
    /// The email address for attribution-related inquiries
    public let attributionEmail: String?
    /// The phone number for attribution-related inquiries
    public let attributionPhone: String?

    public init(line: CSVLine) {
        attributionId = line["attribution_id"]
        agencyId = line["agency_id"]
        routeId = line["route_id"]
        tripId = line["trip_id"]
        organizationName = line["organization_name"]!
        isProducer = HasRole.from(line["is_producer"])
        isOperator = HasRole.from(line["is_operator"])
        isAuthority = HasRole.from(line["is_authority"])
        attributionUrl = line["attribution_url"]
        attributionEmail = line["attribution_email"]
        attributionPhone = line["attribution_phone"]
    }
}

/// An enumeration indicating whether an organization has a specific role or not.
public enum HasRole: Int, Codable {
    /// Indicates that the organization does not have the specified role
    case organizationDoesNotHaveRole = 0
    /// Indicates that the organization has the specified role
    case organizationDoesHaveRole = 1

    static func from(_ string: String?) -> HasRole? {
        if let string = string {
            if let int = Int(string) {
                return HasRole(rawValue: int) ?? .organizationDoesNotHaveRole

            } else {
                return .organizationDoesNotHaveRole
            }

        } else {
            return .organizationDoesNotHaveRole
        }
    }
}

extension Double {
    static func from(_ string: String?) -> Double? {
        if let string = string {
            return Double(string)

        } else {
            return nil
        }
    }
}

extension Int {
    static func from(_ string: String?) -> Int? {
        if let string = string {
            return Int(string)

        } else {
            return nil
        }
    }
}

extension Float {
    static func from(_ string: String?) -> Float? {
        if let string = string {
            return Float(string)

        } else {
            return nil
        }
    }
}

protocol FromCSVLine {
    init(line: CSVLine)
}
