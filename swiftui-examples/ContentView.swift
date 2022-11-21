import SwiftUI

struct ContentView: View {
    @State private var isActive : Bool = false
    
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
                    NavigationLink("FixedTextView",destination: FixedTextView())
                    NavigationLink("DynamicallyHidingView",destination: DynamicallyHidingView())
                    NavigationLink("CustomScrollTabView",destination: CustomScrollTabView())
                    NavigationLink("PopToRootNavigationView",destination: PopToRootNavigationView(), isActive: self.$isActive)
                }
                Section(header: Text("Examples2")) {
                    NavigationLink("RefreshableScrollView",destination: RefreshableScrollView())
                    NavigationLink("CustomBadgeView",destination: CustomBadgeView())
                }
            }
          .navigationBarTitle("SwiftUI Examples")
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .environment(\.rootPresentationMode, self.$isActive)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
