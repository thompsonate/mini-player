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
        VStack(spacing: 3) {
            Spacer(minLength: 10)

            HStack(spacing: 2) {
                CircleButton(action: {

                }, icon: {
                    CircleButtonIcon(
                        shape: TrackSkipIcon(direction: .previous))
                    .offset(x: -1)
                    .frame(width: 15, height: 9)

                })
                .frame(width: 27, height: 28)
                
                if isPlaying {
                    CircleButton(action: {
                        isPlaying = false
                    }, icon: {
                        CircleButtonIcon(shape: PauseIcon())
                            .frame(width: 11, height: 11)
                        
                    })
                    .frame(width: 31, height: 32)
                } else {
                    CircleButton(action: {
                        isPlaying = true
                    }, icon: {
                        CircleButtonIcon(shape: PlayIcon())
                            .frame(width: 11, height: 11)
                            .offset(x: 1)
                        
                    })
                    .frame(width: 31, height: 32)
                }
                
                CircleButton(action: {

                }, icon: {
                    CircleButtonIcon(
                        shape: TrackSkipIcon(direction: .next))
                    .offset(x: 1)
                    .frame(width: 15, height: 9)
                })
                .frame(width: 27, height: 28)
            }

            VolumeSliderView()
                .frame(height: 10)

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
