//
//  Home.swift
//  UI-130
//
//  Created by にゃんにゃん丸 on 2021/02/20.
//

import SwiftUI

struct Home: View {
    var body: some View {
        
        
        ScrollView(.vertical, showsIndicators: false, content: {
            
            LazyVStack(spacing: 15, pinnedViews: [.sectionFooters], content: {
                
                Section(footer: FooterView(),content: {
                    
                    HStack{
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Image(systemName: "chevron.left")
                                .font(.title)
                                
                        })
                        Spacer()
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Image(systemName: "bookmark.fill")
                                .font(.title)
                                
                        })
                    }
                        .overlay(
                            
                            Text("Detatil Movie")
                                .font(.title)
                                .fontWeight(.heavy)
                        
                        )
                        .foregroundColor(.white)
                        .padding()
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color.white.opacity(0.2))
                            .padding(.horizontal)
                            .offset(y: 15)
                        
                        
                        Image("p1")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            
                            .cornerRadius(15)
                    }
                    .frame(width: getsize().width / 1.6, height: getsize().height / 2)
                    
                    VStack(alignment: .leading, spacing: 15, content: {
                        Text("Prince Movie")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                        
                        Text("Directer : Queen | 5")
                            .foregroundColor(.white)
                            .overlay(
                            
                                HStack{
                                    
                                    ForEach(1...5,id:\.self){i in
                                        
                                        Image(systemName: "star.circle.fill")
                                            .foregroundColor(.yellow)
                                            .offset(x: 150, y: -2.5)
                                        
                                    }
                                    
                                    
                                }
                            
                                ,alignment: .trailing
                            )
                        
                        
                        LazyVGrid(columns: [GridItem(.adaptive(minimum:80))], alignment: .leading, spacing: 8, content: {
                            
                            ForEach(genre,id:\.self){index in
                                
                                Text(index)
                                    .font(.caption)
                                    .padding(.vertical,10)
                                    .frame(maxWidth: .infinity)
                                    .background(Color.white.opacity(0.2))
                                    .clipShape(Capsule())
                               
                            }
                            
                            
                        })
                        .padding(.top,20)
                        
                        Text("Synopics")
                            .font(.title)
                            .padding(.vertical)
                            .foregroundColor(.blue)
                        
                        Text(synopics)
                           
                            .foregroundColor(.white)
                        
                        
                        
                    })
                    .padding(.top,55)
                    .padding(.leading,10)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    
                    
                    
                })
                
               
                
                
                
                
               
                
                
               
            })
            
        })
        .background(Color.purple.opacity(0.6).ignoresSafeArea())
        .navigationBarHidden(true)
        
     
            
           
      
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct FooterView : View {
    var body: some View{
        
        NavigationLink(
            destination: BookingView(),
            label: {
                
               
                    Text("By Ticket")
                        .bold()
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: getsize().width / 2)
                        .background(Color.blue)
                        .clipShape(Capsule())
              
                
            })
            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 5, y: 5)
            .shadow(color: Color.white.opacity(0.3), radius: 5, x: -5, y: -5)
        
        
    }
}

extension View{
    
    
    func getsize()->CGRect{
        
        return UIScreen.main.bounds
    }
}
