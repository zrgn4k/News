//
//  UserDataView.swift
//  News
//
//  Created by Yevhenii on 17.01.23.
//

import SwiftUI

struct UserDataView: View {
    @EnvironmentObject var savedNews: SavedNews
    var body: some View {
        VStack() {
            List{
                TextField("Your name", text: $savedNews.name) {
                    if (savedNews.name == "") {
                        savedNews.name = "User"
                    }
                }
            }
        }
    }
}
