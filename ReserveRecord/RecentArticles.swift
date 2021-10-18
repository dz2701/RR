//
//  RecentArticles.swift
//  ReserveRecord
//
//  Created by Shin Lee on 2021/10/17.
//

import SwiftUI

struct RecentArticles: View {
    @State private var selection: Int? = nil
    var body: some View {
        NavigationView{
            VStack{
                NavigationLink(destination: ArticleView(idx: 5)){
                    Label("Go to this test thigny, plz", systemImage: "folder")
                }
                
            }
        }.navigationTitle("Navigation")
        
    }
}

struct RecentArticles_Previews: PreviewProvider {
    static var previews: some View {
        RecentArticles()
    }
}
