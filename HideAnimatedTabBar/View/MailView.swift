//
//  MailView.swift
//  HideAnimatedTabBar
//
//  Created by Heorhi on 2021-10-06.
//

import SwiftUI

struct MailView: View {
    @Binding var  hideTab: Bool
    var bottomEdge : CGFloat
    
    //Two state for Holding the current Offset and previous Offset
    @State var offset: CGFloat = 0
    @State var lastOffset: CGFloat = 0
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            
            VStack(alignment: .leading, spacing: 20 ) {
                
                Text("PRIMARY")
                    .font(.callout.bold())
                    .foregroundColor(.gray)
                    .padding(.leading)
                
                ForEach(allMessages){ message in
                    CardView(message: message)
                        
                    
                    
                    
                    
                }  
            }
            
            //Geometry Reader  for calculating Offset
            .overlay(
            
                GeometryReader { proxy -> Color in
                    
                    let minY = proxy.frame(in: .named("SCROLL")).minY
                    
                    //Your Own Duration to hide tab
                    
                    let durationOffset: CGFloat = 35
                    
                    DispatchQueue.main.async {
                        
                        if minY < offset {
                            
                            if offset < 0  && -minY > (lastOffset + durationOffset){
                                
                                withAnimation(.easeOut
                                                .speed(1.5)) {
                                    
                                    
                                    hideTab = true
                                }
                                
                                lastOffset = -offset
                                
                            }
                        }
                        if minY > offset && -minY < (lastOffset - durationOffset) {
                            
                            
                            
                            withAnimation(.easeOut
                                            .speed(1.5)) {
                                
                                
                                hideTab = false
                            }
                            
                            lastOffset = -offset
                            
                        
                            
                    
                            
                        }
                        
                        self.offset = minY
                        
                        
                    }
                    
                    
                    return Color.clear
                    
                }
            
            )
            
            .padding()
            .padding(.bottom, 15 +  bottomEdge + 35)
        } .coordinateSpace(name: "SCROLL")
    }
    
    @ViewBuilder
    func CardView(message: Message) -> some View {
        
        HStack(spacing: 15){
            
            //First Letter From name...
            
            Text(String(message.userName.first ?? "i"))
                .font(.title2)
                .fontWeight(.bold)
                .frame(width: 55, height: 55)
                .background(message.tintColor)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 0) {
                
                Text(message.userName)
                    .fontWeight(.bold)
                Text(message.message)
                    .font(.callout)
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct MailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
