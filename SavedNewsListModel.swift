//
//  SavedNewsListModel.swift
//  News
//
//  Created by Yevhenii on 27.12.22.
//

import SwiftUI

class SavedNewsListModel: ObservableObject {
    @Published var savedArticles: [Article] = []
}
