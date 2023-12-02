//
//  GTFS-Live.swift
//
//
//  Created by ARTEM on 21.11.2023.
//

import Foundation
import SwiftProtobuf

fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
    public struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
    typealias Version = _2
}

/// Represents the payload of a feed message.
/// In a continuous stream of feed messages, each message is received as a response to an appropriate HTTP GET request.
/// Realtime feeds are always defined in relation to an existing GTFS feed.
/// All entity IDs are resolved with respect to the corresponding GTFS feed.
/// It's important to note that in this context, "required" and "optional" refer to
/// Protocol Buffer cardinality, not semantic cardinality.
public struct GTFSRealtime_FeedMessage: SwiftProtobuf.ExtensibleMessage {
    
    /// Metadata about this feed and feed message.
    public var header: GTFSRealtime_FeedHeader {
        get {return _storage._header ?? GTFSRealtime_FeedHeader()}
        set {_uniqueStorage()._header = newValue}
    }
    /// Returns true if `header` has been explicitly set.
    public var hasHeader: Bool {return _storage._header != nil}
    /// Clears the value of `header`. Subsequent reads from it will return its default value.
    public mutating func clearHeader() {_uniqueStorage()._header = nil}
    
    /// Contents of the feed.
    public var entity: [GTFSRealtime_FeedEntity] {
        get {return _storage._entity}
        set {_uniqueStorage()._entity = newValue}
    }
    
    public var unknownFields = SwiftProtobuf.UnknownStorage()
    
    public init() {}
    
    ///Requirement in public protocol 'ExtensibleMessage'
    public var _protobuf_extensionFieldValues = SwiftProtobuf.ExtensionFieldValueSet()
    fileprivate var _storage = _StorageClass.defaultInstance
}

/// Metadata about a feed, included in feed messages.
public struct GTFSRealtime_FeedHeader: SwiftProtobuf.ExtensibleMessage {
    
    /// Version of the feed specification.
    /// The current version is 2.0.
    var gtfsRealtimeVersion: String {
        get {return _gtfsRealtimeVersion ?? String()}
        set {_gtfsRealtimeVersion = newValue}
    }
    /// Returns true if `gtfsRealtimeVersion` has been explicitly set.
    var hasGtfsRealtimeVersion: Bool {return self._gtfsRealtimeVersion != nil}
    /// Clears the value of `gtfsRealtimeVersion`. Subsequent reads from it will return its default value.
    mutating func clearGtfsRealtimeVersion() {self._gtfsRealtimeVersion = nil}
    
    var incrementality: GTFSRealtime_FeedHeader.Incrementality {
        get {return _incrementality ?? .fullDataset}
        set {_incrementality = newValue}
    }
    /// Returns true if `incrementality` has been explicitly set.
    var hasIncrementality: Bool {return self._incrementality != nil}
    /// Clears the value of `incrementality`. Subsequent reads from it will return its default value.
    mutating func clearIncrementality() {self._incrementality = nil}
    
    /// This timestamp identifies the moment when the content of this feed has been
    /// created (in server time). In POSIX time (i.e., number of seconds since
    /// January 1st 1970 00:00:00 UTC).
    public var timestamp: UInt64 {
        get {return _timestamp ?? 0}
        set {_timestamp = newValue}
    }
    /// Returns true if `timestamp` has been explicitly set.
    public var hasTimestamp: Bool {return self._timestamp != nil}
    /// Clears the value of `timestamp`. Subsequent reads from it will return its default value.
    mutating func clearTimestamp() {self._timestamp = nil}
    
    public var unknownFields = SwiftProtobuf.UnknownStorage()
    
    enum Incrementality: SwiftProtobuf.Enum {
        typealias RawValue = Int
        case fullDataset // = 0
        case differential // = 1
        
        init() {
            self = .fullDataset
        }
        
        init?(rawValue: Int) {
            switch rawValue {
            case 0: self = .fullDataset
            case 1: self = .differential
            default: return nil
            }
        }
        
        var rawValue: Int {
            switch self {
            case .fullDataset: return 0
            case .differential: return 1
            }
        }
        
    }
    
    public init() {}
    
    ///Requirement in public protocol 'ExtensibleMessage'
    public var _protobuf_extensionFieldValues = SwiftProtobuf.ExtensionFieldValueSet()
    fileprivate var _gtfsRealtimeVersion: String? = nil
    fileprivate var _incrementality: GTFSRealtime_FeedHeader.Incrementality? = nil
    fileprivate var _timestamp: UInt64? = nil
}

#if swift(>=4.2)

extension GTFSRealtime_FeedHeader.Incrementality: CaseIterable {}

#endif  // swift(>=4.2)

/// A definition (or update) of an entity in the transit feed.
public struct GTFSRealtime_FeedEntity: SwiftProtobuf.ExtensibleMessage{
    
    /// The IDs are exclusively used for incrementality support. Each ID should be
    /// unique within a FeedMessage. Subsequent FeedMessages might include
    /// FeedEntities with the same ID. In the case of a DIFFERENTIAL update, a new
    /// FeedEntity with a specific ID will replace the existing FeedEntity with the same ID
    /// (or delete it — refer to is_deleted below).
    /// The specific GTFS entities (e.g., stations, routes, trips) referenced by the
    /// feed must be explicitly specified using selectors (refer to EntitySelector below
    /// for more details).
    public var id: String {
        get {return _storage._id ?? String()}
        set {_uniqueStorage()._id = newValue}
    }
    /// Returns true if `id` has been explicitly set.
    public var hasID: Bool {return _storage._id != nil}
    /// Clears the value of `id`. Subsequent reads from it will return its default value.
    public mutating func clearID() {_uniqueStorage()._id = nil}
    
    /// Whether this entity is to be deleted. Relevant only for incremental fetches.
    public var isDeleted: Bool {
        get {return _storage._isDeleted ?? false}
        set {_uniqueStorage()._isDeleted = newValue}
    }
    /// Returns true if `isDeleted` has been explicitly set.
    public var hasIsDeleted: Bool {return _storage._isDeleted != nil}
    /// Clears the value of `isDeleted`. Subsequent reads from it will return its default value.
    public mutating func clearIsDeleted() {_uniqueStorage()._isDeleted = nil}
    
    /// Data about the entity itself. Exactly one of the following fields must be
    /// present (unless the entity is being deleted).
    public var tripUpdate: GTFSRealtime_TripUpdate {
        get {return _storage._tripUpdate ?? GTFSRealtime_TripUpdate()}
        set {_uniqueStorage()._tripUpdate = newValue}
    }
    /// Returns true if `tripUpdate` has been explicitly set.
    public var hasTripUpdate: Bool {return _storage._tripUpdate != nil}
    /// Clears the value of `tripUpdate`. Subsequent reads from it will return its default value.
    public mutating func clearTripUpdate() {_uniqueStorage()._tripUpdate = nil}
    
    /// Represents the vehicle position within the GTFS real-time feed message.
    /// Accessing this property provides the vehicle position information. If the
    /// information is not set, accessing it will return a default GTFSRealtime_VehiclePosition.
    /// Setting this property allows you to update the vehicle position within the feed message.
    public var vehicle: GTFSRealtime_VehiclePosition {
        get {return _storage._vehicle ?? GTFSRealtime_VehiclePosition()}
        set {_uniqueStorage()._vehicle = newValue}
    }
    /// Returns true if `vehicle` has been explicitly set.
    public var hasVehicle: Bool {return _storage._vehicle != nil}
    /// Clears the value of `vehicle`. Subsequent reads from it will return its default value.
    public mutating func clearVehicle() {_uniqueStorage()._vehicle = nil}
    
    public var alert: GTFSRealtime_Alert {
        get {return _storage._alert ?? GTFSRealtime_Alert()}
        set {_uniqueStorage()._alert = newValue}
    }
    /// Returns true if `alert` has been explicitly set.
    public var hasAlert: Bool {return _storage._alert != nil}
    /// Clears the value of `alert`. Subsequent reads from it will return its default value.
    public mutating func clearAlert() {_uniqueStorage()._alert = nil}
    
    public var unknownFields = SwiftProtobuf.UnknownStorage()
    
    public init() {}
    
    ///Requirement in public protocol 'ExtensibleMessage'
    public var _protobuf_extensionFieldValues = SwiftProtobuf.ExtensionFieldValueSet()
    fileprivate var _storage = _StorageClass.defaultInstance
}

/// Represents real-time updates on the progress of a vehicle along a trip within the GTFS feed.
/// The ScheduleRelationship property determines the nature of the trip update:
/// - A trip following the fixed schedule.
/// - A trip following a route but without a fixed schedule.
/// - A trip added or removed concerning the schedule.
///
/// Updates can pertain to future predicted arrival/departure events or past events.
/// Precision and certainty of updates should generally improve as events approach the current time.
/// Even for past events, the information should be precise and certain. If an update points to a past time
/// with non-zero uncertainty, it indicates a (incorrect) prediction, and the client should infer that the
/// trip has not completed.
///
/// Note: The update may describe a trip already completed. Providing an update for the last stop is sufficient,
/// and if the time is in the past, the client concludes the entire trip is in the past. While it's possible
/// to provide updates for preceding stops, it is not required. This scenario is relevant for a trip completed
/// ahead of schedule but still considered in progress according to the schedule. Purging past updates is allowed
/// but not required by the feed provider.
public struct GTFSRealtime_TripUpdate: SwiftProtobuf.ExtensibleMessage {
    
    /// The Trip that this message applies to. There can be at most one
    /// TripUpdate entity for each actual trip instance.
    /// If there is none, that means there is no prediction information available.
    /// It does *not* mean that the trip is progressing according to schedule.
    public var trip: GTFSRealtime_TripDescriptor {
        get {return _storage._trip ?? GTFSRealtime_TripDescriptor()}
        set {_uniqueStorage()._trip = newValue}
    }
    /// Returns true if `trip` has been explicitly set.
    var hasTrip: Bool {return _storage._trip != nil}
    /// Clears the value of `trip`. Subsequent reads from it will return its default value.
    mutating func clearTrip() {_uniqueStorage()._trip = nil}
    
    /// Additional information on the vehicle that is serving this trip.
    public var vehicle: GTFSRealtime_VehicleDescriptor {
        get {return _storage._vehicle ?? GTFSRealtime_VehicleDescriptor()}
        set {_uniqueStorage()._vehicle = newValue}
    }
    /// Returns true if `vehicle` has been explicitly set.
    public var hasVehicle: Bool {return _storage._vehicle != nil}
    /// Clears the value of `vehicle`. Subsequent reads from it will return its default value.
    mutating func clearVehicle() {_uniqueStorage()._vehicle = nil}
    
    /// Updates to StopTimes for the trip (both future, i.e., predictions, and in
    /// some cases, past ones, i.e., those that already happened).
    /// The updates must be sorted by stop_sequence, and apply for all the
    /// following stops of the trip up to the next specified one.
    ///
    public var stopTimeUpdate: [GTFSRealtime_TripUpdate.StopTimeUpdate] {
        get {return _storage._stopTimeUpdate}
        set {_uniqueStorage()._stopTimeUpdate = newValue}
    }
    
    /// Moment at which the vehicle's real-time progress was measured. In POSIX
    /// time (i.e., the number of seconds since January 1st 1970 00:00:00 UTC).
    public var timestamp: UInt64 {
        get {return _storage._timestamp ?? 0}
        set {_uniqueStorage()._timestamp = newValue}
    }
    /// Returns true if `timestamp` has been explicitly set.
    var hasTimestamp: Bool {return _storage._timestamp != nil}
    /// Clears the value of `timestamp`. Subsequent reads from it will return its default value.
    mutating func clearTimestamp() {_uniqueStorage()._timestamp = nil}
    
    /// Represents the current schedule deviation for the trip. Delay is specified when predicting relative to
    /// an existing GTFS schedule. The delay, in seconds, can be positive (indicating lateness), negative
    /// (indicating being ahead of schedule), or 0 (indicating being exactly on time).
    ///
    /// In StopTimeUpdates, delay information takes precedence over trip-level delay. Trip-level delay
    /// is only propagated until the next stop along the trip with a specified StopTimeUpdate delay.
    ///
    /// Feed providers are strongly advised to include a timestamp in TripUpdate indicating when the delay
    /// value was last updated. This helps assess the freshness of the data.
    public var delay: Int32 {
        get {return _storage._delay ?? 0}
        set {_uniqueStorage()._delay = newValue}
    }
    /// Returns true if `delay` has been explicitly set.
    var hasDelay: Bool {return _storage._delay != nil}
    /// Clears the value of `delay`. Subsequent reads from it will return its default value.
    mutating func clearDelay() {_uniqueStorage()._delay = nil}
    
