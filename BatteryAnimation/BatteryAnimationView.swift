//
//  BatteryAnimationView.swift
//  BatteryAnimation
//
//  Created by Leandro Bastos on 04/08/22.
//

import SwiftUI

struct BatteryAnimationView: View {
    @Binding var progress: Double
    @State private var opacity = 0.0
    let fill: Color
    let outline: Color

    var body: some View {
        ZStack {
            Image(systemName: "battery.0")
                .resizable()
                .scaledToFit()
                .font(.headline.weight(.ultraLight))
                .foregroundColor(outline)
                .background(
                    Rectangle()
                        .fill(fill)
                        .scaleEffect(x: progress, y: 1, anchor: .leading)
                )
                .mask(
                    Image(systemName: "battery.100")
                        .resizable()
                        .scaledToFit()
                        .font(.headline.weight(.ultraLight))
                )
                .frame(width: 200)
                .padding()

            Text("\(Int(progress * 100))%")
                .foregroundColor(.white)
                .animation(nil)
                .opacity(opacity)
        }
        .task {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                withAnimation {
                    opacity = 1
                }
            }
        }
    }
}

struct BatteryAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        BatteryAnimationView(progress: .constant(0.7), fill: .green, outline: .black)
    }
}
