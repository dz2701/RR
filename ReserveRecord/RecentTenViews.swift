//
//  RecentTenViews.swift
//  ReserveRecord
//
//  Created by Shin Lee on 2021/10/18.
//

import SwiftUI

struct RecentTenViews: View {

    var body: some View {
        NavigationView{
            ScrollView{
                VStack(alignment: .center){
                    ForEach(0..<10){id in
                        NavigationLink(destination: ArticleView(idx: id)){
                            ArticlePreview(idx: id)
                        }.padding(10)
                    }
                }
                Spacer()
            }
            
        }.navigationBarHidden(true)
    }
}

struct RecentTenViews_Previews: PreviewProvider {
    static var previews: some View {
        RecentTenViews()
    }
}