    public var unknownFields = SwiftProtobuf.UnknownStorage()
    
    /// Represents timing information for a single predicted event, which can be either an arrival or departure.
    /// Timing includes delay, estimated time, and uncertainty:
    /// - Use delay when predicting relative to an existing GTFS schedule.
    /// - Specify time whether or not there's a predicted schedule. If both time and delay are provided, time
    ///   takes precedence (although time, for a scheduled trip, should normally equal scheduled time in GTFS + delay).
    ///
    /// Uncertainty applies equally to both time and delay. It roughly indicates the expected error in true delay,
    /// though its precise statistical meaning is not yet defined. Uncertainty can be 0, for example, for trains
    /// driven under computer timing control.
    public struct StopTimeEvent: SwiftProtobuf.ExtensibleMessage {
        
        /// Delay (in seconds) can be positive (meaning that the vehicle is late) or
        /// negative (meaning that the vehicle is ahead of schedule). Delay of 0
        /// means that the vehicle is exactly on time.
        var delay: Int32 {
            get {return _delay ?? 0}
            set {_delay = newValue}
        }
        /// Returns true if `delay` has been explicitly set.
        var hasDelay: Bool {return self._delay != nil}
        /// Clears the value of `delay`. Subsequent reads from it will return its default value.
        mutating func clearDelay() {self._delay = nil}
        
        /// Event as absolute time.
        /// In Unix time (i.e., number of seconds since January 1st 1970 00:00:00
        /// UTC).
        var time: Int64 {
            get {return _time ?? 0}
            set {_time = newValue}
        }
        /// Returns true if `time` has been explicitly set.
        var hasTime: Bool {return self._time != nil}
        /// Clears the value of `time`. Subsequent reads from it will return its default value.
        mutating func clearTime() {self._time = nil}
        
        /// If uncertainty is omitted, it is interpreted as unknown.
        /// If the prediction is unknown or too uncertain, the delay (or time) field
        /// should be empty. In such case, the uncertainty field is ignored.
        /// To specify a completely certain prediction, set its uncertainty to 0.
        var uncertainty: Int32 {
            get {return _uncertainty ?? 0}
            set {_uncertainty = newValue}
        }
        /// Returns true if `uncertainty` has been explicitly set.
        var hasUncertainty: Bool {return self._uncertainty != nil}
        /// Clears the value of `uncertainty`. Subsequent reads from it will return its default value.
        mutating func clearUncertainty() {self._uncertainty = nil}
        
        public var unknownFields = SwiftProtobuf.UnknownStorage()
        
        public init() {}
        
        public var _protobuf_extensionFieldValues = SwiftProtobuf.ExtensionFieldValueSet()
        fileprivate var _delay: Int32? = nil
        fileprivate var _time: Int64? = nil
        fileprivate var _uncertainty: Int32? = nil
    }
    
    /// Represents a realtime update for arrival and/or departure events at a specific stop along a trip.
    /// Updates can be provided for both past and future events. The producer has the option, though not a
    /// requirement, to omit past events.
    public struct StopTimeUpdate: SwiftProtobuf.ExtensibleMessage {
        
        /// Must be the same as in stop_times.txt in the corresponding GTFS feed.
        var stopSequence: UInt32 {
            get {return _storage._stopSequence ?? 0}
            set {_uniqueStorage()._stopSequence = newValue}
        }
        /// Returns true if `stopSequence` has been explicitly set.
        var hasStopSequence: Bool {return _storage._stopSequence != nil}
        /// Clears the value of `stopSequence`. Subsequent reads from it will return its default value.
        mutating func clearStopSequence() {_uniqueStorage()._stopSequence = nil}
        
        /// Must be the same as in stops.txt in the corresponding GTFS feed.
        public var stopID: String {
            get {return _storage._stopID ?? String()}
            set {_uniqueStorage()._stopID = newValue}
        }
        /// Returns true if `stopID` has been explicitly set.
        var hasStopID: Bool {return _storage._stopID != nil}
        /// Clears the value of `stopID`. Subsequent reads from it will return its default value.
        mutating func clearStopID() {_uniqueStorage()._stopID = nil}
        
        /// Represents the arrival information for a specific stop along a trip within a TripUpdate.
        /// This property provides details such as the predicted arrival time, delay, and uncertainty.
        /// If the information is not available, the default GTFSRealtime_TripUpdate.StopTimeEvent is used.
        public var arrival: GTFSRealtime_TripUpdate.StopTimeEvent {
            get {return _storage._arrival ?? GTFSRealtime_TripUpdate.StopTimeEvent()}
            set {_uniqueStorage()._arrival = newValue}
        }
        /// Returns true if `arrival` has been explicitly set.
        var hasArrival: Bool {return _storage._arrival != nil}
        /// Clears the value of `arrival`. Subsequent reads from it will return its default value.
        mutating func clearArrival() {_uniqueStorage()._arrival = nil}
        
        public var departure: GTFSRealtime_TripUpdate.StopTimeEvent {
            get {return _storage._departure ?? GTFSRealtime_TripUpdate.StopTimeEvent()}
            set {_uniqueStorage()._departure = newValue}
        }
        /// Returns true if `departure` has been explicitly set.
        var hasDeparture: Bool {return _storage._departure != nil}
        /// Clears the value of `departure`. Subsequent reads from it will return its default value.
        mutating func clearDeparture() {_uniqueStorage()._departure = nil}
        
        var scheduleRelationship: GTFSRealtime_TripUpdate.StopTimeUpdate.ScheduleRelationship {
            get {return _storage._scheduleRelationship ?? .scheduled}
            set {_uniqueStorage()._scheduleRelationship = newValue}
        }
        /// Returns true if `scheduleRelationship` has been explicitly set.
        var hasScheduleRelationship: Bool {return _storage._scheduleRelationship != nil}
        /// Clears the value of `scheduleRelationship`. Subsequent reads from it will return its default value.
        mutating func clearScheduleRelationship() {_uniqueStorage()._scheduleRelationship = nil}
        
        public var unknownFields = SwiftProtobuf.UnknownStorage()
        
        /// The relation between this StopTime and the static schedule.
        enum ScheduleRelationship: SwiftProtobuf.Enum {
            typealias RawValue = Int
            
            /// The vehicle is proceeding in accordance with its static schedule of
            /// stops, although not necessarily according to the times of the schedule.
            case scheduled
            
            /// The stop is skipped, i.e., the vehicle will not stop at this stop.
            /// Arrival and departure are optional.
            case skipped
            
            /// No data is given for this stop.
            case noData
            
            init() {
                self = .scheduled
            }
            
            init?(rawValue: Int) {
                switch rawValue {
                case 0: self = .scheduled
                case 1: self = .skipped
                case 2: self = .noData
                default: return nil
                }
            }
            
            var rawValue: Int {
                switch self {
                case .scheduled: return 0
                case .skipped: return 1
                case .noData: return 2
                }
            }
            
        }
        
        public init() {}
        
        public var _protobuf_extensionFieldValues = SwiftProtobuf.ExtensionFieldValueSet()
        fileprivate var _storage = _StorageClass.defaultInstance
    }
    
    public init() {}
    
    public var _protobuf_extensionFieldValues = SwiftProtobuf.ExtensionFieldValueSet()
    fileprivate var _storage = _StorageClass.defaultInstance
}

/// Realtime positioning information for a given vehicle.
public struct GTFSRealtime_VehiclePosition: SwiftProtobuf.ExtensibleMessage {
    
    /// The Trip that this vehicle is serving.
    /// Can be empty or partial if the vehicle can not be identified with a given
    /// trip instance.
    public var trip: GTFSRealtime_TripDescriptor {
        get {return _storage._trip ?? GTFSRealtime_TripDescriptor()}
        set {_uniqueStorage()._trip = newValue}
    }
    /// Returns true if `trip` has been explicitly set.
    public var hasTrip: Bool {return _storage._trip != nil}
    /// Clears the value of `trip`. Subsequent reads from it will return its default value.
    mutating func clearTrip() {_uniqueStorage()._trip = nil}
    
    /// Additional information on the vehicle that is serving this trip.
    public var vehicle: GTFSRealtime_VehicleDescriptor {
        get {return _storage._vehicle ?? GTFSRealtime_VehicleDescriptor()}
        set {_uniqueStorage()._vehicle = newValue}
    }
    /// Returns true if `vehicle` has been explicitly set.
    var hasVehicle: Bool {return _storage._vehicle != nil}
    /// Clears the value of `vehicle`. Subsequent reads from it will return its default value.
    mutating func clearVehicle() {_uniqueStorage()._vehicle = nil}
    
    /// Current position of this vehicle.
    public var position: GTFSRealtime_Position {
        get {return _storage._position ?? GTFSRealtime_Position()}
        set {_uniqueStorage()._position = newValue}
    }
    /// Returns true if `position` has been explicitly set.
    public var hasPosition: Bool {return _storage._position != nil}
    /// Clears the value of `position`. Subsequent reads from it will return its default value.
    mutating func clearPosition() {_uniqueStorage()._position = nil}
    
    /// The stop sequence index of the current stop.
    public var currentStopSequence: UInt32 {
        get {return _storage._currentStopSequence ?? 0}
        set {_uniqueStorage()._currentStopSequence = newValue}
    }
    /// Returns true if `currentStopSequence` has been explicitly set.
    var hasCurrentStopSequence: Bool {return _storage._currentStopSequence != nil}
    /// Clears the value of `currentStopSequence`. Subsequent reads from it will return its default value.
    mutating func clearCurrentStopSequence() {_uniqueStorage()._currentStopSequence = nil}
    
    /// Identifies the current stop. The value must be the same as in stops.txt in
    /// the corresponding GTFS feed.
    public var stopID: String {
        get {return _storage._stopID ?? String()}
        set {_uniqueStorage()._stopID = newValue}
    }
    /// Returns true if `stopID` has been explicitly set.
    public var hasStopID: Bool {return _storage._stopID != nil}
    /// Clears the value of `stopID`. Subsequent reads from it will return its default value.
    mutating func clearStopID() {_uniqueStorage()._stopID = nil}
    
    /// The exact status of the vehicle with respect to the current stop.
    /// Ignored if current_stop_sequence is missing.
    var currentStatus: GTFSRealtime_VehiclePosition.VehicleStopStatus {
        get {return _storage._currentStatus ?? .inTransitTo}
        set {_uniqueStorage()._currentStatus = newValue}
    }
    /// Returns true if `currentStatus` has been explicitly set.
    var hasCurrentStatus: Bool {return _storage._currentStatus != nil}
    /// Clears the value of `currentStatus`. Subsequent reads from it will return its default value.
    mutating func clearCurrentStatus() {_uniqueStorage()._currentStatus = nil}
    
    /// Moment at which the vehicle's position was measured. In POSIX time
    /// (i.e., number of seconds since January 1st 1970 00:00:00 UTC).
    var timestamp: UInt64 {
        get {return _storage._timestamp ?? 0}
        set {_uniqueStorage()._timestamp = newValue}
    }
    /// Returns true if `timestamp` has been explicitly set.
    var hasTimestamp: Bool {return _storage._timestamp != nil}
    /// Clears the value of `timestamp`. Subsequent reads from it will return its default value.
    mutating func clearTimestamp() {_uniqueStorage()._timestamp = nil}
    
    var congestionLevel: GTFSRealtime_VehiclePosition.CongestionLevel {
        get {return _storage._congestionLevel ?? .unknownCongestionLevel}
        set {_uniqueStorage()._congestionLevel = newValue}
    }
    /// Returns true if `congestionLevel` has been explicitly set.
    var hasCongestionLevel: Bool {return _storage._congestionLevel != nil}
    /// Clears the value of `congestionLevel`. Subsequent reads from it will return its default value.
    mutating func clearCongestionLevel() {_uniqueStorage()._congestionLevel = nil}
    
    var occupancyStatus: GTFSRealtime_VehiclePosition.OccupancyStatus {
        get {return _storage._occupancyStatus ?? .empty}
        set {_uniqueStorage()._occupancyStatus = newValue}
    }
    /// Returns true if `occupancyStatus` has been explicitly set.
    var hasOccupancyStatus: Bool {return _storage._occupancyStatus != nil}
    /// Clears the value of `occupancyStatus`. Subsequent reads from it will return its default value.
    mutating func clearOccupancyStatus() {_uniqueStorage()._occupancyStatus = nil}
    
    
    public var unknownFields = SwiftProtobuf.UnknownStorage()
    
