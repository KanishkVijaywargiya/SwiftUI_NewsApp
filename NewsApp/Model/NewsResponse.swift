//
//  NewsResponse.swift
//  NewsApp
//
//  Created by KANISHK VIJAYWARGIYA on 06/09/21.
//

import SwiftUI

struct NewsResponse: Codable {
    let articles: [Article]
}

struct Article: Codable, Identifiable {
    let id = UUID()
    let author: String?
    let url: String?
    let source, title, articleDescription: String?
    let image: String?
    let date: Date?
    
    enum CodingKeys: String, CodingKey {
        case author, url, source, title
        case articleDescription = "description"
        case image, date
    }
}

extension Article {
    static var dummyData: Article {
        .init(
            author: "Madeline Holcombe, CNN",
            url: "https://www.cnn.com/2021/09/06/health/us-coronavirus-monday/index.html",
            source: "CNN",
            title: "Doctors in these states could soon be forced to make tough choices about who gets an ICU bed, Fauci warns - CNN",
            articleDescription: "Some hospitals in the United States are growing close to reaching full capacity as Covid-19 continues to spread, and soon officials could be making choices about who gets an ICU bed, Dr. Anthony Fauci told CNN.",
            image: "https://cdn.cnn.com/cnnnext/dam/assets/210905225753-02-us-coronavirus-monday-super-tease.jpg",
            date: Date()
        )
    }
}
