//
//  Articles.swift
//  NewsAPI
//
//  Created by Dev on 21/09/2022.
//

import Foundation

struct Articles: Codable{
    
    let source: Source
    let author: String?
    let title: String
    let description: String
    let url: String
    let urlToImage: String
    let publishedAt: String
    let content: String
    
}
