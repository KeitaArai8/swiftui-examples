import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Examples")) {
                    NavigationLink("TagListView",destination: TagListView())
                    NavigationLink("DemoScrollViewOffsetView",destination: DemoScrollViewOffsetView())
                    NavigationLink("SecureInputView",destination: SecureInputView())
                    NavigationLink("TextFieldKeyboardToolbarView",destination: TextFieldKeyboardToolbarView())
                    NavigationLink("AutoLiftKeyboardView",destination: AutoLiftKeyboardView())
                    NavigationLink("CustomTabView",destination: CustomTabView())
                }
            }
          .navigationBarTitle("SwiftUI Examples")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
