//
//  ItunesPodcasts.swift
//  PodChat
//
//  Created by Michael Miller on 3/28/18.
//  Copyright © 2018 Puffin Labs. All rights reserved.
//

import Foundation
// To parse the JSON, add this file to your project and do:
//
//   let itunesPodcasts = try? JSONDecoder().decode(ItunesPodcasts.self, from: jsonData)

import Foundation

struct ItunesPodcasts: Codable {
    let resultCount: Int
    let results: [Result]
}

struct Result: Codable {
    let wrapperType, kind: String
    let artistID: Int?
    let collectionID, trackID: Int
    let artistName, collectionName, trackName, collectionCensoredName: String
    let trackCensoredName: String
    let artistViewURL: String?
    let collectionViewURL, feedURL, trackViewURL, artworkUrl30: String
    let artworkUrl60, artworkUrl100: String
    let collectionPrice, trackPrice, trackRentalPrice, collectionHDPrice: Int
    let trackHDPrice, trackHDRentalPrice: Int
    let releaseDate, collectionExplicitness, trackExplicitness: String
    let trackCount: Int
    let country, currency, primaryGenreName, contentAdvisoryRating: String
    let artworkUrl600: String
    let genreIDS, genres: [String]
    
    enum CodingKeys: String, CodingKey {
        case wrapperType, kind
        case artistID = "artistId"
        case collectionID = "collectionId"
        case trackID = "trackId"
        case artistName, collectionName, trackName, collectionCensoredName, trackCensoredName
        case artistViewURL = "artistViewUrl"
        case collectionViewURL = "collectionViewUrl"
        case feedURL = "feedUrl"
        case trackViewURL = "trackViewUrl"
        case artworkUrl30, artworkUrl60, artworkUrl100, collectionPrice, trackPrice, trackRentalPrice
        case collectionHDPrice = "collectionHdPrice"
        case trackHDPrice = "trackHdPrice"
        case trackHDRentalPrice = "trackHdRentalPrice"
        case releaseDate, collectionExplicitness, trackExplicitness, trackCount, country, currency, primaryGenreName, contentAdvisoryRating, artworkUrl600
        case genreIDS = "genreIds"
        case genres
    }
}

