//
//  ArticlePreview.swift
//  ReserveRecord
//
//  Created by Shin Lee on 2021/10/17.
//

import SwiftUI

struct ArticlePreview: View {
    var idx:Int
    var body: some View {
        ZStack(alignment: .center){
            VStack{
                EmptyView()
                    .background(Color("Accent"))
                if(!(allImages[Int64(allArticles[idx].id)]?.isEmpty ?? true)){
                    ImageView(link: allImages[Int64(allArticles[idx].id)]![0], caption: "")
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 500, height: 475)
                        .opacity(0.72)
                        .cornerRadius(25)
                }
                else{
                    Image("NoImage")
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 275)
                        .opacity(0.72)
                }
                
            }
            Group{
                Text(allArticles[idx].title)
                    .font(Font.custom("TimesNewRomanPS-BoldMT", size: 20))
                    .kerning(1.0)
                    .foregroundColor(Color.white)
                    .frame(width:200, height:265)
                    .offset(y:40)
                    .multilineTextAlignment(.center)
            }
        }
        .frame(width: 325, height: 275)
        .opacity(1.0)
        .cornerRadius(12)
        .shadow(color: Color(AppColor.cardShadow.rawValue), radius: 2, x: 0, y: 2)
        
    }
}

private struct CardViewConsts{
    static let cardRatio = 0.8
    static let cardHeight = 400.0
}
struct ArticlePreview_Previews: PreviewProvider {
    static var previews: some View {
        ArticlePreview(idx: 2)
    }
}


    /*
    let cardExcerpt = contentToString(article:allArticles[idx])!
    ZStack(alignment: .center){
        SwiftUI.VStack{
            if(!(allImages[Int64(allArticles[idx].id)]?.isEmpty ?? true)){
                ImageView(link: allImages[Int64(allArticles[idx].id)]![0], caption: "")
                    .opacity(0.8)
            }
        }
    
        VStack{
            Spacer()
            Spacer()
            Text(item.title)
                .font(Font.custom("TimesNewRomanPS-BoldItalicMT", size: 20))
                .kerning(2.0)
                .padding(.top, 20)
                .foregroundColor(Color.white)
                .opacity(1)
                .shadow(
                    color: Color(AppColor.cardShadow.rawValue),
                    radius: 2.0,
                    x: 0,
                    y: 2.0
                )

    
            Spacer()
        }
        
        /*VStack{
            Text(cardExcerpt[..<cardExcerpt.index( cardExcerpt.startIndex, offsetBy: 150)] + "...")
                .padding(.trailing, 20)
                .padding(.leading, 20)
                .font(Font.custom("TimesNewRomanPSMT", size: 15))
                .padding(.bottom, 20)
                .onAppear(perform: {
                    print(cardExcerpt[..<cardExcerpt.index( cardExcerpt.startIndex, offsetBy: 150)])
                })
        
        }*/
        Group{
            Spacer()
            Spacer()
            Spacer()
        }
    }
    .frame(width: CardViewConsts.cardHeight * CardViewConsts.cardRatio, height: CardViewConsts.cardHeight * CardViewConsts.cardRatio )
    .background(Color.white)
    .opacity(1)
    .cornerRadius(24.0)
    .shadow(
        color: Color(AppColor.cardShadow.rawValue),
        radius: 8.0,
        x: 0,
        y: 8.0
    )
    
    
    
}
     */
