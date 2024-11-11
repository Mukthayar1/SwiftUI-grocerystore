import SwiftUI
import Combine

struct KeyboardResponsiveModifier: ViewModifier {
    @State private var currentOffset: CGFloat = 0
    
    func body(content: Content) -> some View {
        content
            .offset(y: -currentOffset)
            .animation(.easeOut(duration: 0.3), value: currentOffset)
            .onAppear {
                // Listen to keyboard events
                NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { notification in
                    if let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
                        withAnimation {
                            currentOffset = keyboardFrame.height
                        }
                    }
                }
                
                NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { _ in
                    withAnimation {
                        currentOffset = 0
                    }
                }
            }
            .onDisappear {
                NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
                NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
            }
    }
}

// Extension to easily apply the keyboard responsive modifier
extension View {
    func keyboardResponsive() -> some View {
        self.modifier(KeyboardResponsiveModifier())
    }
}
