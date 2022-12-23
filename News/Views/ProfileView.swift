//
//  ProfileView.swift
//  News
//
//  Created by Yevhenii on 11.12.22.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack() {
            HStack()
            {
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .opacity(0.5)
                VStack() {
                    Text("User")
                        .font(.title)
                        .frame(width: 190, alignment: .leading)
                    Button("Log in", action: {})
                        .frame(width: 185, alignment: .leading)
                }
                .padding()
            }
            .padding()
            
            List() {
                NavigationLink(destination: SavedNewsView()) {
                    Label("Saved News", systemImage: "bookmark")
                }
                NavigationLink(destination: SettingsView()) {
                    Label("Settings", systemImage: "slider.vertical.3")
                }
                NavigationLink(destination: AboutView()) {
                    Label("About", systemImage: "info.circle")
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
