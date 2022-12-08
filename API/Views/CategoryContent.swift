//
//  CategoryHome.swift
//  API
//
//  Created by DGF on 12/5/22.
//

import SwiftUI



struct CategoryContent: View {
    
    @EnvironmentObject private var locationManager: LocationManager
    @State private var selection : Tab = .list
    enum Tab {
        case featured
        case list
    }
    
    @StateObject var viewModel : ViewModel = ViewModel()
    
    var body: some View {
      
        TabView(selection: $selection) {
            CategoryHome()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
            MissionsList()
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.featured)
              
        }    .alert(isPresented: $locationManager.didArriveAtTakeout) {
            Alert(
              title: Text("Check In"),
              message:
                Text("""
                  You have arrived to the place.
                  Do you want to check in?
                  """),
              primaryButton: .default(Text("Yes")),
              secondaryButton: .default(Text("No"))
            )
          }
    }
}

struct CategoryContent_Previews: PreviewProvider {
    static var previews: some View {
        CategoryContent()
          
    }
}
