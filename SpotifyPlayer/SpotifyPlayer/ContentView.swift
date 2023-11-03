//
//  SpotifyView.swift
//  SpotifyPlayer
//
//  Created by Ellie Kim on 10/5/23.
//

import SwiftUI

struct SpotifyView: View {
    @State private var value: Double = 0
    @State var isPlayed: Bool = false
    @State var isShuffle: Bool = false
    @State var isRepeat: Bool = false
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color("topcolor"), Color("bottomcolor")]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
            VStack{
                HStack(alignment: .center){
                    Image(systemName: "chevron.down")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                        .foregroundColor(.white)
                    Spacer()
                    Text("Graduation")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    Spacer()
                    Image(systemName: "ellipsis")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                        .foregroundColor(.white)
                }
                .padding(.leading, 20)
                .padding(.trailing, 20)
                .padding(.top, 5)
                Image("albumcover")
                    .resizable()
                    .frame(width: 360, height: 320)
                    .scaledToFit()
                    .cornerRadius(10)
                    .padding(.top, 50)
                Spacer()
                HStack{
                    VStack(alignment: .leading, spacing: 3){
                        Text("Big Brother")
                            .foregroundColor(.white)
                            .font(.title)
                            .fontWeight(.bold)
                        Text("Kanye West")
                            .foregroundColor(Color("artistColor"))
                            .fontWeight(.semibold)
                    }
                    Spacer()
                    Image(systemName: "checkmark.circle.fill")
                        .resizable()
                        .foregroundColor(.green)
                        .frame(width: 30, height: 30)
                }
                .padding(.leading, 20)
                .padding(.trailing, 20)
                Spacer()
                VStack(spacing: 2) {
                    Slider(value: $value, in: 0...4.733)
                        .accentColor(.white)
                    HStack{
                        Text("\(formattedTime(minute: Int(floor(value)), second: value - floor(value)))")
                            .foregroundColor(.gray)
                            .font(.subheadline)
                        Spacer()
                        let remainingTime = 4.733 - value
                        Text("-\(formattedTime(minute: Int(floor(remainingTime)), second: remainingTime - floor(remainingTime)))")
                            .foregroundColor(.gray)
                            .font(.subheadline)
                    }

                    }
                .padding(.leading, 20)
                .padding(.trailing, 20)
                Spacer()
                HStack(spacing: 45){
                    Button{
                        isShuffle.toggle()
                    } label: {
                        Image(systemName: "shuffle")
                            .resizable()
                            .foregroundColor(isShuffle ? .white: .green)
                            .frame(width: 25, height: 25)
                    }
                    Image(systemName: "backward.end.fill")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 30, height: 30)
                    Button {
                        isPlayed.toggle()
                    } label: {
                        Image(systemName: isPlayed ? "play.circle.fill" : "pause.circle.fill" )
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 60, height: 60)
                    }
                    Image(systemName: "forward.end.fill")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 30, height: 30)
                    Button{
                        isRepeat.toggle()
                    } label: {
                        Image(systemName: "repeat")
                            .resizable()
                            .foregroundColor(isRepeat ? .white: .green)
                            .frame(width: 25, height: 25)
                    }              }
                .padding(.leading, 20)
                .padding(.trailing, 20)
                Spacer()
                HStack{
                    Image(systemName: "laptopcomputer")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25)
                        .foregroundColor(.green)
                    Text("Ellie's Macbook Air")
                        .foregroundColor(.green)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    Spacer()
                    Image(systemName: "square.and.arrow.up")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20)
                        .foregroundColor(.white)
                        .padding(.trailing, 20)
                    Image(systemName: "square.stack.3d.up")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25)
                        .foregroundColor(.white)
                }
                .padding(.leading, 30)
                .padding(.trailing, 30)
            }
        }
    }
    func formattedTime(minute: Int, second: Double) -> String {
        let totalSeconds = Int(round(second * 60))
        let formattedSeconds = String(format: "%02d", totalSeconds)
        return "\(minute):\(formattedSeconds)"
    }
}



#Preview {
    SpotifyView()
}
