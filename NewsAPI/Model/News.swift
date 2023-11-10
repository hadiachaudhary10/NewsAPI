//
//  TeslaNews.swift
//  NewsAPI
//
//  Created by Dev on 21/09/2022.
//

import Foundation

struct News: Codable{
    
    let status: String
    let totalResults: Int
    let articles: [Articles]
    
}
