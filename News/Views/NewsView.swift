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
    let source: Source
    let title: String
    let description: String
    let url: String
    let urlToImage: String?
    let publishedAt: String
    let content: String
}

struct Source: Codable, Hashable {
    let id: String?
    let name: String
}

class ViewModel:ObservableObject {
    
    @Published var news: [Article] = []
    
    func fetch() {
        guard let url = URL(string: "https://newsapi.org/v2/everything?q=apple&from=2022-12-22&to=2022-12-22&sortBy=popularity&apiKey=843d1595afe843cdabfa28676e0f3d21") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
             
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
    
    var body: some View {
        ScrollView() {
            ForEach(viewModel.news, id: \.self) { article in
                NewsComponentView(title: article.title, description: article.description, urlToImage: article.urlToImage, url: article.url)
                    .navigationTitle("News")
            }
        }
        .onAppear {
            viewModel.fetch()
        }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
