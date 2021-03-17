//
//  VerbDetail.swift
//  FrenchZarisovki
//
//  Created by Ivan Liutko on 27.09.2020.
//

import SwiftUI

struct VerbDetail: View {
    var conjugaison: Array<VerbForm>
    
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
                    } // GROUPBOX
                    .gesture(dragLeft)
                    
                    if middleBtnVisible {
                        GroupBox {
                            Text("Middle Button")
                        } // GROUPBOX
                        .gesture(dragMiddle)
                        .opacity(middleBtnVisible ? 0.7 : 0)
                    }
                    
                    
                    GroupBox {
                        Text("Right Button")
                    } // GROUPBOX
                    .gesture(dragRight)
                } // HSTACK
            } // VSTACK
            .padding()
            
            VStack {
                ForEach(0 ..< conjugaison.count) { index in
                    Text("\(conjugaison[index].person) \(conjugaison[index].form)")
                }
            }
            
        } // ZSTACK
        .onAppear {
            conjugaison.forEach {
                print($0)
            }
            Person.allCases.forEach {
                print("[allCases] \($0)")
            }
        }
    
    }
}

struct VerbDetail_Previews: PreviewProvider {
    static var previews: some View {
        VerbDetail(conjugaison: verbsData[0].conjugaison)
    }
}
