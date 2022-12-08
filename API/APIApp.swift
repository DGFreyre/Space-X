//
//  APIApp.swift
//  API
//
//  Created by DGF on 12/5/22.
//

import SwiftUI

@main
struct APIApp: App {
    @StateObject private var locationManager = LocationManager()
    var body: some Scene {
        WindowGroup {
            CategoryContent().environmentObject(locationManager)
               
        }
    }
}
