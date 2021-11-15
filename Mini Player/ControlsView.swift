//
//  ControlsView.swift
//  Mini Player
//
//  Created by Nate Thompson on 9/22/20.
//

import SwiftUI

struct ControlsView: View {
    @State var isPlaying = false
    
    var body: some View {
        VStack(spacing: 4) {
            Spacer(minLength: 10)

            HStack(spacing: 2) {
                Button(action: {

                }, label: {
                    CircleButtonIcon(
                        shape: TrackSkipIcon(direction: .previous))
                    .offset(x: -1)
                    .frame(width: 15, height: 9)

                })
                .buttonStyle(CircleButtonStyle())
                .frame(width: 27, height: 28)
                
                if isPlaying {
                    Button(action: {
                        isPlaying = false
                    }, label: {
                        CircleButtonIcon(shape: PauseIcon())
                            .frame(width: 11, height: 11)
                        
                    })
                    .buttonStyle(CircleButtonStyle())
                    .frame(width: 31, height: 31)
                } else {
                    Button(action: {
                        isPlaying = true
                    }, label: {
                        CircleButtonIcon(shape: PlayIcon())
                            .frame(width: 11, height: 11)
                            .offset(x: 1)
                        
                    })
                    .buttonStyle(CircleButtonStyle())
                    .frame(width: 31, height: 31)
                }
                
                Button(action: {

                }, label: {
                    CircleButtonIcon(
                        shape: TrackSkipIcon(direction: .next))
                    .offset(x: 1)
                    .frame(width: 15, height: 9)
                })
                .buttonStyle(CircleButtonStyle())
                .frame(width: 27, height: 28)
            }
            
            HStack(spacing: 3) {
                VolumeIcon(level: .low)
                    .frame(width: 9)
                
                VolumeSliderView()
                
                VolumeIcon(level: .high)
                    .frame(width: 13)
            }
            .frame(height: 10)
            .padding(.horizontal, 4)
            
            Spacer(minLength: 8)
        }
        .frame(width: 99)
    }
}

struct ButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            BackgroundView()
            ControlsView()
        }
        .frame(width: 99, height: 63)
    }
}
