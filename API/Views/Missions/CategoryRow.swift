//
//  CategoryRow.swift
//  API
//
//  Created by DGF on 12/5/22.
//

import SwiftUI

struct CategoryRow: View {
    var items : [Domain]
   @StateObject var viewModel : ViewModel = ViewModel()
    
    var body: some View {
     
        VStack(){
            ForEach(items) { item in
                VStack{
                    Text("Year of Launch:")
                    Text(  item.year! )
                        .foregroundColor(Color("Pink"))
                        .font(.headline)
                }
                    NavigationLink{
                        MissionDetail( menuItem: item)
                    } label: {
                        CategoryItem(response: item)
                }
            }
        }.padding(.bottom, 15)
        
    }
   
}

struct CategoryRow_Previews: PreviewProvider {
    static var items = ViewModel().missions
    
    static var previews: some View {
        CategoryRow(items: Array(items.prefix(4))
        )
    }
}
