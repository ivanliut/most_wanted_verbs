//
//  VerbDetail.swift
//  FrenchZarisovki
//
//  Created by Ivan Liutko on 27.09.2020.
//

import SwiftUI

struct VerbDetail: View {
    var conjugaison: Dictionary<String, String>
    
    @State var draggedVal = ""
    
    @State var middleBtnVisible = true
    
//    var drag: some Gesture {
//        DragGesture(minimumDistance: 5.0)
//            .onChanged { _ in self.isDragging = true }
//            .onEnded { _ in self.isDragging = false }
//    }
    
    
    var dragLeft: some Gesture {
        DragGesture(minimumDistance: 5.0)
            .onEnded { value in
                print("Left Button")
                let horizontalAmount = value.translation.width as CGFloat
                let verticalAmount = value.translation.height as CGFloat
                
                if abs(horizontalAmount) > abs(verticalAmount) {
                    print(horizontalAmount < 0 ? "left swipe" : "right swipe")
                } else {
                    self.draggedVal = "LEFT"
                    print(verticalAmount < 0 ? "up swipe" : "down swipe")
                }
            }
    }
    
    
    var dragMiddle: some Gesture {
        DragGesture(minimumDistance: 5.0)
            .onEnded { value in
                print("Middle Button")
                let horizontalAmount = value.translation.width as CGFloat
                let verticalAmount = value.translation.height as CGFloat
                
                if abs(horizontalAmount) > abs(verticalAmount) {
                    print(horizontalAmount < 0 ? "left swipe" : "right swipe")
                } else {
                    self.draggedVal = "MIDDLE"
                    withAnimation() {
                        middleBtnVisible = false
                    }
                    
                    print(verticalAmount < 0 ? "up swipe" : "down swipe")
                }
            }
    }
    
    var dragRight: some Gesture {
        DragGesture(minimumDistance: 5.0)
            .onEnded { value in
                print("Right Button")
                let horizontalAmount = value.translation.width as CGFloat
                let verticalAmount = value.translation.height as CGFloat
                
                if abs(horizontalAmount) > abs(verticalAmount) {
                    print(horizontalAmount < 0 ? "left swipe" : "right swipe")
                } else {
                    self.draggedVal = "RIGHT"
                    print(verticalAmount < 0 ? "up swipe" : "down swipe")
                }
            }
    }
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text(draggedVal)
                
                Spacer()
                HStack {
                    GroupBox {
                        Text("Left Button")
                    }
                    .gesture(dragLeft)
                    
                    if middleBtnVisible {
                        GroupBox {
                            Text("Middle Button")
                        }
                        .gesture(dragMiddle)
                        .opacity(middleBtnVisible ? 0.7 : 0)
                    }
                    
                    
                    GroupBox {
                        Text("Right Button")
                    }
                    .gesture(dragRight)
                }
            }
            .padding()
            VStack(alignment: .leading, spacing: 20) {
                Text("\(Person.je.rawValue) \(conjugaison[Person.je.rawValue] ?? "")")
                Text("\(Person.tu.rawValue) \(conjugaison[Person.tu.rawValue] ?? "")")
                Text("\(Person.il.rawValue) \(conjugaison[Person.il.rawValue] ?? "")")
                Text("\(Person.nous.rawValue) \(conjugaison[Person.nous.rawValue] ?? "")")
                Text("\(Person.vous.rawValue) \(conjugaison[Person.vous.rawValue] ?? "")")
                Text("\(Person.ils.rawValue) \(conjugaison[Person.ils.rawValue] ?? "")")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .foregroundColor(.white)
            .edgesIgnoringSafeArea(.all)
            .onAppear(perform: {
                conjugaison.forEach({
                    print($0)
                })
        })
        }
    
    }
}

struct VerbDetail_Previews: PreviewProvider {
    static var previews: some View {
        VerbDetail(conjugaison: verbsData[0].conjugaison)
    }
}
