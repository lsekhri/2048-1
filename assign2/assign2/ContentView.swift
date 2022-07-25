//
//  ContentView.swift
//  assign2
//
//  Created by Laksh Sekhri on 10/3/21.
//

import SwiftUI


struct scorev:View{
    private var score=0;
    init(_ inp: Int)
    {
        score=inp;
    }
    var body:some View{
        HStack(alignment: .center){
        Text("Score:")
        Text("\(score)")
    }
}
}


struct gamev:View{
   
    
    private var board: [[Tile]]
    init(_ input:[[Tile]])
    {
        board = input
    }
    
  
    var body:some View{
        var col:Color=Color.white
        VStack (spacing: 5){
        ForEach(0..<board.count) { i in
        HStack (spacing: 5) {
        ForEach(0..<board[0].count) { j in
            switch(board[i][j].val) {
               case 0:
                Text("\(board[i][j].val)").background(Rectangle().stroke().frame(width:40,height:40).background(col)).padding()
            case 2:
                Text("\(board[i][j].val)").background(Rectangle().stroke().frame(width:40,height:40).background(Color.green)).padding()
            case 4:
                Text("\(board[i][j].val)").background(Rectangle().stroke().frame(width:40,height:40).background(Color.blue)).padding()
            case 8:
                Text("\(board[i][j].val)").background(Rectangle().stroke().frame(width:40,height:40).background(Color.yellow)).padding()
            case 16:
                Text("\(board[i][j].val)").background(Rectangle().stroke().frame(width:40,height:40).background(Color.pink)).padding()
            case 32:
                Text("\(board[i][j].val)").background(Rectangle().stroke().frame(width:40,height:40).background(Color.purple)).padding()
            case 64:
                Text("\(board[i][j].val)").background(Rectangle().stroke().frame(width:40,height:40).background(Color.red)).padding()
            case 128:
                Text("\(board[i][j].val)").background(Rectangle().stroke().frame(width:40,height:40).background(Color.red)).padding()
            case 256:
                Text("\(board[i][j].val)").background(Rectangle().stroke().frame(width:40,height:40).background(Color.pink)).padding()
            default:
                Text("\(board[i][j].val)").background(Rectangle().stroke().frame(width:40,height:40).background(Color.blue)).padding()
            }
  
        }
        }
        }
        }
}
}

struct ContentView: View {
    @StateObject var box: Twos=Twos()
    var body: some View {
        VStack{
            scorev(box.score)
            gamev(box.board);
            Button("UP"){
                box.collapse(dir:.up)
            }.frame(width:100,height:40).background(Color.green).cornerRadius(25)
            
            HStack{
                Button("LEFT"){
                    box.collapse(dir:.left)
                }.frame(width:100,height:40).background(Color.black).cornerRadius(25).padding()
                
                Button("RIGHT"){
                    box.collapse(dir:.right)
                }.frame(width:100,height:40).background(Color.red).cornerRadius(25).padding()
                
            }
            Button("DOWN"){
                box.collapse(dir:.down)
            }.frame(width:100,height:40).background(Color.yellow).cornerRadius(25)
            
            
            Button("NEW GAME"){
                box.newgame(box.over)
                
            }.frame(width:200,height:40).background(Color.pink).cornerRadius(25).padding(.top)
           
            Picker("testing", selection: $box.over) {
                Text("Determ").tag(false)
                Text("Random").tag(true)
            }
            .pickerStyle(SegmentedPickerStyle())
            .frame(width: 300, height: 100, alignment: .center)
            
        }.environmentObject(box)

    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()    }
}