    enum VehicleStopStatus: SwiftProtobuf.Enum {
        typealias RawValue = Int
        
        /// The vehicle is just about to arrive at the stop (on a stop
        /// display, the vehicle symbol typically flashes).
        case incomingAt
        
        /// The vehicle is standing at the stop.
        case stoppedAt
        
        /// The vehicle has departed and is in transit to the next stop.
        case inTransitTo
        
        init() {
            self = .incomingAt
        }
        
        init?(rawValue: Int) {
            switch rawValue {
            case 0: self = .incomingAt
            case 1: self = .stoppedAt
            case 2: self = .inTransitTo
            default: return nil
            }
        }
        
        var rawValue: Int {
            switch self {
            case .incomingAt: return 0
            case .stoppedAt: return 1
            case .inTransitTo: return 2
            }
        }
        
    }
    
    /// Congestion level that is affecting this vehicle.
    enum CongestionLevel: SwiftProtobuf.Enum {
        typealias RawValue = Int
        case unknownCongestionLevel // = 0
        case runningSmoothly // = 1
        case stopAndGo // = 2
        case congestion // = 3
        
        /// People leaving their cars.
        case severeCongestion // = 4
        
        init() {
            self = .unknownCongestionLevel
        }
        
        init?(rawValue: Int) {
            switch rawValue {
            case 0: self = .unknownCongestionLevel
            case 1: self = .runningSmoothly
            case 2: self = .stopAndGo
            case 3: self = .congestion
            case 4: self = .severeCongestion
            default: return nil
            }
        }
        
        var rawValue: Int {
            switch self {
            case .unknownCongestionLevel: return 0
            case .runningSmoothly: return 1
            case .stopAndGo: return 2
            case .congestion: return 3
            case .severeCongestion: return 4
            }
        }
        
    }
    
    /// The degree of passenger occupancy of the vehicle. This field is still
    /// experimental, and subject to change. It may be formally adopted in the
    /// future.
    enum OccupancyStatus: SwiftProtobuf.Enum {
        typealias RawValue = Int
        
        case empty
        
        case manySeatsAvailable

        case fewSeatsAvailable

        case standingRoomOnly
        
        case crushedStandingRoomOnly
        
        case full
        
        case notAcceptingPassengers
        
        init() {
            self = .empty
        }
        
        init?(rawValue: Int) {
            switch rawValue {
            case 0: self = .empty
            case 1: self = .manySeatsAvailable
            case 2: self = .fewSeatsAvailable
            case 3: self = .standingRoomOnly
            case 4: self = .crushedStandingRoomOnly
            case 5: self = .full
            case 6: self = .notAcceptingPassengers
            default: return nil
            }
        }
        
        var rawValue: Int {
            switch self {
            case .empty: return 0
            case .manySeatsAvailable: return 1
            case .fewSeatsAvailable: return 2
            case .standingRoomOnly: return 3
            case .crushedStandingRoomOnly: return 4
            case .full: return 5
            case .notAcceptingPassengers: return 6
            }
        }
        
    }
    
    public init() {}
    
    public var _protobuf_extensionFieldValues = SwiftProtobuf.ExtensionFieldValueSet()
    fileprivate var _storage = _StorageClass.defaultInstance
}

#if swift(>=4.2)

extension GTFSRealtime_VehiclePosition.VehicleStopStatus: CaseIterable {}

extension GTFSRealtime_VehiclePosition.CongestionLevel: CaseIterable {}

extension GTFSRealtime_VehiclePosition.OccupancyStatus: CaseIterable {}

#endif

/// An alert, indicating some sort of incident in the public transit network.
public struct GTFSRealtime_Alert: SwiftProtobuf.ExtensibleMessage {
    
    /// Time when the alert should be shown to the user. If missing, the
    /// alert will be shown as long as it appears in the feed.
    /// If multiple ranges are given, the alert will be shown during all of them.
    var activePeriod: [GTFSRealtime_TimeRange] {
        get {return _storage._activePeriod}
        set {_uniqueStorage()._activePeriod = newValue}
    }
    
    /// Entities whose users we should notify of this alert.
    var informedEntity: [TransitRealtime_EntitySelector] {
        get {return _storage._informedEntity}
        set {_uniqueStorage()._informedEntity = newValue}
    }
    
    var cause: GTFSRealtime_Alert.Cause {
        get {return _storage._cause ?? .unknownCause}
        set {_uniqueStorage()._cause = newValue}
    }
    /// Returns true if `cause` has been explicitly set.
    var hasCause: Bool {return _storage._cause != nil}
    /// Clears the value of `cause`. Subsequent reads from it will return its default value.
    mutating func clearCause() {_uniqueStorage()._cause = nil}
    
    var effect: GTFSRealtime_Alert.Effect {
        get {return _storage._effect ?? .unknownEffect}
        set {_uniqueStorage()._effect = newValue}
    }
    /// Returns true if `effect` has been explicitly set.
    var hasEffect: Bool {return _storage._effect != nil}
    /// Clears the value of `effect`. Subsequent reads from it will return its default value.
    mutating func clearEffect() {_uniqueStorage()._effect = nil}
    
    /// The URL which provides additional information about the alert.
    var url: GTFSRealtime_TranslatedString {
        get {return _storage._url ?? GTFSRealtime_TranslatedString()}
        set {_uniqueStorage()._url = newValue}
    }
    /// Returns true if `url` has been explicitly set.
    var hasURL: Bool {return _storage._url != nil}
    /// Clears the value of `url`. Subsequent reads from it will return its default value.
    mutating func clearURL() {_uniqueStorage()._url = nil}
    
    /// Alert header. Contains a short summary of the alert text as plain-text.
    var headerText: GTFSRealtime_TranslatedString {
        get {return _storage._headerText ?? GTFSRealtime_TranslatedString()}
        set {_uniqueStorage()._headerText = newValue}
    }
    /// Returns true if `headerText` has been explicitly set.
    var hasHeaderText: Bool {return _storage._headerText != nil}
    /// Clears the value of `headerText`. Subsequent reads from it will return its default value.
    mutating func clearHeaderText() {_uniqueStorage()._headerText = nil}
    
    /// Full description for the alert as plain-text. The information in the
    /// description should add to the information of the header.
    var descriptionText: GTFSRealtime_TranslatedString {
        get {return _storage._descriptionText ?? GTFSRealtime_TranslatedString()}
        set {_uniqueStorage()._descriptionText = newValue}
    }
    /// Returns true if `descriptionText` has been explicitly set.
    var hasDescriptionText: Bool {return _storage._descriptionText != nil}
    /// Clears the value of `descriptionText`. Subsequent reads from it will return its default value.
    mutating func clearDescriptionText() {_uniqueStorage()._descriptionText = nil}
    
    public var unknownFields = SwiftProtobuf.UnknownStorage()
    
    /// Cause of this alert.
    enum Cause: SwiftProtobuf.Enum {
        typealias RawValue = Int
        case unknownCause
        case otherCause
        case technicalProblem
        case strike
        case demonstration
        case accident
        case holiday
        case weather
        case maintenance
        case construction
        case policeActivity
        case medicalEmergency
        
        init() {
            self = .unknownCause
        }
        
        init?(rawValue: Int) {
            switch rawValue {
            case 1: self = .unknownCause
            case 2: self = .otherCause
            case 3: self = .technicalProblem
            case 4: self = .strike
            case 5: self = .demonstration
            case 6: self = .accident
            case 7: self = .holiday
            case 8: self = .weather
            case 9: self = .maintenance
            case 10: self = .construction
            case 11: self = .policeActivity
            case 12: self = .medicalEmergency
            default: return nil
            }
        }
        
        var rawValue: Int {
            switch self {
            case .unknownCause: return 1
            case .otherCause: return 2
            case .technicalProblem: return 3
            case .strike: return 4
            case .demonstration: return 5
            case .accident: return 6
            case .holiday: return 7
            case .weather: return 8
            case .maintenance: return 9
            case .construction: return 10
            case .policeActivity: return 11
            case .medicalEmergency: return 12
            }
        }
        
    }
    
    /// What is the effect of this problem on the affected entity.
    enum Effect: SwiftProtobuf.Enum {
        typealias RawValue = Int
        case noService
        case reducedService
        case significantDelays
        case detour
        case additionalService
        case modifiedService
        case otherEffect
        case unknownEffect
        case stopMoved
        
        init() {
            self = .noService
        }
        
        init?(rawValue: Int) {
            switch rawValue {
            case 1: self = .noService
            case 2: self = .reducedService
            case 3: self = .significantDelays
            case 4: self = .detour
            case 5: self = .additionalService
            case 6: self = .modifiedService
            case 7: self = .otherEffect
            case 8: self = .unknownEffect
            case 9: self = .stopMoved
            default: return nil
            }
        }
        
        var rawValue: Int {
            switch self {
            case .noService: return 1
            case .reducedService: return 2
            case .significantDelays: return 3
            case .detour: return 4
            case .additionalService: return 5
            case .modifiedService: return 6
            case .otherEffect: return 7
            case .unknownEffect: return 8
            case .stopMoved: return 9
            }
        }
        
    }
    
    public init() {}
    
    public var _protobuf_extensionFieldValues = SwiftProtobuf.ExtensionFieldValueSet()
    fileprivate var _storage = _StorageClass.defaultInstance
}

#if swift(>=4.2)

extension GTFSRealtime_Alert.Cause: CaseIterable {}

extension GTFSRealtime_Alert.Effect: CaseIterable {}

#endif

/// A time interval. The interval is considered active at time 't' if 't' is
/// greater than or equal to the start time and less than the end time.
public struct GTFSRealtime_TimeRange: SwiftProtobuf.ExtensibleMessage {
    
    /// Start time, in POSIX time (i.e., number of seconds since January 1st 1970
    /// 00:00:00 UTC).
    /// If missing, the interval starts at minus infinity.
    var start: UInt64 {
        get {return _start ?? 0}
        set {_start = newValue}
    }
    /// Returns true if `start` has been explicitly set.
    var hasStart: Bool {return self._start != nil}
    
    /// Clears the value of `start`. Subsequent reads from it will return its default value.
    mutating func clearStart() {self._start = nil}
    
    /// End time, in POSIX time (i.e., number of seconds since January 1st 1970
    /// 00:00:00 UTC).
    /// If missing, the interval ends at plus infinity.
    var end: UInt64 {
        get {return _end ?? 0}
        set {_end = newValue}
    }
    /// Returns true if `end` has been explicitly set.
    var hasEnd: Bool {return self._end != nil}
    /// Clears the value of `end`. Subsequent reads from it will return its default value.
    mutating func clearEnd() {self._end = nil}
    
    public var unknownFields = SwiftProtobuf.UnknownStorage()
    
    public init() {}
    
    public var _protobuf_extensionFieldValues = SwiftProtobuf.ExtensionFieldValueSet()
    fileprivate var _start: UInt64? = nil
    fileprivate var _end: UInt64? = nil
}

/// A position.
public struct GTFSRealtime_Position: SwiftProtobuf.ExtensibleMessage {
    
    /// Degrees North, in the WGS-84 coordinate system.
    public var latitude: Float {
        get {return _latitude ?? 0}
        set {_latitude = newValue}
    }
    /// Returns true if `latitude` has been explicitly set.
    var hasLatitude: Bool {return self._latitude != nil}
    /// Clears the value of `latitude`. Subsequent reads from it will return its default value.
    mutating func clearLatitude() {self._latitude = nil}
    
    /// Degrees East, in the WGS-84 coordinate system.
    public var longitude: Float {
        get {return _longitude ?? 0}
        set {_longitude = newValue}
    }
    /// Returns true if `longitude` has been explicitly set.
    var hasLongitude: Bool {return self._longitude != nil}
    /// Clears the value of `longitude`. Subsequent reads from it will return its default value.
    mutating func clearLongitude() {self._longitude = nil}
    
    /// Bearing, in degrees, clockwise from North, i.e., 0 is North and 90 is East.
    /// This can be the compass bearing, or the direction towards the next stop
    /// or intermediate location.
    var bearing: Float {
        get {return _bearing ?? 0}
        set {_bearing = newValue}
    }
    /// Returns true if `bearing` has been explicitly set.
    var hasBearing: Bool {return self._bearing != nil}
    /// Clears the value of `bearing`. Subsequent reads from it will return its default value.
    mutating func clearBearing() {self._bearing = nil}
    
