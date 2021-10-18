//
//  ReserveRecordApp.swift
//  ReserveRecord
//
//  Created by Shin Lee on 2021/10/14.
//

import SwiftUI
import SQLite

@main
struct ReserveRecordApp: App {
    init() {
        print("initiating app")
        connect_db()
        print("succesfully connected to local db.")
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
