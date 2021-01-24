//
//  ContentView.swift
//  SwiftUIState
//
//  Created by 王冠之 on 2021/1/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var counter = 0
    var color: [Color] = [.blue, .green, .red]
    
    var body: some View {
        VStack(alignment: .center){
            Text("\(counter)")
                .font(.system(size: 250, weight: .bold, design: .rounded))
            HStack{
                ForEach(0..<color.count){index in
                    CounterButton(counter: $counter, color: color[index])
                }
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 0)
        }
    }
}

struct CounterButton: View {
    @Binding var counter: Int
    @State var selfCounter = 0
    var color: Color
    var body: some View {
        Button(action: {
            self.counter += 1
            self.selfCounter += 1
        }, label:{
            Circle()
                .frame(height: 120)
                .foregroundColor(color)
                .overlay(
                    Text("\(selfCounter)")
                        .font(.system(size: 100, weight: .bold, design: .rounded)) .foregroundColor(.white)
                )
        })
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