    /// Odometer value, in meters.
    public var odometer: Double {
        get {return _odometer ?? 0}
        set {_odometer = newValue}
    }
    /// Returns true if `odometer` has been explicitly set.
    var hasOdometer: Bool {return self._odometer != nil}
    /// Clears the value of `odometer`. Subsequent reads from it will return its default value.
    mutating func clearOdometer() {self._odometer = nil}
    
    /// Momentary speed measured by the vehicle, in meters per second.
    public var speed: Float {
        get {return _speed ?? 0}
        set {_speed = newValue}
    }
    /// Returns true if `speed` has been explicitly set.
    var hasSpeed: Bool {return self._speed != nil}
    /// Clears the value of `speed`. Subsequent reads from it will return its default value.
    mutating func clearSpeed() {self._speed = nil}
    
    public var unknownFields = SwiftProtobuf.UnknownStorage()
    
    public init() {}
    
    public var _protobuf_extensionFieldValues = SwiftProtobuf.ExtensionFieldValueSet()
    fileprivate var _latitude: Float? = nil
    fileprivate var _longitude: Float? = nil
    fileprivate var _bearing: Float? = nil
    fileprivate var _odometer: Double? = nil
    fileprivate var _speed: Float? = nil
}


/// Identifies a GTFS trip instance or all instances of a trip along a route.
///
/// - For a single trip instance, set the `trip_id` (and optionally, `start_time`).
///   If the `route_id` is provided, it should match the route corresponding to the trip.
///
/// - To represent all trips along a route, set only the `route_id`. If `trip_id`
///   is unknown, include stop sequence ids and stop ids in TripUpdate, along with
///   absolute arrival/departure times.
public struct GTFSRealtime_TripDescriptor: SwiftProtobuf.ExtensibleMessage {
    /// The trip_id from the GTFS feed that this selector refers to.
    public var tripID: String {
        get {return _tripID ?? String()}
        set {_tripID = newValue}
    }
    /// Returns true if `tripID` has been explicitly set.
    var hasTripID: Bool {return self._tripID != nil}
    /// Clears the value of `tripID`. Subsequent reads from it will return its default value.
    mutating func clearTripID() {self._tripID = nil}
    
    /// The route_id from the GTFS that this selector refers to.
    public var routeID: String {
        get {return _routeID ?? String()}
        set {_routeID = newValue}
    }
    /// Returns true if `routeID` has been explicitly set.
    var hasRouteID: Bool {return self._routeID != nil}
    /// Clears the value of `routeID`. Subsequent reads from it will return its default value.
    mutating func clearRouteID() {self._routeID = nil}
    
    /// The direction_id from the GTFS feed trips.txt file, indicating the
    /// direction of travel for trips this selector refers to. This field is
    /// still experimental, and subject to change. It may be formally adopted in
    /// the future.
    public var directionID: UInt32 {
        get {return _directionID ?? 0}
        set {_directionID = newValue}
    }
    /// Returns true if `directionID` has been explicitly set.
    var hasDirectionID: Bool {return self._directionID != nil}
    /// Clears the value of `directionID`. Subsequent reads from it will return its default value.
    mutating func clearDirectionID() {self._directionID = nil}
    
    /// The initially scheduled start time of this trip instance.
    public var startTime: String {
        get {return _startTime ?? String()}
        set {_startTime = newValue}
    }
    /// Returns true if `startTime` has been explicitly set.
    var hasStartTime: Bool {return self._startTime != nil}
    /// Clears the value of `startTime`. Subsequent reads from it will return its default value.
    mutating func clearStartTime() {self._startTime = nil}
    
    /// The scheduled start date of this trip instance.
    var startDate: String {
        get {return _startDate ?? String()}
        set {_startDate = newValue}
    }
    /// Returns true if `startDate` has been explicitly set.
    var hasStartDate: Bool {return self._startDate != nil}
    /// Clears the value of `startDate`. Subsequent reads from it will return its default value.
    mutating func clearStartDate() {self._startDate = nil}
    
    var scheduleRelationship: GTFSRealtime_TripDescriptor.ScheduleRelationship {
        get {return _scheduleRelationship ?? .scheduled}
        set {_scheduleRelationship = newValue}
    }
    /// Returns true if `scheduleRelationship` has been explicitly set.
    var hasScheduleRelationship: Bool {return self._scheduleRelationship != nil}
    /// Clears the value of `scheduleRelationship`. Subsequent reads from it will return its default value.
    mutating func clearScheduleRelationship() {self._scheduleRelationship = nil}
    
    public var unknownFields = SwiftProtobuf.UnknownStorage()
    
    /// The relation between this trip and the static schedule. If a trip is done
    /// in accordance with temporary schedule, not reflected in GTFS, then it
    /// shouldn't be marked as SCHEDULED, but likely as ADDED.
    enum ScheduleRelationship: SwiftProtobuf.Enum {
        typealias RawValue = Int
    
        case scheduled
        case added
        case unscheduled
        case canceled
        
        init() {
            self = .scheduled
        }
        
        init?(rawValue: Int) {
            switch rawValue {
            case 0: self = .scheduled
            case 1: self = .added
            case 2: self = .unscheduled
            case 3: self = .canceled
            default: return nil
            }
        }
        
        var rawValue: Int {
            switch self {
            case .scheduled: return 0
            case .added: return 1
            case .unscheduled: return 2
            case .canceled: return 3
            }
        }
        
    }
    
    public init() {}
    
    public var _protobuf_extensionFieldValues = SwiftProtobuf.ExtensionFieldValueSet()
    fileprivate var _tripID: String? = nil
    fileprivate var _routeID: String? = nil
    fileprivate var _directionID: UInt32? = nil
    fileprivate var _startTime: String? = nil
    fileprivate var _startDate: String? = nil
    fileprivate var _scheduleRelationship: GTFSRealtime_TripDescriptor.ScheduleRelationship? = nil
}

#if swift(>=4.2)

extension GTFSRealtime_TripDescriptor.ScheduleRelationship: CaseIterable {}

#endif

/// Identification information for the vehicle performing the trip.
public struct GTFSRealtime_VehicleDescriptor: SwiftProtobuf.ExtensibleMessage {
    
    /// Internal system identification of the vehicle. Should be unique per
    /// vehicle, and can be used for tracking the vehicle as it proceeds through
    /// the system.
    public var id: String {
        get {return _id ?? String()}
        set {_id = newValue}
    }
    /// Returns true if `id` has been explicitly set.
    var hasID: Bool {return self._id != nil}
    /// Clears the value of `id`. Subsequent reads from it will return its default value.
    mutating func clearID() {self._id = nil}
    
    /// User visible label, i.e., something that must be shown to the passenger to
    /// help identify the correct vehicle.
    public var label: String {
        get {return _label ?? String()}
        set {_label = newValue}
    }
    /// Returns true if `label` has been explicitly set.
    var hasLabel: Bool {return self._label != nil}
    /// Clears the value of `label`. Subsequent reads from it will return its default value.
    mutating func clearLabel() {self._label = nil}
    
    /// The license plate of the vehicle.
    public var licensePlate: String {
        get {return _licensePlate ?? String()}
        set {_licensePlate = newValue}
    }
    /// Returns true if `licensePlate` has been explicitly set.
    var hasLicensePlate: Bool {return self._licensePlate != nil}
    /// Clears the value of `licensePlate`. Subsequent reads from it will return its default value.
    mutating func clearLicensePlate() {self._licensePlate = nil}
    
    public var unknownFields = SwiftProtobuf.UnknownStorage()
    
    public init() {}
    
    public var _protobuf_extensionFieldValues = SwiftProtobuf.ExtensionFieldValueSet()
    fileprivate var _id: String? = nil
    fileprivate var _label: String? = nil
    fileprivate var _licensePlate: String? = nil
}

/// A selector for an entity in a GTFS feed.
public struct TransitRealtime_EntitySelector: SwiftProtobuf.ExtensibleMessage {
    
    /// The values of the fields should correspond to the appropriate fields in the
    /// GTFS feed.
    /// At least one specifier must be given. If several are given, then the
    /// matching has to apply to all the given specifiers.
    public var agencyID: String {
        get {return _storage._agencyID ?? String()}
        set {_uniqueStorage()._agencyID = newValue}
    }
    /// Returns true if `agencyID` has been explicitly set.
    var hasAgencyID: Bool {return _storage._agencyID != nil}
    /// Clears the value of `agencyID`. Subsequent reads from it will return its default value.
    mutating func clearAgencyID() {_uniqueStorage()._agencyID = nil}
    
    public var routeID: String {
        get {return _storage._routeID ?? String()}
        set {_uniqueStorage()._routeID = newValue}
    }
    /// Returns true if `routeID` has been explicitly set.
    var hasRouteID: Bool {return _storage._routeID != nil}
    /// Clears the value of `routeID`. Subsequent reads from it will return its default value.
    mutating func clearRouteID() {_uniqueStorage()._routeID = nil}
    
    /// corresponds to route_type in GTFS.
    public var routeType: Int32 {
        get {return _storage._routeType ?? 0}
        set {_uniqueStorage()._routeType = newValue}
    }
    /// Returns true if `routeType` has been explicitly set.
    var hasRouteType: Bool {return _storage._routeType != nil}
    /// Clears the value of `routeType`. Subsequent reads from it will return its default value.
    mutating func clearRouteType() {_uniqueStorage()._routeType = nil}
    
    public var trip: GTFSRealtime_TripDescriptor {
        get {return _storage._trip ?? GTFSRealtime_TripDescriptor()}
        set {_uniqueStorage()._trip = newValue}
    }
    /// Returns true if `trip` has been explicitly set.
    var hasTrip: Bool {return _storage._trip != nil}
    /// Clears the value of `trip`. Subsequent reads from it will return its default value.
    mutating func clearTrip() {_uniqueStorage()._trip = nil}
    
    public var stopID: String {
        get {return _storage._stopID ?? String()}
        set {_uniqueStorage()._stopID = newValue}
    }
    /// Returns true if `stopID` has been explicitly set.
    var hasStopID: Bool {return _storage._stopID != nil}
    /// Clears the value of `stopID`. Subsequent reads from it will return its default value.
    mutating func clearStopID() {_uniqueStorage()._stopID = nil}
    
    public var unknownFields = SwiftProtobuf.UnknownStorage()
    
    public init() {}
    
    public var _protobuf_extensionFieldValues = SwiftProtobuf.ExtensionFieldValueSet()
    fileprivate var _storage = _StorageClass.defaultInstance
}



/// Represents an internationalized message with per-language versions of text or a URL snippet.
/// The selection of the appropriate version follows these rules:
/// 1. If the UI language matches the language code of a translation, the first matching translation is selected.
/// 2. If a default UI language (e.g., English) matches the language code of a translation, the first matching translation is selected.
/// 3. If some translation has an unspecified language code, that translation is selected.
public struct GTFSRealtime_TranslatedString: SwiftProtobuf.ExtensibleMessage {
    
    /// At least one translation must be provided.
    var translation: [GTFSRealtime_TranslatedString.Translation] = []
    
    public var unknownFields = SwiftProtobuf.UnknownStorage()
    
    public struct Translation: SwiftProtobuf.ExtensibleMessage {
        
        /// A UTF-8 string containing the message.
        var text: String {
            get {return _text ?? String()}
            set {_text = newValue}
        }
        /// Returns true if `text` has been explicitly set.
        var hasText: Bool {return self._text != nil}
        /// Clears the value of `text`. Subsequent reads from it will return its default value.
        mutating func clearText() {self._text = nil}
        
        /// BCP-47 language code. Can be omitted if the language is unknown or if
        /// no i18n is done at all for the feed. At most one translation is
        /// allowed to have an unspecified language tag.
        var language: String {
            get {return _language ?? String()}
            set {_language = newValue}
        }
        /// Returns true if `language` has been explicitly set.
        var hasLanguage: Bool {return self._language != nil}
        /// Clears the value of `language`. Subsequent reads from it will return its default value.
        mutating func clearLanguage() {self._language = nil}
        
        public var unknownFields = SwiftProtobuf.UnknownStorage()
        
        public init() {}
        
        public var _protobuf_extensionFieldValues = SwiftProtobuf.ExtensionFieldValueSet()
        fileprivate var _text: String? = nil
        fileprivate var _language: String? = nil
    }
    
    public init() {}
    
