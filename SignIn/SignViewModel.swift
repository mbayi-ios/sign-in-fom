import Foundation

final class SignViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var isSigningIn = false

    var canSignIn: Bool {
        !email.isEmpty && !password.isEmpty
    }

    func signIn() {
        isSigningIn = true

        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(5)) {
            self.isSigningIn = false
        }
    }

}
