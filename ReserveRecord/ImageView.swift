//
//  ImageView.swift
//  ReserveRecord
//
//  Created by Shin Lee on 2021/10/16.
//

import SwiftUI
import Kingfisher

struct ImageView: View {
    var link:String
    var caption:String
    var body: some View {
        VStack{
            KFImage(URL(string: link))
                .placeholder{ Image("NoImage")}
                .resizable()
                .loadDiskFileSynchronously()
                .cacheMemoryOnly()
                .fade(duration: 0.25)
                .aspectRatio(contentMode: .fit)
                
            if(!caption.isEmpty){
                Text(caption)
                .font(Font.custom("TimesNewRomanPSMT", size: 15).italic())
            }
        }
        
    }
}
