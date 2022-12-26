//
//  ContentView.swift
//  News
//
//  Created by Yevhenii on 11.12.22.
//

import SwiftUI

struct ContentView: View {
    @State var selectedTab = 1
    
    var body: some View {
        NavigationView() {
            TabView(selection: $selectedTab) {
                NewsView()
                    .tabItem{
                        Label("News", systemImage: "newspaper")
                    }
                    .tag(1)
                ProfileView()
                    .tabItem{
                        Label("Profile", systemImage: "person.crop.circle")
                    }
                    .tag(2)
            }.navigationTitle(selectedTab == 1 ? "News" : "Profile")
        }
    }
}

var imageCache: NSCache<NSString, UIImage> = {
    let cache = NSCache<NSString, UIImage> ()
    cache.countLimit = 100
    cache.totalCostLimit = 1024 * 1024 * 100 // 100mb
    return cache
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
