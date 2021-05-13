//
//  ContentView.swift
//  Twitter
//
//  Created by Lucas Parreira on 3/05/21.
//

import SwiftUI

extension Color {
    static var twitterBlue:Color = Color(red:20/255, green:161/255, blue:241/255)
}

struct ContentView: View {
    private let tweets: [Tweet] = [
        Tweet(authorName: "Taysa Parreira", authorUsername: "taysaparreira", timestampText: "4h", text: "BBB21 ta impressionante. Quem ja votou pra esse proximo paredão? #BBB21 #paredaoBBB21", numberOfReplies: 2, numberOfRetweets: 0, numberOfLikes: 132),
        Tweet(authorName: "Taysa Parreira", authorUsername: "taysaparreira", timestampText: "9h", text: "Fé em Deus e vamos trabalhar.🙏🏻", numberOfReplies: 2, numberOfRetweets: 0, numberOfLikes: 7),
        Tweet(authorName: "Taysa Parreira", authorUsername: "taysaparreira", timestampText: "10h", text: "Good morning!😇", numberOfReplies: 0, numberOfRetweets: 0, numberOfLikes: 1),
        Tweet(authorName: "Lucas Parreira", authorUsername: "parreira_lucas", timestampText: "1h", text: "XCode é que nem kinder ovo - a cada novo projeto, uma surpresa diferente.", numberOfReplies: 2, numberOfRetweets: 0, numberOfLikes: 14),
        Tweet(authorName: "Lucas Parreira", authorUsername: "parreira_lucas", timestampText: "10h", text: "Java pra mim é uma boa linguagem, só voto nela pra sair da casa por questão de afinidade mesmo. 😅", numberOfReplies: 2, numberOfRetweets: 0, numberOfLikes: 2),Tweet(authorName: "Taysa Parreira", authorUsername: "taysaparreira", timestampText: "4h", text: "BBB21 ta impressionante. Quem ja votou pra esse proximo paredão? #BBB21 #paredaoBBB21", numberOfReplies: 2, numberOfRetweets: 0, numberOfLikes: 132),
        Tweet(authorName: "Taysa Parreira", authorUsername: "taysaparreira", timestampText: "9h", text: "Fé em Deus e vamos trabalhar.🙏🏻", numberOfReplies: 2, numberOfRetweets: 0, numberOfLikes: 7),
        Tweet(authorName: "Taysa Parreira", authorUsername: "taysaparreira", timestampText: "10h", text: "Good morning!😇", numberOfReplies: 0, numberOfRetweets: 0, numberOfLikes: 1),
        Tweet(authorName: "Lucas Parreira", authorUsername: "parreira_lucas", timestampText: "1h", text: "XCode é que nem kinder ovo - a cada novo projeto, uma surpresa diferente.", numberOfReplies: 2, numberOfRetweets: 0, numberOfLikes: 14),
        Tweet(authorName: "Lucas Parreira", authorUsername: "parreira_lucas", timestampText: "10h", text: "Java pra mim é uma boa linguagem, só voto nela pra sair da casa por questão de afinidade mesmo. 😅", numberOfReplies: 2, numberOfRetweets: 0, numberOfLikes: 2)
    ]
    
    @State private var selectedTab = 0
    
    var body: some View {
        
        ZStack {
            TabView(selection: $selectedTab,
                    content:  {
                        FeedView(tweets: tweets).tabItem { Image(systemName: "house") }.tag(0)
                        Text("Tab Content").tabItem { Image(systemName: "magnifyingglass") }.tag(1)
                        Text("Tab Content").tabItem { Image(systemName: "bell") }.tag(2)
                        Text("Tab Content").tabItem { Image(systemName: "envelope") }.tag(3)
                        
                    }
            ).accentColor(.twitterBlue)
            
            VStack {
                Spacer()
                HStack{
                    Spacer()
                    newTweetButton()
                        .padding(.bottom,65)
                        .padding(.trailing)
                }
            }
        }
    }
}

struct FeedView: View {
    let tweets: [Tweet]
    
    var body: some View {
        NavigationView{
            List(tweets){ tweet in
                TweetView(tweet: tweet)
            }
            .listStyle(PlainListStyle())
            .navigationBarTitle("Twitter", displayMode: .inline)
            .navigationBarItems(leading: Button(action:{}){
                Image(systemName: "person.crop.circle.fill")
                    .foregroundColor(.twitterBlue)
            }, trailing: Button(action:{}) {
                Image(systemName: "moon.stars")
                    .foregroundColor(.twitterBlue)
            })
        }
    }
}

struct TweetView: View {
    let tweet: Tweet
    
    var body: some View {
        HStack(alignment:.top){
            Image(systemName: "person.crop.circle.fill")
                .font(.system(size: 55))
                .padding(.top)
                .padding(.trailing, 5)
                .foregroundColor(.twitterBlue)
            
            VStack(alignment: .leading){
                HStack{
                    Text(tweet.authorName)
                        .bold()
                        .lineLimit(1)
                    Text("@\(tweet.authorName) • \(tweet.timestampText)")
                        .lineLimit(1)
                        .truncationMode(.middle)
                        .foregroundColor(.gray)
                }
                .padding(.top, 5)
                
                Text(tweet.text)
                    .lineLimit(nil)
                    .multilineTextAlignment(.leading)
                
                TweetActionsView(tweet: tweet)
                    .foregroundColor(.gray)
                    .padding([.bottom, .top],10)
                    .padding(.trailing,30)
            }
        }
    }
}

struct TweetActionsView: View {
    let tweet:Tweet
    var body: some View {
        HStack{
            Button(action: {}){
                Image(systemName: "message")
            }
            Text(tweet.numberOfReplies > 0 ? "\(tweet.numberOfReplies)" : "")
            Spacer()
            
            Button(action: {}){
                Image(systemName: "arrow.2.squarepath")
            }
            Text(tweet.numberOfRetweets > 0 ? "\(tweet.numberOfRetweets)" : "")
            Spacer()
            
            Button(action: {}){
                Image(systemName: "heart")
            }
            Text(tweet.numberOfLikes > 0 ? "\(tweet.numberOfLikes)" : "")
            Spacer()
            
            Button(action: {}){
                Image(systemName: "square.and.arrow.up")
            }
        }
    }
  }

struct newTweetButton:View {
    var body: some View{
        Button(action:{}){
            Image(systemName: "pencil")
                .font(.largeTitle)
                .foregroundColor(.white)
                .padding()
        }
        .background(Color.twitterBlue)
        .mask(Circle())
        .shadow(radius: 5)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
