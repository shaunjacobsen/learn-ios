//
//  Shapes.swift
//  Bullseye
//
//  Created by Shaun Jacobsen on 11/01/2021.
//

import SwiftUI

struct Shapes: View {
  var body: some View {
    VStack {
      Circle()
        .inset(by: 10)
//        .stroke(Color.white, lineWidth: 20)
        .strokeBorder(Color.white, lineWidth: 10 )
//        .fill(Color.blue)
        .frame(width: 200, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .center)
    }
    .background(Color.green)
  }
}

struct Shapes_Previews: PreviewProvider {
  static var previews: some View {
    Shapes()
  }
}
