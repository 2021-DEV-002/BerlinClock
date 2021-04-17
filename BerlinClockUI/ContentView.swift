//
//  ContentView.swift
//  BerlinClockUI
//
//  Created by Samy BENGHALEM on 16/04/2021.
//

import SwiftUI

struct ContentView: View {
    var rectangleWidth: CGFloat = 30.0
    var rectangleHeight: CGFloat = 100.0
    var rectangleCornerRadious: CGFloat = 25.0
    var cubeWidth: CGFloat = 100.0
    var cubeHeight: CGFloat = 100.0
    var cubeCornerRadious: CGFloat = 25.0
    
    @State var berlinDate: [String] = []
    @State var normalClock: String = ""
    
    var body: some View {
        VStack {
            if(berlinDate.count>0) {
                HStack {
                    Circle()
                        .fill(berlinDate[0] == "Y" ? Color.yellow : Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)))
                        .frame(width: 200, height: 200)
                }
                HStack {
                    ForEach((1..<5)) {i in
                        RoundedRectangle(cornerRadius: cubeCornerRadious, style: .continuous)
                            .fill(berlinDate[i] == "R" ? Color.red : Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)))
                            .frame(width: cubeWidth, height: cubeHeight)
                    }
                }
                HStack {
                    ForEach((5..<9)) {i in
                        RoundedRectangle(cornerRadius: cubeCornerRadious, style: .continuous)
                            .fill(berlinDate[i] == "R" ? Color.red : Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)))
                            .frame(width: cubeWidth, height: cubeHeight)
                    }
                }
                HStack {
                    Group {
                        ForEach((9..<20)) {i in
                            RoundedRectangle(cornerRadius: rectangleCornerRadious, style: .continuous)
                                .fill(berlinDate[i] == "Y" ? Color.yellow : (berlinDate[i] == "R" ? Color.red : Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1))))
                                .frame(width: rectangleWidth, height: rectangleHeight)
                        }
                    }
                }
                HStack {
                    ForEach((20..<24)) {i in
                        RoundedRectangle(cornerRadius: cubeCornerRadious, style: .continuous)
                            .fill(berlinDate[i] == "Y" ? Color.yellow : Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)))
                            .frame(width: cubeWidth, height: cubeHeight)
                    }
                }
                HStack {
                    Text(normalClock).fontWeight(.bold).font(.system(size: 60))
                }
            }
        }
        .onAppear {
            displayDate()
        }
    }
    
    
    func displayDate() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {_ in
            let date = Date()
            let calendar = Calendar.current
            let seconds = calendar.component(.second, from: date)
            let minutes = calendar.component(.minute, from: date)
            let hours = calendar.component(.hour, from: date)
            let berlinClock = BerlinClock()
            normalClock = "\(hours) : \(minutes) : \(seconds)"
            berlinDate = berlinClock.rawBerlinClock(hours, minutes, seconds).map{String($0)}
            print(berlinClock.berlinClock(hours, minutes, seconds))
        }).fire()
    }

}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