    public var _protobuf_extensionFieldValues = SwiftProtobuf.ExtensionFieldValueSet()
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "transit_realtime"

extension GTFSRealtime_FeedMessage: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
    public static let protoMessageName: String = _protobuf_package + ".FeedMessage"
    public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
        1: .same(proto: "header"),
        2: .same(proto: "entity"),
    ]
    
    fileprivate class _StorageClass {
        var _header: GTFSRealtime_FeedHeader? = nil
        var _entity: [GTFSRealtime_FeedEntity] = []
        
        static let defaultInstance = _StorageClass()
        
        private init() {}
        
        init(copying source: _StorageClass) {
            _header = source._header
            _entity = source._entity
        }
    }
    
    fileprivate mutating func _uniqueStorage() -> _StorageClass {
        if !isKnownUniquelyReferenced(&_storage) {
            _storage = _StorageClass(copying: _storage)
        }
        return _storage
    }
    
    public var isInitialized: Bool {
        if !_protobuf_extensionFieldValues.isInitialized {return false}
        return withExtendedLifetime(_storage) { (_storage: _StorageClass) in
            if _storage._header == nil {return false}
            if let v = _storage._header, !v.isInitialized {return false}
            if !SwiftProtobuf.Internal.areAllInitialized(_storage._entity) {return false}
            return true
        }
    }
    
    mutating public func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
        _ = _uniqueStorage()
        try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
            while let fieldNumber = try decoder.nextFieldNumber() {
                switch fieldNumber {
                case 1: try decoder.decodeSingularMessageField(value: &_storage._header)
                case 2: try decoder.decodeRepeatedMessageField(value: &_storage._entity)
                case 1000..<2000:
                    try decoder.decodeExtensionField(values: &_protobuf_extensionFieldValues, messageType: GTFSRealtime_FeedMessage.self, fieldNumber: fieldNumber)
                default: break
                }
            }
        }
    }
    
    public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
        try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
            if let v = _storage._header {
                try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
            }
            if !_storage._entity.isEmpty {
                try visitor.visitRepeatedMessageField(value: _storage._entity, fieldNumber: 2)
            }
            try visitor.visitExtensionFields(fields: _protobuf_extensionFieldValues, start: 1000, end: 2000)
        }
        try unknownFields.traverse(visitor: &visitor)
    }
    
    public static func ==(lhs: GTFSRealtime_FeedMessage, rhs: GTFSRealtime_FeedMessage) -> Bool {
        if lhs._storage !== rhs._storage {
            let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
                let _storage = _args.0
                let rhs_storage = _args.1
                if _storage._header != rhs_storage._header {return false}
                if _storage._entity != rhs_storage._entity {return false}
                return true
            }
            if !storagesAreEqual {return false}
        }
        if lhs.unknownFields != rhs.unknownFields {return false}
        if lhs._protobuf_extensionFieldValues != rhs._protobuf_extensionFieldValues {return false}
        return true
    }
}

extension GTFSRealtime_FeedHeader: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
    public static let protoMessageName: String = _protobuf_package + ".FeedHeader"
    public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
        1: .standard(proto: "gtfs_realtime_version"),
        2: .same(proto: "incrementality"),
        3: .same(proto: "timestamp"),
    ]
    
    public var isInitialized: Bool {
        if !_protobuf_extensionFieldValues.isInitialized {return false}
        if self._gtfsRealtimeVersion == nil {return false}
        return true
    }
    
    mutating public func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
        while let fieldNumber = try decoder.nextFieldNumber() {
            switch fieldNumber {
            case 1: try decoder.decodeSingularStringField(value: &self._gtfsRealtimeVersion)
            case 2: try decoder.decodeSingularEnumField(value: &self._incrementality)
            case 3: try decoder.decodeSingularUInt64Field(value: &self._timestamp)
            case 1000..<2000:
                try decoder.decodeExtensionField(values: &_protobuf_extensionFieldValues, messageType: GTFSRealtime_FeedHeader.self, fieldNumber: fieldNumber)
            default: break
            }
        }
    }
    
    public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
        if let v = self._gtfsRealtimeVersion {
            try visitor.visitSingularStringField(value: v, fieldNumber: 1)
        }
        if let v = self._incrementality {
            try visitor.visitSingularEnumField(value: v, fieldNumber: 2)
        }
        if let v = self._timestamp {
            try visitor.visitSingularUInt64Field(value: v, fieldNumber: 3)
        }
        try visitor.visitExtensionFields(fields: _protobuf_extensionFieldValues, start: 1000, end: 2000)
        try unknownFields.traverse(visitor: &visitor)
    }
    
    public static func ==(lhs: GTFSRealtime_FeedHeader, rhs: GTFSRealtime_FeedHeader) -> Bool {
        if lhs._gtfsRealtimeVersion != rhs._gtfsRealtimeVersion {return false}
        if lhs._incrementality != rhs._incrementality {return false}
        if lhs._timestamp != rhs._timestamp {return false}
        if lhs.unknownFields != rhs.unknownFields {return false}
        if lhs._protobuf_extensionFieldValues != rhs._protobuf_extensionFieldValues {return false}
        return true
    }
}

extension GTFSRealtime_FeedHeader.Incrementality: SwiftProtobuf._ProtoNameProviding {
    static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
        0: .same(proto: "FULL_DATASET"),
        1: .same(proto: "DIFFERENTIAL"),
    ]
}

extension GTFSRealtime_FeedEntity: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
    public static let protoMessageName: String = _protobuf_package + ".FeedEntity"
    public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
        1: .same(proto: "id"),
        2: .standard(proto: "is_deleted"),
        3: .standard(proto: "trip_update"),
        4: .same(proto: "vehicle"),
        5: .same(proto: "alert"),
    ]
    
    fileprivate class _StorageClass {
        var _id: String? = nil
        var _isDeleted: Bool? = nil
        var _tripUpdate: GTFSRealtime_TripUpdate? = nil
        var _vehicle: GTFSRealtime_VehiclePosition? = nil
        var _alert: GTFSRealtime_Alert? = nil
        
        static let defaultInstance = _StorageClass()
        
        private init() {}
        
        init(copying source: _StorageClass) {
            _id = source._id
            _isDeleted = source._isDeleted
            _tripUpdate = source._tripUpdate
            _vehicle = source._vehicle
            _alert = source._alert
        }
    }
    
    fileprivate mutating func _uniqueStorage() -> _StorageClass {
        if !isKnownUniquelyReferenced(&_storage) {
            _storage = _StorageClass(copying: _storage)
        }
        return _storage
    }
    
    public var isInitialized: Bool {
        if !_protobuf_extensionFieldValues.isInitialized {return false}
        return withExtendedLifetime(_storage) { (_storage: _StorageClass) in
            if _storage._id == nil {return false}
            if let v = _storage._tripUpdate, !v.isInitialized {return false}
            if let v = _storage._vehicle, !v.isInitialized {return false}
            if let v = _storage._alert, !v.isInitialized {return false}
            return true
        }
    }
    
    mutating public func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
        _ = _uniqueStorage()
        try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
            while let fieldNumber = try decoder.nextFieldNumber() {
                switch fieldNumber {
                case 1: try decoder.decodeSingularStringField(value: &_storage._id)
                case 2: try decoder.decodeSingularBoolField(value: &_storage._isDeleted)
                case 3: try decoder.decodeSingularMessageField(value: &_storage._tripUpdate)
                case 4: try decoder.decodeSingularMessageField(value: &_storage._vehicle)
                case 5: try decoder.decodeSingularMessageField(value: &_storage._alert)
                case 1000..<2000:
                    try decoder.decodeExtensionField(values: &_protobuf_extensionFieldValues, messageType: GTFSRealtime_FeedEntity.self, fieldNumber: fieldNumber)
                default: break
                }
            }
        }
    }
    
    public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
        try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
            if let v = _storage._id {
                try visitor.visitSingularStringField(value: v, fieldNumber: 1)
            }
            if let v = _storage._isDeleted {
                try visitor.visitSingularBoolField(value: v, fieldNumber: 2)
            }
            if let v = _storage._tripUpdate {
                try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
            }
            if let v = _storage._vehicle {
                try visitor.visitSingularMessageField(value: v, fieldNumber: 4)
            }
            if let v = _storage._alert {
                try visitor.visitSingularMessageField(value: v, fieldNumber: 5)
            }
            try visitor.visitExtensionFields(fields: _protobuf_extensionFieldValues, start: 1000, end: 2000)
        }
        try unknownFields.traverse(visitor: &visitor)
    }
    
    public static func ==(lhs: GTFSRealtime_FeedEntity, rhs: GTFSRealtime_FeedEntity) -> Bool {
        if lhs._storage !== rhs._storage {
            let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
                let _storage = _args.0
                let rhs_storage = _args.1
                if _storage._id != rhs_storage._id {return false}
                if _storage._isDeleted != rhs_storage._isDeleted {return false}
                if _storage._tripUpdate != rhs_storage._tripUpdate {return false}
                if _storage._vehicle != rhs_storage._vehicle {return false}
                if _storage._alert != rhs_storage._alert {return false}
                return true
            }
            if !storagesAreEqual {return false}
        }
        if lhs.unknownFields != rhs.unknownFields {return false}
        if lhs._protobuf_extensionFieldValues != rhs._protobuf_extensionFieldValues {return false}
        return true
    }
}

extension GTFSRealtime_TripUpdate: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
    public static let protoMessageName: String = _protobuf_package + ".TripUpdate"
    public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
        1: .same(proto: "trip"),
        3: .same(proto: "vehicle"),
        2: .standard(proto: "stop_time_update"),
        4: .same(proto: "timestamp"),
        5: .same(proto: "delay"),
    ]
    
    fileprivate class _StorageClass {
        var _trip: GTFSRealtime_TripDescriptor? = nil
        var _vehicle: GTFSRealtime_VehicleDescriptor? = nil
        var _stopTimeUpdate: [GTFSRealtime_TripUpdate.StopTimeUpdate] = []
        var _timestamp: UInt64? = nil
        var _delay: Int32? = nil
        
        static let defaultInstance = _StorageClass()
        
        private init() {}
        
        init(copying source: _StorageClass) {
            _trip = source._trip
            _vehicle = source._vehicle
            _stopTimeUpdate = source._stopTimeUpdate
            _timestamp = source._timestamp
            _delay = source._delay
        }
    }
    
    fileprivate mutating func _uniqueStorage() -> _StorageClass {
        if !isKnownUniquelyReferenced(&_storage) {
            _storage = _StorageClass(copying: _storage)
        }
        return _storage
    }
    
    public var isInitialized: Bool {
        if !_protobuf_extensionFieldValues.isInitialized {return false}
        return withExtendedLifetime(_storage) { (_storage: _StorageClass) in
            if _storage._trip == nil {return false}
            if let v = _storage._trip, !v.isInitialized {return false}
            if let v = _storage._vehicle, !v.isInitialized {return false}
            if !SwiftProtobuf.Internal.areAllInitialized(_storage._stopTimeUpdate) {return false}
            return true
        }
    }
    
    mutating public func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
        _ = _uniqueStorage()
        try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
            while let fieldNumber = try decoder.nextFieldNumber() {
                switch fieldNumber {
                case 1: try decoder.decodeSingularMessageField(value: &_storage._trip)
                case 2: try decoder.decodeRepeatedMessageField(value: &_storage._stopTimeUpdate)
                case 3: try decoder.decodeSingularMessageField(value: &_storage._vehicle)
                case 4: try decoder.decodeSingularUInt64Field(value: &_storage._timestamp)
                case 5: try decoder.decodeSingularInt32Field(value: &_storage._delay)
                case 1000..<2000:
                    try decoder.decodeExtensionField(values: &_protobuf_extensionFieldValues, messageType: GTFSRealtime_TripUpdate.self, fieldNumber: fieldNumber)
                default: break
                }
            }
        }
    }
    
    public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
        try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
            if let v = _storage._trip {
                try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
            }
            if !_storage._stopTimeUpdate.isEmpty {
                try visitor.visitRepeatedMessageField(value: _storage._stopTimeUpdate, fieldNumber: 2)
            }
            if let v = _storage._vehicle {
                try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
            }
            if let v = _storage._timestamp {
                try visitor.visitSingularUInt64Field(value: v, fieldNumber: 4)
            }
            if let v = _storage._delay {
                try visitor.visitSingularInt32Field(value: v, fieldNumber: 5)
            }
            try visitor.visitExtensionFields(fields: _protobuf_extensionFieldValues, start: 1000, end: 2000)
        }
        try unknownFields.traverse(visitor: &visitor)
    }
    
    public static func ==(lhs: GTFSRealtime_TripUpdate, rhs: GTFSRealtime_TripUpdate) -> Bool {
        if lhs._storage !== rhs._storage {
            let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
                let _storage = _args.0
                let rhs_storage = _args.1
                if _storage._trip != rhs_storage._trip {return false}
                if _storage._vehicle != rhs_storage._vehicle {return false}
                if _storage._stopTimeUpdate != rhs_storage._stopTimeUpdate {return false}
                if _storage._timestamp != rhs_storage._timestamp {return false}
                if _storage._delay != rhs_storage._delay {return false}
                return true
            }
            if !storagesAreEqual {return false}
        }
        if lhs.unknownFields != rhs.unknownFields {return false}
        if lhs._protobuf_extensionFieldValues != rhs._protobuf_extensionFieldValues {return false}
        return true
    }
}

