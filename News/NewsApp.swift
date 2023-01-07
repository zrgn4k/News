//
//  NewsApp.swift
//  News
//
//  Created by Yevhenii on 11.12.22.
//

import SwiftUI

@main
struct NewsApp: App {
    @StateObject var savedNews = SavedNews()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(savedNews)
        }
    }
}
