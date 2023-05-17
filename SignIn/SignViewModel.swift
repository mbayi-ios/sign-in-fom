import Foundation

final class SignViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var isSigningIn = false

    @Published var hasError = false

    var canSignIn: Bool {
        !email.isEmpty && !password.isEmpty
    }

    func signIn() {
        guard canSignIn else {
            return
        }

        var request = URLRequest(url: URL(string: "https://dummyjson.com/auth/login")!)

        request.httpMethod = "POST"

        let authData = (email + ":" + password).data(using: .utf8)!.base64EncodedString()
        request.addValue("Basic \(authData)", forHTTPHeaderField: "Authorization")

        isSigningIn = true

        URLSession.shared.dataTask(with: request) { [weak self] data, response, error  in
            DispatchQueue.main.async {
                if error != nil  || (response as? HTTPURLResponse)?.statusCode != 200 {
                    self?.hasError = true
                } else if let data = data {
                    do {
                        let signInResponse = try JSONDecoder().decode(SignInResponse.self, from: data)
                        print(signInResponse)
                    } catch {
                        self?.hasError = true
                        print("unable to decode response \(error)")
                    }
                }

                self?.isSigningIn = false
            }
        }.resume()

    }

}
