//
//  DBConnection.swift
//  ReserveRecord
//
//  Created by Shin Lee on 2021/10/14.
//

import Foundation
import SQLite

public var allArticles:Array<Article> = []
public var allImages:Dictionary<Int64, Array<String>> = [:]
public var allCategories:Dictionary<Int64, Array<String>> = [:]
func connect_db(){
    do {
        let path = Bundle.main.path(forResource: "record", ofType: "sqlite3")!
        let db = try Connection(path, readonly: true)
        
        //article db
        let article = Table("article")
        
        //params
        let id = Expression<Int64>("id")
        let title = Expression<String>("title")
        let link = Expression<String>("link")
        let content = Expression<String>("content")
        let post_date = Expression<String>("post_date")
        
        let all = Array(try db.prepare(article))
        
        
        var idx = 0
        for item in all{
            let ctnt = item[content]
            var lctnt = ctnt.components(separatedBy: "\n")
            while((lctnt.firstIndex(of: "\n")) != nil){
                lctnt.remove(at:lctnt.firstIndex(of: "\n")!)
            }
            
            allArticles.insert(Article(a:Int(item[id]),  b:item[title], c:item[link], d:lctnt, e:item[post_date]),at: 0)
            idx = idx+1
        }
        
        //image db
        let image = Table("image")
        
        let alli = Array(try db.prepare(image))
        
        for item in alli{
            if (allImages[item[id]] == nil){
                allImages[item[id]] = []
            }
            allImages[item[id]]!.insert(item[link], at:0)
        }
        
        //category db
        let category = Table("category")
        
        //additional param
        let categoryp = Expression<String>("category")
        let allc = Array(try db.prepare(category))
        
        for item in allc{
            if (allCategories[item[id]] == nil){
                allCategories[item[id]] = []
            }
            allCategories[item[id]]!.insert(item[categoryp], at:0)
        }
    }
    catch{
        print(error)
    }
}
  
