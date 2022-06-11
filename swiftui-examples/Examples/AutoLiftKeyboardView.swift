import SwiftUI

struct AutoLiftKeyboardView: View {
    @State var text = ""
    @State var workLift = true
    var body: some View {
        if workLift {
            VStack(alignment: .leading) {
                Text("Work Auto Lift Keyboard TextField")
                TextField("placeholder", text: self.$text)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("Not Work Auto Lift Keyboard") {
                    self.workLift.toggle()
                }
            }
            .padding()
            .ignoresSafeArea(.keyboard, edges: .bottom)
        } else {
            GeometryReader { _ in
                VStack(alignment: .leading) {
                    Spacer()
                    Text("Not Work Auto Lift Keyboard TextField")
                    TextField("placeholder", text: self.$text)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button("Work Auto Lift Keyboard") {
                        self.workLift.toggle()
                    }
                    Spacer()
                }
            }
            .padding()
            .ignoresSafeArea(.keyboard, edges: .bottom)
        }
    }
}

struct AutoLiftKeyboardView_Previews: PreviewProvider {
    static var previews: some View {
        AutoLiftKeyboardView()
    }
}
