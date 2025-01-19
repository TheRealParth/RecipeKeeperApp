//
//  Recipe.swift
//  RecipeKeeperApp
//
//  Created by Parth Patel on 1/19/25.
//
//
//import Foundation
//
//enum Quantity {
//    case pinch
//    case dash
//    case bunch (Int)
//    case cup (Int)
//    case pint (Int)
//    case quart (Int)
//    case cloves (Int)
//    case tablespoon (Double)
//    case teaspoon (Double)
//    case ounce (Double)
//    case gram (Double)
//}
//
//struct Ingredient {
//    let name: String
//    let quantity: Quantity
//}
//
//struct Recipe: Codable {
//    let id: UUID
//    var title: String
//    var description: String?
//    enum CodingKeys: CodingKey {
//        case id
//        case title
//        case description
//        case ingredients
//        case steps
//    }
//    enum category: String, Codable {
//        case appetizer
//        case main
//        case dessert
//        case side
//    }
//    var ingredients: [Ingredient]
//    var steps: [String]
//    
//    init(from: Decoder){
//    }
//}
