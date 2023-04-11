//
//  ContentView.swift
//  SwiftUIAppStoreTapToRate
//
//  Created by Salman Biljeek on 4/10/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedStars: Int = 0
    
    var body: some View {
        VStack {
            HStack {
                Text("Tap to Rate:")
                    .foregroundColor(.gray)
                    .font(.system(size: 17, weight: .regular))
                Spacer()
                HStack(spacing: 17) {
                    ForEach(Array((1...5).enumerated()), id: \.offset) { index, element in
                        Button {
                            handleStarTapped(star: index + 1)
                        } label: {
                            Image(systemName: (self.selectedStars >= (index + 1)) ? "star.fill" : "star")
                                .resizable()
                                .frame(maxWidth: 27, maxHeight: 27)
                                .foregroundColor(.blue)
                        }
                    }
                }
            }
            Spacer()
            resetButtonView
            Spacer()
        }
        .padding(.top, 40)
        .padding([.leading, .trailing], 20)
    }
    
    func handleStarTapped(star: Int) {
        self.selectedStars = star
    }
    
    var resetButtonView: some View {
        Button {
            self.selectedStars = 0
        } label: {
            Text("Reset")
                .padding()
                .padding([.leading, .trailing])
                .foregroundColor(.white)
                .background(.indigo)
                .clipShape(Capsule())
                .font(.system(size: 18, weight: .bold))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
