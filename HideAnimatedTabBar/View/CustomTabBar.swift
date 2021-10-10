//
//  CustomTabBar.swift
//  HideAnimatedTabBar
//
//  Created by Heorhi on 2021-10-05.
//

import SwiftUI

struct CustomTabBar: View {
    
    @Binding var currentTab: String
    var bottomEdge: CGFloat
    var body: some View {
      
        HStack(spacing: 0) {
            // Tab button
            
            ForEach(["Mail", "Meet"], id: \.self){ image in
                
                TabButton(image: image, currentTab: $currentTab, badge: image == "Mail" ? 99 : 0)
                
                
                
            }
        }
        .padding(.top, 10)
        .padding(.bottom, bottomEdge)
        .background(Color("TabBG"))
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
ContentView()
            .preferredColorScheme(.light)
        
        
    }
}


struct TabButton: View {
    var image: String
    @Binding var currentTab : String
    
    //Optional Bagde
    
    var badge: Int = 0
    
    //Based On Color SChme changing Color
    
    @Environment(\.colorScheme) var scheme
    
    
    var body: some View {
        
        Button(action:{
            withAnimation{currentTab = image}
        
        }){
            
            Image(image)
                .renderingMode(.template)
                .resizable()
                .aspectRatio( contentMode: .fit)
                .frame(width: 35, height: 35)
                .foregroundColor(currentTab == image ? Color("Pink") : Color.gray.opacity(0.7))
                .overlay(
                
                    Text("\(badge < 100 ? badge : 99)+")
                        .font(.caption.bold())
                        .foregroundColor(scheme == .dark ? .black : .white)
                        .padding(.vertical, 4)
                        .padding(.horizontal, 5)
                       .background(Color("Pink"))
                    //    .ignoresSafeArea()
                       .clipShape(Capsule())
                        .background(
                        
                        Capsule()
                            .stroke(scheme == .dark ? .black : .white, lineWidth: 4)
                            
                        )
                    
                    
                        .offset(x: 20, y: -5)
                        .opacity(badge == 0 ? 0 : 1)
                    ,alignment: .topTrailing
                    
                )
                .frame(maxWidth: .infinity)
            
        }
    }
}
