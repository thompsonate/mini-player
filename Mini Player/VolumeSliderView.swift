//
//  VolumeSliderView.swift
//  Mini Player
//
//  Created by Nate Thompson on 9/23/20.
//

import SwiftUI
import Sliders

struct VolumeSliderView: View {
    @State var volume = 0.5
    
    var body: some View {
        ValueSlider(value: $volume)
            .valueSliderStyle(
                HorizontalValueSliderStyle(
                    track: HorizontalValueTrack(
                        view: Track())
                        .background(Background())
                        .frame(height: 6),
                    thumb: Thumb(),
                    thumbSize: CGSize(width: 10, height: 10),
                    thumbInteractiveSize: CGSize(width: 15, height: 15),
                    options: .interactiveTrack))
    }
}

fileprivate struct Thumb: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(Color(.sRGB, red: 0.4, green: 0.4, blue: 0.4))
                .opacity(0.5)
            
            Circle()
                .fill(LinearGradient(gradient: Gradient(colors: [
                    Color(.sRGB, red: 0.92, green: 0.92, blue: 0.92),
                    Color(.sRGB, red: 0.64, green: 0.64, blue: 0.64)
                ]), startPoint: .top, endPoint: .bottom))
                .shadow(color: Color.black.opacity(0.5), radius: 1, x: 0, y: 1)
                .padding(1)
        }
    }
}

fileprivate struct Track: View {
    var body: some View {
        Capsule()
            .fill(LinearGradient(gradient: Gradient(stops: [
                .init(color: Color(.sRGB, red: 0.76, green: 0.76, blue: 0.76),
                      location: 0),
                .init(color: Color(.sRGB, red: 0.9, green: 0.9, blue: 0.9),
                      location: 0.25),
                .init(color: Color(.sRGB, red: 0.72, green: 0.73, blue: 0.73),
                      location: 1)
            ]), startPoint: .top, endPoint: .bottom))
            .padding(.vertical, 1)
            .padding(.horizontal, 2)

    }
}

fileprivate struct Background: View {
    var body: some View {
        ZStack {
            Capsule()
                .fill(Color(.sRGB, red: 0.85, green: 0.85, blue: 0.85))
                .offset(y: 1)
            
            Capsule()
                .fill(LinearGradient(gradient: Gradient(stops: [
                    .init(color: Color(.sRGB, red: 0.25, green: 0.25, blue: 0.25),
                          location: 0),
                    .init(color: Color(.sRGB, red: 0.47, green: 0.47, blue: 0.47),
                          location: 0.66),
                    .init(color: Color(.sRGB, red: 0.4, green: 0.4, blue: 0.4),
                          location: 1)
                ]), startPoint: .top, endPoint: .bottom))
        }
        .padding(.horizontal, 1)
    }
}

struct VolumeSliderView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            VolumeSliderView()
            Thumb()
                .previewLayout(.fixed(width: 10, height: 10))
            Track()
            Background()
        }
        .previewLayout(.fixed(width: 50, height: 10))
    }
}
