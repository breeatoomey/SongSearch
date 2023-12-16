//
//  InstructionScreen.swift
//  SongSearch
//
//  Created by Breea Toomey on 12/15/23.
//

import SwiftUI

struct InstructionScreen: View {
    var body: some View {
        NavigationStack {
            VStack (alignment: .center, spacing: 20.0) {
                Spacer()
                    .frame(height: 20.0)
                Image("note").resizable().frame(width: 200, height: 200, alignment: .center)
                Spacer()
                    .frame(height: 30.0)
                Text("All Your Favorites").foregroundStyle(.white).font(.system(size: 40)).fontWeight(.bold).multilineTextAlignment(.center)
                Text("Simply input your desired song and its artist to see the lyrics!").padding(.horizontal, 5).foregroundStyle(.white).multilineTextAlignment(.center)
                Spacer()
                NavigationLink {
                    LyricSearchScreen()
                } label: {
                    Text("Continue")
                        .padding(.horizontal, 115)
                        .padding(.vertical)
                }
                .foregroundStyle(.white)
                .background(.red)
                .cornerRadius(10)
                Spacer()
                    .frame(height: 10)
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background {
                dark_grey.ignoresSafeArea()
            }
        }
    }
}

struct InstructionScreen_Previews: PreviewProvider {
    static var previews: some View {
        InstructionScreen()
    }
}
