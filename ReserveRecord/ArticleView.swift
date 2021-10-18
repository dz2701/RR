//
//  ArticleView.swift
//  ReserveRecord
//
//  Created by Shin Lee on 2021/10/14.
//

import SwiftUI

struct ArticleView: View {
    var idx: Int
    var body: some View {
        ScrollView{
            VStack(alignment: .center, spacing: 0){
                //Title
                Text(allArticles[idx].title)
                    .font(Font.custom("TimesNewRomanPS-BoldItalicMT", size: 30))
                    //.font(.system(size: 30, weight: .heavy, design: .default).italic())
                    .padding(.top, 20)
                    .padding(.bottom, 10)
                    .padding(.leading, 20)
                    .padding(.trailing, 10)
                    .multilineTextAlignment(.center)
                
                Divider().frame(width: 200)
                
                //pub date
                
                
                Text("Published " + allArticles[idx].post_date[...allArticles[idx].post_date.index(allArticles[idx].post_date.startIndex, offsetBy: 16)])
                    .padding(.leading, 20)
                    .padding(.trailing, 10)
                    .padding(.top, 10)
                    .padding(.bottom, 10)
                    .font(Font.custom("TimesNewRomanPS-ItalicMT", size: 15))
                    .multilineTextAlignment(.center)
                
                //category
                VStack{
                    Text("Categorized with: ")
                        .font(Font.custom("TimesNewRomanPS-ItalicMT", size: 15))
                    Spacer()
                    HStack{
                        ForEach(allCategories[Int64(allArticles[idx].id)]!, id: \.self){ c in
                                Text(c + ",")
                                .font(Font.custom("TimesNewRomanPS-ItalicMT", size: 15))
                                .multilineTextAlignment(.center)
                            }
                    }
                }.padding(.bottom, 10)
                
                Divider().frame(width: 300).padding(.bottom,10)
                
                //All images on the top, with captions
                VStack{
                    if(!(allImages[Int64(allArticles[idx].id)]?.isEmpty ?? true)){
                        ForEach(0..<allImages[Int64(allArticles[idx].id)]!.count){ i in
                            Spacer()
                            ImageView(link:(allImages[Int64(allArticles[idx].id)]?[i])!, caption: allArticles[idx].content[i])
                                .frame(width: 300, height: 300)
                            Divider().frame(width: 325)
                        }
                    }
                    
                }.padding(.bottom, 30)
                
                EmptyView().padding(40)
                
                if(allCategories[Int64(allArticles[idx].id)]!.contains("Eggplant")){
                    Text("\n'The Eggplant' is a satirical, fictional column written by the staff of the Reserve Record.\n")
                        .font(Font.custom("TimesNewRomanPS-ItalicMT", size: 15))
                        .padding(.top, 10)
                        .padding(.trailing, 20)
                        .padding(.leading, 20)
                }
                //all article content
                VStack(alignment: .center){
                    ForEach(0..<allArticles[idx].content.count){i in
                        if(((allImages[Int64(allArticles[idx].id)] ?? []).isEmpty)){
                            Text(allArticles[idx].content[i])
                                .font(Font.custom("TimesNewRomanPSMT", size: 16))
                                .padding(.trailing, 25)
                                .padding(.leading, 20)
                                .padding(.bottom, 10)
                                .multilineTextAlignment(.leading)
                        }
                        else if(i>=(allImages[Int64(allArticles[idx].id)] ?? []).count && i<allArticles[idx].content.count){
                            if(!allArticles[idx].content[i].isEmpty){
                                Text(allArticles[idx].content[i])
                                .font(Font.custom("TimesNewRomanPSMT", size: 16))
                                .padding(.trailing, 25)
                                .padding(.leading, 20)
                                .padding(.bottom, 10)
                                .multilineTextAlignment(.leading)
                            }
                                
                            
                        }
                    }
                }
                
                
            }
        }
    }
}

