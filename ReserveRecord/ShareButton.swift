//
//  ShareButton.swift
//  ReserveRecord
//
//  Created by Shin Lee on 2021/10/18.
//

import SwiftUI

struct ShareButton: View {
    @Binding var curarticle:Int
    @Binding var curState:curView
    var body: some View {
        if(curState == .article){
            Button(action: actionSheet) {
                Image(systemName: "square.and.arrow.up")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
            }
        }
        else{
            EmptyView()
        }
    }
    func actionSheet() {
        print("actionsheet successfully triggered!")
        guard let urlShare = URL(string: allArticles[curarticle].link) else { return }
           let activityVC = UIActivityViewController(activityItems: [urlShare], applicationActivities: nil)
           UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
       }
}

