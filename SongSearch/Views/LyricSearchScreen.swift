//
//  LyricSearchScreen.swift
//  SongSearch
//
//  Created by Breea Toomey on 12/15/23.
//

import SwiftUI
import UIKit
import Foundation

struct LyricSearchScreen: View {
    @State var songQuery: String = ""
    @State var artistQuery: String = ""
    @State var fullName: String  = ""
    @State var cover: String = ""
    @State var lyrics: String = ""
    
    var body: some View {
        VStack (alignment: .center, spacing: 0) {
            ZStack {
                Rectangle()
                    .foregroundColor(.red)
                    .frame(maxWidth: .infinity, maxHeight: 350)
                    .ignoresSafeArea()
                
                VStack {
                    AsyncImage(url: URL(string: cover)) { image in
                        image
                            .resizable()
                            .frame(width: 190, height: 190, alignment: .center)
                            .padding(.top, 20)
                    } placeholder: {
                        Image("headphone")
                            .resizable()
                            .frame(width: 190, height: 190, alignment: .center)
                    }
                    
                    Text(fullName)
                        .foregroundStyle(.black)
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding(.bottom)
                    
                    Spacer()
                }
            }
            .padding(.bottom, 70)
            
            
            HStack {
                TextField("", text: $songQuery, prompt: Text("song").foregroundColor(.white))
                    .padding([.top, .leading, .bottom])
                    .background(Color(red: 0.212, green: 0.212, blue: 0.212))
                    .cornerRadius(10)
                TextField("", text: $artistQuery, prompt: Text("artist").foregroundColor(.white))
                    .padding([.top, .leading, .bottom])
                    .background(Color(red: 0.212, green: 0.212, blue: 0.212))
                    .cornerRadius(10)
                Button(action: {fetchSongID()}) {
                    Label("", systemImage: "arrow.right")
                }
                .padding(.all)
                .background(Color(red: 0.212, green: 0.212, blue: 0.212))
                .cornerRadius(10)
            }
            .padding(.horizontal)
            .padding(.top, -100)
            .padding(.bottom, 0)
            .foregroundStyle(.white)
            
            ScrollView {
                Text(lyrics)
                    .foregroundStyle(Color(.lightGray))
                    .multilineTextAlignment(.center)
                    .padding(.bottom)
                    .padding(.horizontal)
                    .padding(.top, 35)
            }
            .padding(.top, -40)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            dark_grey.ignoresSafeArea()
        }
    }
    
    func fetchSongID() {
        let headers = [
            "X-RapidAPI-Key": "70ba302075mshfb7d67c7123bc3dp18ec72jsnaff9941d8bc0",
            "X-RapidAPI-Host": "genius-song-lyrics1.p.rapidapi.com"
        ]
        
        let songQueryReq = songQuery.replacingOccurrences(of: " ", with: "%20")
        let artistQueryReq = artistQuery.replacingOccurrences(of: " ", with: "%20")
        let reqString = "https://genius-song-lyrics1.p.rapidapi.com/search/?q=\(songQueryReq.lowercased())%20\(artistQueryReq.lowercased())&per_page=1&page=1"

        let request = NSMutableURLRequest(url: NSURL(string: reqString)! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        func getSongDetails(completion: @escaping (Int) -> Void) {
            URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in
                if let data = data {
                    do {
                        let res = try JSONDecoder().decode(SongResponse.self, from: data)
                        cover = res.hits[0].result.song_art_image_url
                        fullName = res.hits[0].result.full_title
                        let SongID = res.hits[0].result.id
                        completion(SongID)
                    } catch let error {
                       print(error)
                    }
                 }
             }.resume()
        }
        
        getSongDetails() { SongID in
            let reqLyricsString = "https://genius-song-lyrics1.p.rapidapi.com/song/lyrics/?id=\(SongID)&text_format=plain"
            print(reqLyricsString)
            let request_lyrics = NSMutableURLRequest(url: NSURL(string: reqLyricsString)! as URL,
                                                    cachePolicy: .useProtocolCachePolicy,
                                                timeoutInterval: 10.0)
            request_lyrics.httpMethod = "GET"
            request_lyrics.allHTTPHeaderFields = headers

            URLSession.shared.dataTask(with: request_lyrics as URLRequest) { data, response, error in
                if let data = data {
                    do {
                        let res = try JSONDecoder().decode(LyricResponse.self, from: data)
                        print(res)
                        lyrics = res.lyrics.lyrics.body.plain
                    } catch let error {
                       print(error)
                    }
                 }
             }.resume()
          }
        }
    }
    


struct LyricSearchScreen_Previews: PreviewProvider {
    static var previews: some View {
        LyricSearchScreen()
    }
}
