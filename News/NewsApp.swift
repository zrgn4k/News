//
//  NewsApp.swift
//  News
//
//  Created by Yevhenii on 11.12.22.
//

import SwiftUI


class SavedNews: ObservableObject {
    @Published var savedArticles: [Article] = []
    
    init() {
        if let data = UserDefaults.standard.data(forKey: "savedArray"),
            let articles = try? JSONDecoder().decode([Article].self, from: data) {
                print(articles)
                savedArticles = articles
                return
            }
            savedArticles = []
        }
    
    func save() {
        if let encoded = try? JSONEncoder().encode(savedArticles) {
            UserDefaults.standard.set(encoded, forKey: "savedArray")
            print("i saved data!!!")
            print(encoded)
        }
    }
}

@main
struct NewsApp: App {
    @Environment(\.scenePhase) private var scenePhase
    @StateObject var savedNews = SavedNews()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(savedNews)
        }
        .onChange(of: scenePhase) { phase in
            if phase == .background {
                savedNews.save()
            }
        }
    }
}
