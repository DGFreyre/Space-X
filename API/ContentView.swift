//
//  ContentView.swift
//  API
//
//  Created by DGF on 12/5/22.
//

import SwiftUI


struct ContentView: View {
    @StateObject var viewModel : ViewModel = ViewModel()
    var mission = [Domain]()
    
    var body: some View {
    
            NavigationView {
                List(viewModel.missions, id: \.self){ mission in
                    
                    NavigationLink(destination: MissionDetail( menuItem: mission)){
                      
                       MenuListRow(menuItem: mission)
                    }
                    
                }
                .navigationTitle("Missions")
                .onAppear{
                    viewModel.fetch()
                }
            }
          
        
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
