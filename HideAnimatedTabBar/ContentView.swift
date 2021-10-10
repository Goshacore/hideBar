//
//  ContentView.swift
//  HideAnimatedTabBar
//
//  Created by Heorhi on 2021-10-05.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        //For safe Area Buttom
        
        GeometryReader { proxy in
            
            let bottomEdge = proxy.safeAreaInsets.bottom
            
            Home(bottomEdge: (bottomEdge == 0 ? 15 : bottomEdge))
                .ignoresSafeArea(.all, edges: .bottom)
            
            
            
        }
        
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
