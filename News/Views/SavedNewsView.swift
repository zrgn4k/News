//
//  SavedNewsView.swift
//  News
//
//  Created by Yevhenii on 11.12.22.
//

import SwiftUI

struct SavedNewsView: View {
    @EnvironmentObject var savedNews: SavedNews
    
    func removeArticle(at offsets:IndexSet) {
        savedNews.savedArticles.remove(atOffsets: offsets)
    }
    
    var body: some View {
        Text("")
        NavigationView {
            List {
                ForEach(savedNews.savedArticles, id: \.self) {article in
                    NewsComponentView(title: article.title, description: article.description, urlToImage: article.urlToImage, url: article.url)
                }
                .onDelete(perform: removeArticle)
            }
            .listStyle(.plain)
        }
        .navigationTitle("Saved News")
    }
}

struct SavedNewsView_Previews: PreviewProvider {
    static var previews: some View {
        SavedNewsView()
    }
}
