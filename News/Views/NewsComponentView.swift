//
//  NewsComponentView.swift
//  News
//
//  Created by Yevhenii on 11.12.22.
//

import SwiftUI

struct NewsComponentView: View {
    var title: String
    var description: String
    var urlToImage: String?
    
    var body: some View {
        NavigationLink(destination: Color.gray) {
            HStack() {
                AsyncImage(url: URL(string: urlToImage ?? "")) { phase in
                    switch phase{
                    case .empty:
                        Image("placeholderImg")
                            .resizable()
                            .frame(width: 180, height: 110, alignment: .leading)
                            .cornerRadius(10)
        
                    case .success(let image):
                        image
                            .resizable()
                            .frame(width: 180, height: 110, alignment: .leading)
                            .cornerRadius(10)
                        
                    case .failure:
                        Image(systemName: "photo")
                        
                    @unknown default:
                        fatalError()
                    }
                }
                    
                VStack() {
                    Text(title)
                        .font(.headline).bold()
                        .frame(width: 180, height: 30, alignment: .topLeading)
                    Text(description)
                        .frame(width: 180, height: 75, alignment: .topLeading)
                        .font(.subheadline)
                        .opacity(0.5)
                        .padding(-10)
                }
            }
        }
        .foregroundColor(.black)
    }
}

struct NewsComponentView_Previews: PreviewProvider {
    static var previews: some View {
        NewsComponentView(title: "Placeholder", description: "Placeholder", urlToImage: "/")
    }
}
