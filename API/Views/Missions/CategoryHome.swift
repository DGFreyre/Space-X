//
//  Category.swift
//  API
//
//  Created by DGF on 12/5/22.
//

import SwiftUI

struct CategoryHome: View {
    @StateObject var modelData : ViewModel = ViewModel()

    var body: some View {
  
        NavigationView{
            List{
                Image("Space-X")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                .clipped()
                .listRowInsets(EdgeInsets())
                Text("Missions").fontWeight(.bold).font(.system(size: 40))
                ForEach(modelData.missions, id: \.self){ mission in
               
                    CategoryRow( items: [mission])
                }

            }.padding(.bottom, 15)
        }
        .onAppear{
            modelData.fetch()
              
        }
       
    }
}


struct Category_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
    }
}
