//
//  ErrorMessage.swift
//  GHFollowers
//
//  Created by Fede Garcia on 04/03/2024.
//

import Foundation

enum FGError: String, Error {
    case invalidUsername = "This username created an invalid request. Please try again."
    case unableToComplete = "Unable to complete your request. Please check your internet connection"
    case invalidResponse = "Invalid response from the server. Please try again."
    case invalidData = "The data received from the server was invalid. Please try again."
    case favouritesFailure = "Failed to save into favourites, Please try again."
    case alreadyInFavorites = "This user is already in your favourites"
}
