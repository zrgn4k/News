//
//  NewsComponentView.swift
//  News
//
//  Created by Yevhenii on 11.12.22.
//

import SwiftUI
import SafariServices

struct NewsComponentView: View {
    var title: String
    var description: String
    var urlToImage: String?
    var url: String
    
    @State private var showSafari: Bool = false
    
    var body: some View {
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
        .foregroundColor(.black)
        .onTapGesture {
            showSafari.toggle()
        }
        .fullScreenCover(isPresented: $showSafari, content: {
            SFSafariViewWrapper(url: URL(string: url)!)
        })
    }
    
    struct NewsComponentView_Previews: PreviewProvider {
        static var previews: some View {
            NewsComponentView(title: "Placeholder", description: "Placeholder", urlToImage: "", url: "")
        }
    }
}
