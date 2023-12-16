# SongSearch

## Project Overview
SongSearch is a mobile application developed using Swift and SwiftUI. It provides a streamlined interface for users to search for song lyrics based on song titles or artist names. Upon successful search, the application renders the full lyrics alongside the corresponding album artwork for visual reference. The app's primary objective is to facilitate rapid and effortless access to song lyrics, prioritizing user friendliness.

## Feature Specification 
- SongSearch includes 3 differnt pages:
  - Opening page: The user is greeted with a brief description of the app and is prompted to continue through the view stack.
  - Instruction page: Breifly describes to the user how to operate the lyric search functionality.
  - Lyric search page
- On the lyric search page, there are two text input fields, one corresponding to song title and the other to artist name.
- After the user fills in the above fields and after they click the submit button to the right of the screen, a call is made to the genius API with the requested information.
- When the http is returned and after it is decoded, the UI displays the lyrics corresponding to the request.
- Along with this, the proper title of the song along with its album art are displayed for the user at the top of the screen.

## Technical Specification
SongSearch was developed with Swift and SwiftUI and derives its data from the Genius API. 
