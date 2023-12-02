//
//  GTFS.swift
//  OV-GTFS-Kit
//
//  Created by ARTEM on 21.11.2023.
//

import Foundation

/// Represents a collection of static data from a General Transit Feed Specification (GTFS) dataset.
public class GTFS{
    /// An array of agencies providing transportation services
    public let agencies: [Agency]
    /// An array of stops where vehicles pick up or drop off passengers
    public let stops: [Stop]
    /// An array of routes that vehicles follow
    public let routes: [Route]
    /// An array of trips, which are a sequence of stops made by a vehicle
    public let trips: [Trip]
    /// An array of stop times specifying arrival and departure times for vehicles at stops
    public let stopTimes: [StopTime]
    /// An array of calendar periods indicating when service is available for each route
    public let calendar: [GTFSCalendar]?
    /// An array of specific dates indicating exceptions or changes in service
    public let calendarDates: [CalendarDate]?
    /// An array of fare attributes describing the fare information for the transit system
    public let fareAttributes: [FareAttribute]?
    /// An array of fare rules specifying which fares apply to which routes
    public let fareRules: [FareRule]?
    /// An array of shapes defining the path that a vehicle travels along its route
    public let shapes: [Shape]?
    /// An array of frequencies indicating how often a vehicle departs at specified times
    public let frequencies: [Frequency]?
    /// An array of transfer rules specifying how passengers can transfer between routes at stops
    public let transfers: [Transfer]?
    /// An array of pathway information describing walking paths and access points within stations
    public let pathways: [Pathway]?
    /// An array of levels within a station or vehicle
    public let levels: [Level]?
    /// An array of feed information providing metadata about the GTFS dataset
    public let feedInformation: [FeedInfo]?
    /// An array of translations providing localized translations for various elements
    public let translations: [Translation]?
    /// An array of attributions indicating the attribution requirements for the dataset
    public let attributions: [Attribution]?
    
    public init(path: String) throws {
        let url = URL(fileURLWithPath: path)
        
        /// Required
        self.agencies = try initializeFile(url.appendingPathComponent("agency.txt"))
        self.stops = try initializeFile(url.appendingPathComponent("stops.txt"))
        self.routes = try initializeFile(url.appendingPathComponent("routes.txt"))
        self.trips = try initializeFile(url.appendingPathComponent("trips.txt"))
        self.stopTimes = try initializeFile(url.appendingPathComponent("stop_times.txt"))
        
        /// Conditionally required and optional
        self.calendar = initializeOptionalFile(url.appendingPathComponent("calendar.txt"))
        self.calendarDates = initializeOptionalFile(url.appendingPathComponent("calendar_dates.txt"))
        self.fareAttributes = initializeOptionalFile(url.appendingPathComponent("fare_attributes.txt"))
        self.fareRules = initializeOptionalFile(url.appendingPathComponent("fare_rules.txt"))
        self.shapes = initializeOptionalFile(url.appendingPathComponent("shapes.txt"))
        self.frequencies = initializeOptionalFile(url.appendingPathComponent("frequencies.txt"))
        self.transfers = initializeOptionalFile(url.appendingPathComponent("transfers.txt"))
        self.pathways = initializeOptionalFile(url.appendingPathComponent("pathways.txt"))
        self.levels = initializeOptionalFile(url.appendingPathComponent("levels.txt"))
        self.feedInformation = initializeOptionalFile(url.appendingPathComponent("feed_info.txt"))
        self.translations = initializeOptionalFile(url.appendingPathComponent("translations.txt"))
        self.attributions = initializeOptionalFile(url.appendingPathComponent("attributions.txt"))
    }
}

func initializeFile<T: FromCSVLine>(_ path: URL) throws -> [T] {
    let reader = try CSVReader(path: path)
    
    return reader.map { line -> T in
        T(line: line)
    }
}

func initializeOptionalFile<T: FromCSVLine>(_ path: URL) -> [T]? {
    let reader = try? CSVReader(path: path)
    
    return reader.map { reader -> [T] in
        reader.map { line -> T in
            T(line: line)
        }
    }
}

