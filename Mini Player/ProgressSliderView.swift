//
//  ProgressSliderView.swift
//  Mini Player
//
//  Created by Nate Thompson on 9/24/20.
//

import SwiftUI
import Sliders

struct ProgressSliderView: View {
    @State var trackProgress = 0.25
    
    var body: some View {
        ValueSlider(value: $trackProgress)
            .valueSliderStyle(
                HorizontalValueSliderStyle(
                    track: HorizontalValueTrack(
                        view: Track())
                        .background(Background())
                        .frame(height: 7),
                    thumb: Thumb(),
                    thumbSize: CGSize(width: 7, height: 7),
                    thumbInteractiveSize: CGSize(width: 15, height: 15),
                    options: .interactiveTrack))
    }
}

fileprivate struct Thumb: View {
    var body: some View {
        Rectangle()
            .rotation(.degrees(45))
            .fill(Color.white)
            .frame(width: 5, height: 5)
    }
}

fileprivate struct Track: View {
    var body: some View {
        Capsule()
            .fill(LinearGradient(gradient: Gradient(colors: [
                Color(.sRGB, red: 0.6, green: 0.6, blue: 0.55),
                Color(.sRGB, red: 0.4, green: 0.4, blue: 0.35)
            ]), startPoint: .top, endPoint: .bottom))
            .padding(1)

    }
}

fileprivate struct Background: View {
    var body: some View {
        ZStack {
            Capsule()
                .fill(LinearGradient(gradient: Gradient(colors: [
                    Color(.sRGB, red: 0.47, green: 0.49, blue: 0.4),
                    Color(.sRGB, red: 0.66, green: 0.67, blue: 0.59)
                ]), startPoint: .top, endPoint: .bottom))
                
            Capsule()
                .fill(LinearGradient(gradient: Gradient(colors: [
                    Color(.sRGB, red: 0.65, green: 0.66, blue: 0.58),
                    Color(.sRGB, red: 0.76, green: 0.77, blue: 0.69)
                ]), startPoint: .top, endPoint: .bottom))
                .padding(1)
        }
    }
}


struct ProgressSliderView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ProgressSliderView()
            Thumb()
                .previewLayout(.fixed(width: 10, height: 10))
            Track()
            Background()
        }
        .previewLayout(.fixed(width: 50, height: 10))
    }
}