extension GTFSRealtime_TripUpdate.StopTimeEvent: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
    public static let protoMessageName: String = GTFSRealtime_TripUpdate.protoMessageName + ".StopTimeEvent"
    public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
        1: .same(proto: "delay"),
        2: .same(proto: "time"),
        3: .same(proto: "uncertainty"),
    ]
    
    public var isInitialized: Bool {
        if !_protobuf_extensionFieldValues.isInitialized {return false}
        return true
    }
    
    mutating public func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
        while let fieldNumber = try decoder.nextFieldNumber() {
            switch fieldNumber {
            case 1: try decoder.decodeSingularInt32Field(value: &self._delay)
            case 2: try decoder.decodeSingularInt64Field(value: &self._time)
            case 3: try decoder.decodeSingularInt32Field(value: &self._uncertainty)
            case 1000..<2000:
                try decoder.decodeExtensionField(values: &_protobuf_extensionFieldValues, messageType: GTFSRealtime_TripUpdate.StopTimeEvent.self, fieldNumber: fieldNumber)
            default: break
            }
        }
    }
    
    public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
        if let v = self._delay {
            try visitor.visitSingularInt32Field(value: v, fieldNumber: 1)
        }
        if let v = self._time {
            try visitor.visitSingularInt64Field(value: v, fieldNumber: 2)
        }
        if let v = self._uncertainty {
            try visitor.visitSingularInt32Field(value: v, fieldNumber: 3)
        }
        try visitor.visitExtensionFields(fields: _protobuf_extensionFieldValues, start: 1000, end: 2000)
        try unknownFields.traverse(visitor: &visitor)
    }
    
    public static func ==(lhs: GTFSRealtime_TripUpdate.StopTimeEvent, rhs: GTFSRealtime_TripUpdate.StopTimeEvent) -> Bool {
        if lhs._delay != rhs._delay {return false}
        if lhs._time != rhs._time {return false}
        if lhs._uncertainty != rhs._uncertainty {return false}
        if lhs.unknownFields != rhs.unknownFields {return false}
        if lhs._protobuf_extensionFieldValues != rhs._protobuf_extensionFieldValues {return false}
        return true
    }
}

extension GTFSRealtime_TripUpdate.StopTimeUpdate: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
    public static let protoMessageName: String = GTFSRealtime_TripUpdate.protoMessageName + ".StopTimeUpdate"
    public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
        1: .standard(proto: "stop_sequence"),
        4: .standard(proto: "stop_id"),
        2: .same(proto: "arrival"),
        3: .same(proto: "departure"),
        5: .standard(proto: "schedule_relationship"),
    ]
    
    fileprivate class _StorageClass {
        var _stopSequence: UInt32? = nil
        var _stopID: String? = nil
        var _arrival: GTFSRealtime_TripUpdate.StopTimeEvent? = nil
        var _departure: GTFSRealtime_TripUpdate.StopTimeEvent? = nil
        var _scheduleRelationship: GTFSRealtime_TripUpdate.StopTimeUpdate.ScheduleRelationship? = nil
        
        static let defaultInstance = _StorageClass()
        
        private init() {}
        
        init(copying source: _StorageClass) {
            _stopSequence = source._stopSequence
            _stopID = source._stopID
            _arrival = source._arrival
            _departure = source._departure
            _scheduleRelationship = source._scheduleRelationship
        }
    }
    
    fileprivate mutating func _uniqueStorage() -> _StorageClass {
        if !isKnownUniquelyReferenced(&_storage) {
            _storage = _StorageClass(copying: _storage)
        }
        return _storage
    }
    
    public var isInitialized: Bool {
        if !_protobuf_extensionFieldValues.isInitialized {return false}
        return withExtendedLifetime(_storage) { (_storage: _StorageClass) in
            if let v = _storage._arrival, !v.isInitialized {return false}
            if let v = _storage._departure, !v.isInitialized {return false}
            return true
        }
    }
    
    mutating public func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
        _ = _uniqueStorage()
        try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
            while let fieldNumber = try decoder.nextFieldNumber() {
                switch fieldNumber {
                case 1: try decoder.decodeSingularUInt32Field(value: &_storage._stopSequence)
                case 2: try decoder.decodeSingularMessageField(value: &_storage._arrival)
                case 3: try decoder.decodeSingularMessageField(value: &_storage._departure)
                case 4: try decoder.decodeSingularStringField(value: &_storage._stopID)
                case 5: try decoder.decodeSingularEnumField(value: &_storage._scheduleRelationship)
                case 1000..<2000:
                    try decoder.decodeExtensionField(values: &_protobuf_extensionFieldValues, messageType: GTFSRealtime_TripUpdate.StopTimeUpdate.self, fieldNumber: fieldNumber)
                default: break
                }
            }
        }
    }
    
    public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
        try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
            if let v = _storage._stopSequence {
                try visitor.visitSingularUInt32Field(value: v, fieldNumber: 1)
            }
            if let v = _storage._arrival {
                try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
            }
            if let v = _storage._departure {
                try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
            }
            if let v = _storage._stopID {
                try visitor.visitSingularStringField(value: v, fieldNumber: 4)
            }
            if let v = _storage._scheduleRelationship {
                try visitor.visitSingularEnumField(value: v, fieldNumber: 5)
            }
            try visitor.visitExtensionFields(fields: _protobuf_extensionFieldValues, start: 1000, end: 2000)
        }
        try unknownFields.traverse(visitor: &visitor)
    }
    
    public static func ==(lhs: GTFSRealtime_TripUpdate.StopTimeUpdate, rhs: GTFSRealtime_TripUpdate.StopTimeUpdate) -> Bool {
        if lhs._storage !== rhs._storage {
            let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
                let _storage = _args.0
                let rhs_storage = _args.1
                if _storage._stopSequence != rhs_storage._stopSequence {return false}
                if _storage._stopID != rhs_storage._stopID {return false}
                if _storage._arrival != rhs_storage._arrival {return false}
                if _storage._departure != rhs_storage._departure {return false}
                if _storage._scheduleRelationship != rhs_storage._scheduleRelationship {return false}
                return true
            }
            if !storagesAreEqual {return false}
        }
        if lhs.unknownFields != rhs.unknownFields {return false}
        if lhs._protobuf_extensionFieldValues != rhs._protobuf_extensionFieldValues {return false}
        return true
    }
}

extension GTFSRealtime_TripUpdate.StopTimeUpdate.ScheduleRelationship: SwiftProtobuf._ProtoNameProviding {
    static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
        0: .same(proto: "SCHEDULED"),
        1: .same(proto: "SKIPPED"),
        2: .same(proto: "NO_DATA"),
    ]
}

extension GTFSRealtime_VehiclePosition: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
    public static let protoMessageName: String = _protobuf_package + ".VehiclePosition"
    public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
        1: .same(proto: "trip"),
        8: .same(proto: "vehicle"),
        2: .same(proto: "position"),
        3: .standard(proto: "current_stop_sequence"),
        7: .standard(proto: "stop_id"),
        4: .standard(proto: "current_status"),
        5: .same(proto: "timestamp"),
        6: .standard(proto: "congestion_level"),
        9: .standard(proto: "occupancy_status"),
    ]
    
    fileprivate class _StorageClass {
        var _trip: GTFSRealtime_TripDescriptor? = nil
        var _vehicle: GTFSRealtime_VehicleDescriptor? = nil
        var _position: GTFSRealtime_Position? = nil
        var _currentStopSequence: UInt32? = nil
        var _stopID: String? = nil
        var _currentStatus: GTFSRealtime_VehiclePosition.VehicleStopStatus? = nil
        var _timestamp: UInt64? = nil
        var _congestionLevel: GTFSRealtime_VehiclePosition.CongestionLevel? = nil
        var _occupancyStatus: GTFSRealtime_VehiclePosition.OccupancyStatus? = nil
        
        static let defaultInstance = _StorageClass()
        
        private init() {}
        
        init(copying source: _StorageClass) {
            _trip = source._trip
            _vehicle = source._vehicle
            _position = source._position
            _currentStopSequence = source._currentStopSequence
            _stopID = source._stopID
            _currentStatus = source._currentStatus
            _timestamp = source._timestamp
            _congestionLevel = source._congestionLevel
            _occupancyStatus = source._occupancyStatus
        }
    }
    
    fileprivate mutating func _uniqueStorage() -> _StorageClass {
        if !isKnownUniquelyReferenced(&_storage) {
            _storage = _StorageClass(copying: _storage)
        }
        return _storage
    }
    
    public var isInitialized: Bool {
        if !_protobuf_extensionFieldValues.isInitialized {return false}
        return withExtendedLifetime(_storage) { (_storage: _StorageClass) in
            if let v = _storage._trip, !v.isInitialized {return false}
            if let v = _storage._vehicle, !v.isInitialized {return false}
            if let v = _storage._position, !v.isInitialized {return false}
            return true
        }
    }
    
    mutating public func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
        _ = _uniqueStorage()
        try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
            while let fieldNumber = try decoder.nextFieldNumber() {
                switch fieldNumber {
                case 1: try decoder.decodeSingularMessageField(value: &_storage._trip)
                case 2: try decoder.decodeSingularMessageField(value: &_storage._position)
                case 3: try decoder.decodeSingularUInt32Field(value: &_storage._currentStopSequence)
                case 4: try decoder.decodeSingularEnumField(value: &_storage._currentStatus)
                case 5: try decoder.decodeSingularUInt64Field(value: &_storage._timestamp)
                case 6: try decoder.decodeSingularEnumField(value: &_storage._congestionLevel)
                case 7: try decoder.decodeSingularStringField(value: &_storage._stopID)
                case 8: try decoder.decodeSingularMessageField(value: &_storage._vehicle)
                case 9: try decoder.decodeSingularEnumField(value: &_storage._occupancyStatus)
                case 1000..<2000:
                    try decoder.decodeExtensionField(values: &_protobuf_extensionFieldValues, messageType: GTFSRealtime_VehiclePosition.self, fieldNumber: fieldNumber)
                default: break
                }
            }
        }
    }
    
    public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
        try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
            if let v = _storage._trip {
                try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
            }
            if let v = _storage._position {
                try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
            }
            if let v = _storage._currentStopSequence {
                try visitor.visitSingularUInt32Field(value: v, fieldNumber: 3)
            }
            if let v = _storage._currentStatus {
                try visitor.visitSingularEnumField(value: v, fieldNumber: 4)
            }
            if let v = _storage._timestamp {
                try visitor.visitSingularUInt64Field(value: v, fieldNumber: 5)
            }
            if let v = _storage._congestionLevel {
                try visitor.visitSingularEnumField(value: v, fieldNumber: 6)
            }
            if let v = _storage._stopID {
                try visitor.visitSingularStringField(value: v, fieldNumber: 7)
            }
            if let v = _storage._vehicle {
                try visitor.visitSingularMessageField(value: v, fieldNumber: 8)
            }
            if let v = _storage._occupancyStatus {
                try visitor.visitSingularEnumField(value: v, fieldNumber: 9)
            }
            try visitor.visitExtensionFields(fields: _protobuf_extensionFieldValues, start: 1000, end: 2000)
        }
        try unknownFields.traverse(visitor: &visitor)
    }
    
    public static func ==(lhs: GTFSRealtime_VehiclePosition, rhs: GTFSRealtime_VehiclePosition) -> Bool {
        if lhs._storage !== rhs._storage {
            let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
                let _storage = _args.0
                let rhs_storage = _args.1
                if _storage._trip != rhs_storage._trip {return false}
                if _storage._vehicle != rhs_storage._vehicle {return false}
                if _storage._position != rhs_storage._position {return false}
                if _storage._currentStopSequence != rhs_storage._currentStopSequence {return false}
                if _storage._stopID != rhs_storage._stopID {return false}
                if _storage._currentStatus != rhs_storage._currentStatus {return false}
                if _storage._timestamp != rhs_storage._timestamp {return false}
                if _storage._congestionLevel != rhs_storage._congestionLevel {return false}
                if _storage._occupancyStatus != rhs_storage._occupancyStatus {return false}
                return true
            }
            if !storagesAreEqual {return false}
        }
        if lhs.unknownFields != rhs.unknownFields {return false}
        if lhs._protobuf_extensionFieldValues != rhs._protobuf_extensionFieldValues {return false}
        return true
    }
}

