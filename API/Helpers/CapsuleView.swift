//
//  CapsuleView.swift
//  API
//
//  Created by DGF on 12/8/22.
//

import SwiftUI

struct CapsuleView: View {
    let menuItem : Domain
    var color : Color
    let text : String
    @State var topLeft : CGFloat = 50
    
    
    
    var body: some View {
        ZStack{
            Color("Pinki").ignoresSafeArea(.all)
            Rectangle().fill(color).opacity(0.5).frame(width: 400, height: 200).background(Color("Pinki").opacity(0.4))
                .cornerRadius(topLeft, corners: .bottomLeft)
            /*Rectangle().fill(color).opacity(0.1).frame(width: 380, height: 180).background(Color("Pinki").opacity(0.2))
                .cornerRadius(topLeft, corners: .bottomLeft)*/
            Text(text + " " + menuItem.rocket).font(.system(.title2, design: .rounded)).foregroundColor(Color.black)
                .fontWeight(.bold)
            
        }
        .frame(width: 430, height: 50)
    }
}
struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct CapsuleView_Previews: PreviewProvider {
    static var previews: some View {
        CapsuleView(menuItem: Domain(), color: .white, opacity: 0.2, text: "Rocket")
    }
}


