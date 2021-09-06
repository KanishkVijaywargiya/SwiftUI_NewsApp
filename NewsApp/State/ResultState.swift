//
//  ResultState.swift
//  NewsApp
//
//  Created by KANISHK VIJAYWARGIYA on 06/09/21.
//

import Foundation

enum ResultState {
    case loading
    case success(content: [Article])
    case failed(error: Error)
}