extension GTFSRealtime_VehiclePosition.VehicleStopStatus: SwiftProtobuf._ProtoNameProviding {
    static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
        0: .same(proto: "INCOMING_AT"),
        1: .same(proto: "STOPPED_AT"),
        2: .same(proto: "IN_TRANSIT_TO"),
    ]
}

extension GTFSRealtime_VehiclePosition.CongestionLevel: SwiftProtobuf._ProtoNameProviding {
    static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
        0: .same(proto: "UNKNOWN_CONGESTION_LEVEL"),
        1: .same(proto: "RUNNING_SMOOTHLY"),
        2: .same(proto: "STOP_AND_GO"),
        3: .same(proto: "CONGESTION"),
        4: .same(proto: "SEVERE_CONGESTION"),
    ]
}

extension GTFSRealtime_VehiclePosition.OccupancyStatus: SwiftProtobuf._ProtoNameProviding {
    static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
        0: .same(proto: "EMPTY"),
        1: .same(proto: "MANY_SEATS_AVAILABLE"),
        2: .same(proto: "FEW_SEATS_AVAILABLE"),
        3: .same(proto: "STANDING_ROOM_ONLY"),
        4: .same(proto: "CRUSHED_STANDING_ROOM_ONLY"),
        5: .same(proto: "FULL"),
        6: .same(proto: "NOT_ACCEPTING_PASSENGERS"),
    ]
}

extension GTFSRealtime_Alert: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
    public static let protoMessageName: String = _protobuf_package + ".Alert"
    public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
        1: .standard(proto: "active_period"),
        5: .standard(proto: "informed_entity"),
        6: .same(proto: "cause"),
        7: .same(proto: "effect"),
        8: .same(proto: "url"),
        10: .standard(proto: "header_text"),
        11: .standard(proto: "description_text"),
    ]
    
    fileprivate class _StorageClass {
        var _activePeriod: [GTFSRealtime_TimeRange] = []
        var _informedEntity: [TransitRealtime_EntitySelector] = []
        var _cause: GTFSRealtime_Alert.Cause? = nil
        var _effect: GTFSRealtime_Alert.Effect? = nil
        var _url: GTFSRealtime_TranslatedString? = nil
        var _headerText: GTFSRealtime_TranslatedString? = nil
        var _descriptionText: GTFSRealtime_TranslatedString? = nil
        
        static let defaultInstance = _StorageClass()
        
        private init() {}
        
        init(copying source: _StorageClass) {
            _activePeriod = source._activePeriod
            _informedEntity = source._informedEntity
            _cause = source._cause
            _effect = source._effect
            _url = source._url
            _headerText = source._headerText
            _descriptionText = source._descriptionText
        }
    }
    
    fileprivate mutating func _uniqueStorage() -> _StorageClass {
        if !isKnownUniquelyReferenced(&_storage) {
            _storage = _StorageClass(copying: _storage)
        }
        return _storage
    }
    
    public var isInitialized: Bool {
        if !_protobuf_extensionFieldValues.isInitialized {return false}
        return withExtendedLifetime(_storage) { (_storage: _StorageClass) in
            if !SwiftProtobuf.Internal.areAllInitialized(_storage._activePeriod) {return false}
            if !SwiftProtobuf.Internal.areAllInitialized(_storage._informedEntity) {return false}
            if let v = _storage._url, !v.isInitialized {return false}
            if let v = _storage._headerText, !v.isInitialized {return false}
            if let v = _storage._descriptionText, !v.isInitialized {return false}
            return true
        }
    }
    
    mutating public func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
        _ = _uniqueStorage()
        try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
            while let fieldNumber = try decoder.nextFieldNumber() {
                switch fieldNumber {
                case 1: try decoder.decodeRepeatedMessageField(value: &_storage._activePeriod)
                case 5: try decoder.decodeRepeatedMessageField(value: &_storage._informedEntity)
                case 6: try decoder.decodeSingularEnumField(value: &_storage._cause)
                case 7: try decoder.decodeSingularEnumField(value: &_storage._effect)
                case 8: try decoder.decodeSingularMessageField(value: &_storage._url)
                case 10: try decoder.decodeSingularMessageField(value: &_storage._headerText)
                case 11: try decoder.decodeSingularMessageField(value: &_storage._descriptionText)
                case 1000..<2000:
                    try decoder.decodeExtensionField(values: &_protobuf_extensionFieldValues, messageType: GTFSRealtime_Alert.self, fieldNumber: fieldNumber)
                default: break
                }
            }
        }
    }
    
    public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
        try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
            if !_storage._activePeriod.isEmpty {
                try visitor.visitRepeatedMessageField(value: _storage._activePeriod, fieldNumber: 1)
            }
            if !_storage._informedEntity.isEmpty {
                try visitor.visitRepeatedMessageField(value: _storage._informedEntity, fieldNumber: 5)
            }
            if let v = _storage._cause {
                try visitor.visitSingularEnumField(value: v, fieldNumber: 6)
            }
            if let v = _storage._effect {
                try visitor.visitSingularEnumField(value: v, fieldNumber: 7)
            }
            if let v = _storage._url {
                try visitor.visitSingularMessageField(value: v, fieldNumber: 8)
            }
            if let v = _storage._headerText {
                try visitor.visitSingularMessageField(value: v, fieldNumber: 10)
            }
            if let v = _storage._descriptionText {
                try visitor.visitSingularMessageField(value: v, fieldNumber: 11)
            }
            try visitor.visitExtensionFields(fields: _protobuf_extensionFieldValues, start: 1000, end: 2000)
        }
        try unknownFields.traverse(visitor: &visitor)
    }
    
    public static func ==(lhs: GTFSRealtime_Alert, rhs: GTFSRealtime_Alert) -> Bool {
        if lhs._storage !== rhs._storage {
            let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
                let _storage = _args.0
                let rhs_storage = _args.1
                if _storage._activePeriod != rhs_storage._activePeriod {return false}
                if _storage._informedEntity != rhs_storage._informedEntity {return false}
                if _storage._cause != rhs_storage._cause {return false}
                if _storage._effect != rhs_storage._effect {return false}
                if _storage._url != rhs_storage._url {return false}
                if _storage._headerText != rhs_storage._headerText {return false}
                if _storage._descriptionText != rhs_storage._descriptionText {return false}
                return true
            }
            if !storagesAreEqual {return false}
        }
        if lhs.unknownFields != rhs.unknownFields {return false}
        if lhs._protobuf_extensionFieldValues != rhs._protobuf_extensionFieldValues {return false}
        return true
    }
}

extension GTFSRealtime_Alert.Cause: SwiftProtobuf._ProtoNameProviding {
    static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
        1: .same(proto: "UNKNOWN_CAUSE"),
        2: .same(proto: "OTHER_CAUSE"),
        3: .same(proto: "TECHNICAL_PROBLEM"),
        4: .same(proto: "STRIKE"),
        5: .same(proto: "DEMONSTRATION"),
        6: .same(proto: "ACCIDENT"),
        7: .same(proto: "HOLIDAY"),
        8: .same(proto: "WEATHER"),
        9: .same(proto: "MAINTENANCE"),
        10: .same(proto: "CONpublic structION"),
        11: .same(proto: "POLICE_ACTIVITY"),
        12: .same(proto: "MEDICAL_EMERGENCY"),
    ]
}

extension GTFSRealtime_Alert.Effect: SwiftProtobuf._ProtoNameProviding {
    static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
        1: .same(proto: "NO_SERVICE"),
        2: .same(proto: "REDUCED_SERVICE"),
        3: .same(proto: "SIGNIFICANT_DELAYS"),
        4: .same(proto: "DETOUR"),
        5: .same(proto: "ADDITIONAL_SERVICE"),
        6: .same(proto: "MODIFIED_SERVICE"),
        7: .same(proto: "OTHER_EFFECT"),
        8: .same(proto: "UNKNOWN_EFFECT"),
        9: .same(proto: "STOP_MOVED"),
    ]
}

extension GTFSRealtime_TimeRange: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
    public static let protoMessageName: String = _protobuf_package + ".TimeRange"
    public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
        1: .same(proto: "start"),
        2: .same(proto: "end"),
    ]
    
    public var isInitialized: Bool {
        if !_protobuf_extensionFieldValues.isInitialized {return false}
        return true
    }
    
    mutating public func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
        while let fieldNumber = try decoder.nextFieldNumber() {
            switch fieldNumber {
            case 1: try decoder.decodeSingularUInt64Field(value: &self._start)
            case 2: try decoder.decodeSingularUInt64Field(value: &self._end)
            case 1000..<2000:
                try decoder.decodeExtensionField(values: &_protobuf_extensionFieldValues, messageType: GTFSRealtime_TimeRange.self, fieldNumber: fieldNumber)
            default: break
            }
        }
    }
    
    public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
        if let v = self._start {
            try visitor.visitSingularUInt64Field(value: v, fieldNumber: 1)
        }
        if let v = self._end {
            try visitor.visitSingularUInt64Field(value: v, fieldNumber: 2)
        }
        try visitor.visitExtensionFields(fields: _protobuf_extensionFieldValues, start: 1000, end: 2000)
        try unknownFields.traverse(visitor: &visitor)
    }
    
    public static func ==(lhs: GTFSRealtime_TimeRange, rhs: GTFSRealtime_TimeRange) -> Bool {
        if lhs._start != rhs._start {return false}
        if lhs._end != rhs._end {return false}
        if lhs.unknownFields != rhs.unknownFields {return false}
        if lhs._protobuf_extensionFieldValues != rhs._protobuf_extensionFieldValues {return false}
        return true
    }
}

extension GTFSRealtime_Position: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
    public static let protoMessageName: String = _protobuf_package + ".Position"
    public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
        1: .same(proto: "latitude"),
        2: .same(proto: "longitude"),
        3: .same(proto: "bearing"),
        4: .same(proto: "odometer"),
        5: .same(proto: "speed"),
    ]
    
    public var isInitialized: Bool {
        if !_protobuf_extensionFieldValues.isInitialized {return false}
        if self._latitude == nil {return false}
        if self._longitude == nil {return false}
        return true
    }
    
    mutating public func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
        while let fieldNumber = try decoder.nextFieldNumber() {
            switch fieldNumber {
            case 1: try decoder.decodeSingularFloatField(value: &self._latitude)
            case 2: try decoder.decodeSingularFloatField(value: &self._longitude)
            case 3: try decoder.decodeSingularFloatField(value: &self._bearing)
            case 4: try decoder.decodeSingularDoubleField(value: &self._odometer)
            case 5: try decoder.decodeSingularFloatField(value: &self._speed)
            case 1000..<2000:
                try decoder.decodeExtensionField(values: &_protobuf_extensionFieldValues, messageType: GTFSRealtime_Position.self, fieldNumber: fieldNumber)
            default: break
            }
        }
    }
    
    public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
        if let v = self._latitude {
            try visitor.visitSingularFloatField(value: v, fieldNumber: 1)
        }
        if let v = self._longitude {
            try visitor.visitSingularFloatField(value: v, fieldNumber: 2)
        }
        if let v = self._bearing {
            try visitor.visitSingularFloatField(value: v, fieldNumber: 3)
        }
        if let v = self._odometer {
            try visitor.visitSingularDoubleField(value: v, fieldNumber: 4)
        }
        if let v = self._speed {
            try visitor.visitSingularFloatField(value: v, fieldNumber: 5)
        }
        try visitor.visitExtensionFields(fields: _protobuf_extensionFieldValues, start: 1000, end: 2000)
        try unknownFields.traverse(visitor: &visitor)
    }
    
    public static func ==(lhs: GTFSRealtime_Position, rhs: GTFSRealtime_Position) -> Bool {
        if lhs._latitude != rhs._latitude {return false}
        if lhs._longitude != rhs._longitude {return false}
        if lhs._bearing != rhs._bearing {return false}
        if lhs._odometer != rhs._odometer {return false}
        if lhs._speed != rhs._speed {return false}
        if lhs.unknownFields != rhs.unknownFields {return false}
        if lhs._protobuf_extensionFieldValues != rhs._protobuf_extensionFieldValues {return false}
        return true
    }
}

