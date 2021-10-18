//
//  ContentView.swift
//  ReserveRecord
//
//  Created by Shin Lee on 2021/10/14.
//

import SwiftUI

struct ContentView: View {
    @State var idx: Int = 1
    init() {

    }
    @State var curstate = curView.article
    @State var curarticle = 1
    var body: some View {
        NavigationView{
            TabView{
                ArticleView(idx: 1).tabItem{Label("wow!", systemImage: "list.dash")}
                .onAppear {
                    curstate = .article
                    curarticle = 1
                    print(curstate)
                }
                ArticleView(idx: 2).tabItem{Label("second Article!", systemImage: "list.dash")}
                .onAppear {
                    curstate = .article
                    curarticle = 2
                    print(curstate)
                }
                Group{
                    ScrollView{
                        ForEach(0..<5){i in
                            NavigationLink(destination: ArticleView(idx: i)){
                                ArticlePreview(idx: i)
                            }
                            .padding(10)
                        }
                    }
                }
                .tabItem{
                    Label("YES", systemImage: "list.dash")
                }
                .onAppear{
                    curstate = .main
                    print(curstate)
                }
            
            }
            //.navigationTitle("Reserve Record")
            .toolbar{
                ToolbarItem(placement: .principal){
                    Image("FullLogo")
                        .resizable()
                        .frame(width: 200, height: 60)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}



