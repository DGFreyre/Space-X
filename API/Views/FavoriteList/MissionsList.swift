//
//  LandmarkList.swift
//  API
//
//  Created by DGF on 12/6/22.
//

import SwiftUI

struct MissionsList: View {
  
    @State private var showFavoritesOnly = false
    @StateObject var viewModel : ViewModel = ViewModel()

    var filteredMissions: [Domain] {
        viewModel.missions.filter { item in
            (!showFavoritesOnly || item.success ?? true)
        }
    }

    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }

                ForEach(filteredMissions) { mission in
                    NavigationLink {
                        MissionDetail( menuItem: mission)
                    } label: {
                        MissionListRow(item: mission)
                    }
                }
            }
            .navigationTitle("Favorite Missions")
        }
    }}

struct MissionsList_Previews: PreviewProvider {
    static var previews: some View {
        MissionsList()
    }
}
