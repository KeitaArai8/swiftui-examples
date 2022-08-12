import SwiftUI

struct DynamicallyHidingView: View {
    @State private var isHidden = false
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .opacity(isHidden ? 0 : 1)
            
            Spacer().frame(height: 20)
            
            Button("表示・非表示切り替え") {
                isHidden.toggle()
            }
        }
    }
}
