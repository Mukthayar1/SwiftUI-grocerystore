import SwiftUI

struct ContentView: View {
    
    @StateObject var mainVm = MainViewModal.shared;
    
    var body: some View {
        NavigationView{
            if mainVm.isUserLoggedIn {
                MainTabView()
            }else{
                WelcomeView()
            }
        }
    }
}

#Preview {
    ContentView()
}
