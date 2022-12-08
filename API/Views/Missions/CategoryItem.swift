//
//  CategoryItem.swift
//  API
//
//  Created by DGF on 12/5/22.
//

import SwiftUI

struct CategoryItem: View {
    
    
    var response : Domain
    var body: some View {
      //  VStack() {
        
            HStack {
                URLImageSmall(urlString: response.image ?? "launch")
           
                HStack{
                    URLPatch(urlString: response.links ?? "video", data: nil)
                    Text(response.name)
                        .foregroundColor(.black)
                        .fontWeight(.heavy)
                    .font(.caption) }.padding(.leading, 15)
            }
        //}
        
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(response: Domain())
    }
}
