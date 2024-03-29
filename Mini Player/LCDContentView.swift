//
//  LCDContentView.swift
//  Mini Player
//
//  Created by Nate Thompson on 9/23/20.
//

import SwiftUI

struct LCDContentView: View {
    @State var playbackProgress = 0.25
    
    var LCDTextColor: Color {
        Color(.sRGB, red: 0.24, green: 0.24, blue: 0.21)
    }
    
    var body: some View {
        VStack(spacing: 0) {            
            Text("mini player")
                .font(.lucidaGrande(size: 11))
                .fontWeight(.semibold)
                .foregroundColor(LCDTextColor)
            
            Text("Nate Thompson")
                .font(.lucidaGrande(size: 11))
                .foregroundColor(LCDTextColor)
            
            HStack {
                Text("0:52")
                    .font(.lucidaGrande(size: 10))
                    .foregroundColor(LCDTextColor)

                ProgressSliderView()
                    .frame(height: 12)
                
                Text("-4:12")
                    .font(.lucidaGrande(size: 10))
                    .foregroundColor(LCDTextColor)
            }
            .padding(.horizontal, 25)
            
            Spacer(minLength: 2)
        }
        .frame(height: 41)
    }
}

struct LCDContentView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            LCDView()
        }
        .previewLayout(.fixed(width: 200, height: 44))
    }
}
