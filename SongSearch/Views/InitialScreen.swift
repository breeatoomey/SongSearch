//
//  InitialScreen.swift
//  SongSearch
//
//  Created by Breea Toomey on 12/15/23.
//

import SwiftUI
import UIKit
import AVFoundation

let dark_grey = Color(red: 0.0862, green: 0.0862, blue: 0.0862)

struct InitialScreen: View {
    var body: some View {
        NavigationStack {
            VStack (alignment: .center, spacing: 20.0) {
                Spacer()
                    .frame(height: 20.0)
                Image("girly").resizable().frame(width: 200, height: 200, alignment: .center)
                Spacer()
                    .frame(height: 30.0)
                Text("Welcome to SongSearch!").foregroundStyle(.white).font(.system(size: 50)).fontWeight(.bold).multilineTextAlignment(.center)
                Text("Can't remember the words? Don't fret, I'm the lyric whisperer, your musical Rosetta Stone!").foregroundStyle(.white).multilineTextAlignment(.center)
                Spacer()
                NavigationLink {
                    InstructionScreen()
                } label: {
                    Text("Onwards!")
                        .padding(.horizontal, 115)
                        .padding(.vertical)
                }
                .foregroundStyle(.white)
                .background(.red)
                .cornerRadius(10)
                Spacer()
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background {
                dark_grey.ignoresSafeArea()
            }
        }
    }
}

struct InitialScreen_Previews: PreviewProvider {
    static var previews: some View {
        InitialScreen()
    }
}
