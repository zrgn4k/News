//
//  NewsView.swift
//  News
//
//  Created by Yevhenii on 11.12.22.
//

import SwiftUI
import Foundation

struct JSONAnswer: Codable {
    let articles: [Article]
}

struct Article: Codable, Hashable {
    let title: String
    let description: String
    let url: String
    let urlToImage: String?
}

class ViewModel: ObservableObject {
    
    @Published var news: [Article] = []
    
    func fetch() {
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=843d1595afe843cdabfa28676e0f3d21") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let answer = try JSONDecoder().decode(JSONAnswer.self, from: data)
                self.news = answer.articles
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}


struct NewsView: View {
    @StateObject var viewModel = ViewModel()
    @EnvironmentObject var savedNews: SavedNews
    
    var body: some View {
        List {
            ForEach(viewModel.news, id: \.self) {article in
                if article.urlToImage != nil {
                    NewsComponentView(title: article.title, description: article.description, urlToImage: article.urlToImage, url: article.url)
                        .swipeActions() {
                            Button {
                                if savedNews.savedArticles.contains(Article(title: article.title, description: article.description, url: article.url, urlToImage: article.urlToImage)) {
                                    print("Article is already there!")
                                } else {
                                    savedNews.savedArticles.append(Article(title: article.title, description: article.description, url: article.url, urlToImage: article.urlToImage))
                                }
                            } label: {
                                Label("Save", systemImage: "bookmark")
                            }
                            .tint(.yellow)
                        }
                }
            }
            .environmentObject(savedNews)
        }
        .listStyle(.plain)
        .onAppear {
            viewModel.fetch()
        }
    }
    
    struct NewsView_Previews: PreviewProvider {
        static var previews: some View {
            NewsView()
        }
    }
}
