//
//  ErrorMessage.swift
//  GHFollowers
//
//  Created by Javier Arroyo on 11/2/25.
//

import UIKit

public enum GHError: String, Error {
    case alreadyInFavorites = "You've already favorited this user."
    case invalidUserName = "This username created an invalid request. Please try again."
    case unableToComplete = "Unable to complete your request. Please check your internet connection"
    case unableToFavorite = "There was an error favoriting this user. Please try agian"
    case invalidResponse = "Invalid response from the server. Please try again."
    case invalidData = "The data received from the server was invalid. Please try again."
}
