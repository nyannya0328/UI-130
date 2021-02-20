//
//  BookingView.swift
//  UI-130
//
//  Created by にゃんにゃん丸 on 2021/02/20.
//

import SwiftUI

struct BookingView: View {
    
    @State var  BookedSelect : [Int] = [1,20,30,48,59,60]
    @State var selectedseat : [Int] = []
    
    @State var date : Date = Date()
    @State var selectedtime = "8:30"
    @Environment(\.presentationMode) var present
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            HStack{
                
                Button(action: {
                    
                    present.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "chevron.left")
                        .font(.title)
                })
                
                Spacer()
                .overlay(
                    Text("Select Seat")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    
                )
                .foregroundColor(.white)
               
            }
            .padding()
          
            
            
            GeometryReader{reader in
                
                let width = reader.frame(in:.global).width
                
                Path{path in
                    
                    path.move(to: CGPoint(x: 0, y: 50))
                    path.addCurve(to: CGPoint(x: width, y: 50), control1: CGPoint(x: width / 2, y: 0), control2: CGPoint(x: width / 2, y: 0))
                    
                   
                    
                    
                    
                    
                }
             
                .stroke(Color.black,lineWidth: 2)
                
                
            }
            
            .frame(height: 50)
            .padding(.top,20)
            .padding(.horizontal,35)
            
            let totalseat = 60 + 4
            let leftSide = 0..<totalseat / 2
            let RightSide = totalseat/2..<totalseat
            
            HStack(spacing:30){
                let columns = Array(repeating: GridItem(.flexible(),spacing: 10), count: 4)
                
                LazyVGrid(columns: columns,spacing: 13, content: {
                    
                    ForEach(leftSide,id:\.self){index in
                        
                        let seat = index >= 29 ? index - 1 : index
                        
                        SeatView(index: index, seat: seat, selectedseat: $selectedseat, bookedSeat: $BookedSelect)
                        .onTapGesture {
                            if selectedseat.contains(seat){
                                
                                selectedseat.removeAll { (removeseat) -> Bool in
                                    return removeseat == seat
                                }
                                return
                                
                            }
                            selectedseat.append(seat)
                            
                        }
                            .disabled(BookedSelect.contains(seat))
                        
                        
                        
                    }
                    
                    
                })
                
                LazyVGrid(columns: columns,spacing: 13, content: {
                    
                    ForEach(RightSide,id:\.self){index in
                        
                        let seat = index >= 35 ? index - 2 : index - 1
                        
                      SeatView(index: index, seat: seat, selectedseat: $selectedseat, bookedSeat: $BookedSelect)
                        .onTapGesture {
                            if selectedseat.contains(seat){
                                
                                selectedseat.removeAll { (removeseat) -> Bool in
                                    return removeseat == seat
                                }
                                return
                                
                            }
                            selectedseat.append(seat)
                            
                        }
                            .disabled(BookedSelect.contains(seat))
                        
                        
                        
                    }
                    
                  
                    
                    
                })
            }
            .padding()
            .padding(.top,30)
            
            HStack(spacing:15){
                
                
                RoundedRectangle(cornerRadius: 4)
                    .stroke(Color.purple,lineWidth: 2)
                    .frame(width: 20, height: 20)
                    .overlay(
                        Image(systemName: "xmark")
                            .font(.caption)
                            .foregroundColor(.black)
                    
                    )
                
                Text("Booked")
                    .font(.caption)
                    .foregroundColor(.white)
                
                
                RoundedRectangle(cornerRadius: 4)
                    .stroke(Color.purple,lineWidth: 2)
                    .frame(width: 20, height: 20)
                
                
                Text("Available")
                    .font(.caption)
                    .foregroundColor(.white)
                
                
                
                RoundedRectangle(cornerRadius: 4)
                    .fill(Color.blue)
                    .frame(width: 20, height: 20)
                    
                
                Text("Selected")
                    .font(.caption)
                    .foregroundColor(.white)
                
                
                
                
                
            }
            .padding(.top,25)
            
            HStack{
                
                Text("DATE :")
                    .font(.title3)
                    .bold()
                    .foregroundColor(.white)
                    .padding(.leading,20)
                
                Spacer()
                
                DatePicker("", selection: $date)
                    .labelsHidden()
                
                
                
            }
            .padding(.top,20)
            
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                
                HStack(spacing:12){
                    
                    ForEach(time,id:\.self){timing in
                        
                        Text(timing)
                            .bold()
                            .foregroundColor(.white)
                            .padding(.vertical)
                            .padding(.horizontal,30)
                            .background(Color.orange.opacity(selectedtime == timing ? 1 : 0.2))
                            .clipShape(Capsule())
                            .onTapGesture {
                                withAnimation{
                                    selectedtime = timing
                                }
                            }
                        
                        
                        
                        
                    }
                }
                .padding()
                .padding(.top,25)
                
                
            }
            HStack(spacing:15){
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    Text("\(selectedseat.count)seat")
                        .font(.caption)
                        .bold()
                        .foregroundColor(.white)
                    
                    Text("\(selectedseat.count * 2000)円")
                        
                        
                    
                }
                .frame(width: 100)
                
                
                Button(action: {}) {
                    
                    Text("By Ticet")
                        .bold()
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(15)
                        .shadow(color: Color.black.opacity(0.3), radius: 5, x: 5, y: 5)
                        .shadow(color: Color.white.opacity(0.3), radius: 5, x: -5, y: -5)
                    
                
                    
                }
                
            }
            .padding()
            .padding(.top,20)
            
            
            
            
        })
        .background(Color.blue.opacity(0.6).ignoresSafeArea())
        .navigationBarHidden(true)
        
    }
}

struct SeatView : View {
    
    var index : Int
    var seat : Int
    @Binding var selectedseat : [Int]
    @Binding var bookedSeat : [Int]
    var body: some View{
        
        ZStack{
            
            RoundedRectangle(cornerRadius: 6)
                .stroke(bookedSeat.contains(seat) ? Color.gray: Color.purple,lineWidth: 2)
                .frame(height: 30)
                .background(selectedseat.contains(seat) ? Color.blue : Color.clear)
                .opacity(index == 0 || index == 28 || index == 35 || index == 63 ? 0 : 1)
            
            if bookedSeat.contains(seat){
                
                Image(systemName: "xmark")
                    .foregroundColor(.gray)
            }
            
            
        }
        
        
    }
}

struct BookingView_Previews: PreviewProvider {
    static var previews: some View {
        BookingView()
    }
}
