//
//  AboutView.swift
//  News
//
//  Created by Yevhenii on 11.12.22.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack() {
            Text("News")
                .font(.title)
            Text("Created by Yevhenii Kapitonov")
                .opacity(0.3)
            Text("v0.1")
                .opacity(0.3)
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
