//
//  Article.swift
//  ReserveRecord
//
//  Created by Shin Lee on 2021/10/14.
//

import Foundation

public class Article{
    var id:Int
    var title:String
    var link:String
    var content:[String]
    var post_date:String
    
    init(a:Int, b:String, c:String, d:[String], e:String) {
        id = a
        title = b
        link = c
        content = d
        post_date = e
    }
}

public func contentToString(article: Article!) -> String!{
    var ret:String! = ""
    for art in article.content{
        if(!art.isEmpty){
            ret+=art
        }
    }
    return ret
}