extension GTFSRealtime_TripDescriptor: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
    public static let protoMessageName: String = _protobuf_package + ".TripDescriptor"
    public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
        1: .standard(proto: "trip_id"),
        5: .standard(proto: "route_id"),
        6: .standard(proto: "direction_id"),
        2: .standard(proto: "start_time"),
        3: .standard(proto: "start_date"),
        4: .standard(proto: "schedule_relationship"),
    ]
    
    public var isInitialized: Bool {
        if !_protobuf_extensionFieldValues.isInitialized {return false}
        return true
    }
    
    mutating public func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
        while let fieldNumber = try decoder.nextFieldNumber() {
            switch fieldNumber {
            case 1: try decoder.decodeSingularStringField(value: &self._tripID)
            case 2: try decoder.decodeSingularStringField(value: &self._startTime)
            case 3: try decoder.decodeSingularStringField(value: &self._startDate)
            case 4: try decoder.decodeSingularEnumField(value: &self._scheduleRelationship)
            case 5: try decoder.decodeSingularStringField(value: &self._routeID)
            case 6: try decoder.decodeSingularUInt32Field(value: &self._directionID)
            case 1000..<2000:
                try decoder.decodeExtensionField(values: &_protobuf_extensionFieldValues, messageType: GTFSRealtime_TripDescriptor.self, fieldNumber: fieldNumber)
            default: break
            }
        }
    }
    
    public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
        if let v = self._tripID {
            try visitor.visitSingularStringField(value: v, fieldNumber: 1)
        }
        if let v = self._startTime {
            try visitor.visitSingularStringField(value: v, fieldNumber: 2)
        }
        if let v = self._startDate {
            try visitor.visitSingularStringField(value: v, fieldNumber: 3)
        }
        if let v = self._scheduleRelationship {
            try visitor.visitSingularEnumField(value: v, fieldNumber: 4)
        }
        if let v = self._routeID {
            try visitor.visitSingularStringField(value: v, fieldNumber: 5)
        }
        if let v = self._directionID {
            try visitor.visitSingularUInt32Field(value: v, fieldNumber: 6)
        }
        try visitor.visitExtensionFields(fields: _protobuf_extensionFieldValues, start: 1000, end: 2000)
        try unknownFields.traverse(visitor: &visitor)
    }
    
    public static func ==(lhs: GTFSRealtime_TripDescriptor, rhs: GTFSRealtime_TripDescriptor) -> Bool {
        if lhs._tripID != rhs._tripID {return false}
        if lhs._routeID != rhs._routeID {return false}
        if lhs._directionID != rhs._directionID {return false}
        if lhs._startTime != rhs._startTime {return false}
        if lhs._startDate != rhs._startDate {return false}
        if lhs._scheduleRelationship != rhs._scheduleRelationship {return false}
        if lhs.unknownFields != rhs.unknownFields {return false}
        if lhs._protobuf_extensionFieldValues != rhs._protobuf_extensionFieldValues {return false}
        return true
    }
}

extension GTFSRealtime_TripDescriptor.ScheduleRelationship: SwiftProtobuf._ProtoNameProviding {
    static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
        0: .same(proto: "SCHEDULED"),
        1: .same(proto: "ADDED"),
        2: .same(proto: "UNSCHEDULED"),
        3: .same(proto: "CANCELED"),
    ]
}

extension GTFSRealtime_VehicleDescriptor: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
    public static let protoMessageName: String = _protobuf_package + ".VehicleDescriptor"
    public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
        1: .same(proto: "id"),
        2: .same(proto: "label"),
        3: .standard(proto: "license_plate"),
    ]
    
    public var isInitialized: Bool {
        if !_protobuf_extensionFieldValues.isInitialized {return false}
        return true
    }
    
    mutating public func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
        while let fieldNumber = try decoder.nextFieldNumber() {
            switch fieldNumber {
            case 1: try decoder.decodeSingularStringField(value: &self._id)
            case 2: try decoder.decodeSingularStringField(value: &self._label)
            case 3: try decoder.decodeSingularStringField(value: &self._licensePlate)
            case 1000..<2000:
                try decoder.decodeExtensionField(values: &_protobuf_extensionFieldValues, messageType: GTFSRealtime_VehicleDescriptor.self, fieldNumber: fieldNumber)
            default: break
            }
        }
    }
    
    public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
        if let v = self._id {
            try visitor.visitSingularStringField(value: v, fieldNumber: 1)
        }
        if let v = self._label {
            try visitor.visitSingularStringField(value: v, fieldNumber: 2)
        }
        if let v = self._licensePlate {
            try visitor.visitSingularStringField(value: v, fieldNumber: 3)
        }
        try visitor.visitExtensionFields(fields: _protobuf_extensionFieldValues, start: 1000, end: 2000)
        try unknownFields.traverse(visitor: &visitor)
    }
    
    public static func ==(lhs: GTFSRealtime_VehicleDescriptor, rhs: GTFSRealtime_VehicleDescriptor) -> Bool {
        if lhs._id != rhs._id {return false}
        if lhs._label != rhs._label {return false}
        if lhs._licensePlate != rhs._licensePlate {return false}
        if lhs.unknownFields != rhs.unknownFields {return false}
        if lhs._protobuf_extensionFieldValues != rhs._protobuf_extensionFieldValues {return false}
        return true
    }
}

extension TransitRealtime_EntitySelector: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
    public static let protoMessageName: String = _protobuf_package + ".EntitySelector"
    public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
        1: .standard(proto: "agency_id"),
        2: .standard(proto: "route_id"),
        3: .standard(proto: "route_type"),
        4: .same(proto: "trip"),
        5: .standard(proto: "stop_id"),
    ]
    
    fileprivate class _StorageClass {
        var _agencyID: String? = nil
        var _routeID: String? = nil
        var _routeType: Int32? = nil
        var _trip: GTFSRealtime_TripDescriptor? = nil
        var _stopID: String? = nil
        
        static let defaultInstance = _StorageClass()
        
        private init() {}
        
        init(copying source: _StorageClass) {
            _agencyID = source._agencyID
            _routeID = source._routeID
            _routeType = source._routeType
            _trip = source._trip
            _stopID = source._stopID
        }
    }
    
    fileprivate mutating func _uniqueStorage() -> _StorageClass {
        if !isKnownUniquelyReferenced(&_storage) {
            _storage = _StorageClass(copying: _storage)
        }
        return _storage
    }
    
    public var isInitialized: Bool {
        if !_protobuf_extensionFieldValues.isInitialized {return false}
        return withExtendedLifetime(_storage) { (_storage: _StorageClass) in
            if let v = _storage._trip, !v.isInitialized {return false}
            return true
        }
    }
    
    mutating public func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
        _ = _uniqueStorage()
        try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
            while let fieldNumber = try decoder.nextFieldNumber() {
                switch fieldNumber {
                case 1: try decoder.decodeSingularStringField(value: &_storage._agencyID)
                case 2: try decoder.decodeSingularStringField(value: &_storage._routeID)
                case 3: try decoder.decodeSingularInt32Field(value: &_storage._routeType)
                case 4: try decoder.decodeSingularMessageField(value: &_storage._trip)
                case 5: try decoder.decodeSingularStringField(value: &_storage._stopID)
                case 1000..<2000:
                    try decoder.decodeExtensionField(values: &_protobuf_extensionFieldValues, messageType: TransitRealtime_EntitySelector.self, fieldNumber: fieldNumber)
                default: break
                }
            }
        }
    }
    
    public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
        try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
            if let v = _storage._agencyID {
                try visitor.visitSingularStringField(value: v, fieldNumber: 1)
            }
            if let v = _storage._routeID {
                try visitor.visitSingularStringField(value: v, fieldNumber: 2)
            }
            if let v = _storage._routeType {
                try visitor.visitSingularInt32Field(value: v, fieldNumber: 3)
            }
            if let v = _storage._trip {
                try visitor.visitSingularMessageField(value: v, fieldNumber: 4)
            }
            if let v = _storage._stopID {
                try visitor.visitSingularStringField(value: v, fieldNumber: 5)
            }
            try visitor.visitExtensionFields(fields: _protobuf_extensionFieldValues, start: 1000, end: 2000)
        }
        try unknownFields.traverse(visitor: &visitor)
    }
    
    public static func ==(lhs: TransitRealtime_EntitySelector, rhs: TransitRealtime_EntitySelector) -> Bool {
        if lhs._storage !== rhs._storage {
            let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
                let _storage = _args.0
                let rhs_storage = _args.1
                if _storage._agencyID != rhs_storage._agencyID {return false}
                if _storage._routeID != rhs_storage._routeID {return false}
                if _storage._routeType != rhs_storage._routeType {return false}
                if _storage._trip != rhs_storage._trip {return false}
                if _storage._stopID != rhs_storage._stopID {return false}
                return true
            }
            if !storagesAreEqual {return false}
        }
        if lhs.unknownFields != rhs.unknownFields {return false}
        if lhs._protobuf_extensionFieldValues != rhs._protobuf_extensionFieldValues {return false}
        return true
    }
}

extension GTFSRealtime_TranslatedString: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
    public static let protoMessageName: String = _protobuf_package + ".TranslatedString"
    public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
        1: .same(proto: "translation"),
    ]
    
    public var isInitialized: Bool {
        if !_protobuf_extensionFieldValues.isInitialized {return false}
        if !SwiftProtobuf.Internal.areAllInitialized(self.translation) {return false}
        return true
    }
    
    mutating public func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
        while let fieldNumber = try decoder.nextFieldNumber() {
            switch fieldNumber {
            case 1: try decoder.decodeRepeatedMessageField(value: &self.translation)
            case 1000..<2000:
                try decoder.decodeExtensionField(values: &_protobuf_extensionFieldValues, messageType: GTFSRealtime_TranslatedString.self, fieldNumber: fieldNumber)
            default: break
            }
        }
    }
    
    public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
        if !self.translation.isEmpty {
            try visitor.visitRepeatedMessageField(value: self.translation, fieldNumber: 1)
        }
        try visitor.visitExtensionFields(fields: _protobuf_extensionFieldValues, start: 1000, end: 2000)
        try unknownFields.traverse(visitor: &visitor)
    }
    
    public static func ==(lhs: GTFSRealtime_TranslatedString, rhs: GTFSRealtime_TranslatedString) -> Bool {
        if lhs.translation != rhs.translation {return false}
        if lhs.unknownFields != rhs.unknownFields {return false}
        if lhs._protobuf_extensionFieldValues != rhs._protobuf_extensionFieldValues {return false}
        return true
    }
}

extension GTFSRealtime_TranslatedString.Translation: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
    public static let protoMessageName: String = GTFSRealtime_TranslatedString.protoMessageName + ".Translation"
    public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
        1: .same(proto: "text"),
        2: .same(proto: "language"),
    ]
    
    public var isInitialized: Bool {
        if !_protobuf_extensionFieldValues.isInitialized {return false}
        if self._text == nil {return false}
        return true
    }
    
    mutating public func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
        while let fieldNumber = try decoder.nextFieldNumber() {
            switch fieldNumber {
            case 1: try decoder.decodeSingularStringField(value: &self._text)
            case 2: try decoder.decodeSingularStringField(value: &self._language)
            case 1000..<2000:
                try decoder.decodeExtensionField(values: &_protobuf_extensionFieldValues, messageType: GTFSRealtime_TranslatedString.Translation.self, fieldNumber: fieldNumber)
            default: break
            }
        }
    }
    
    public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
        if let v = self._text {
            try visitor.visitSingularStringField(value: v, fieldNumber: 1)
        }
        if let v = self._language {
            try visitor.visitSingularStringField(value: v, fieldNumber: 2)
        }
        try visitor.visitExtensionFields(fields: _protobuf_extensionFieldValues, start: 1000, end: 2000)
        try unknownFields.traverse(visitor: &visitor)
    }
    
    public static func ==(lhs: GTFSRealtime_TranslatedString.Translation, rhs: GTFSRealtime_TranslatedString.Translation) -> Bool {
        if lhs._text != rhs._text {return false}
        if lhs._language != rhs._language {return false}
        if lhs.unknownFields != rhs.unknownFields {return false}
        if lhs._protobuf_extensionFieldValues != rhs._protobuf_extensionFieldValues {return false}
        return true
    }
}

