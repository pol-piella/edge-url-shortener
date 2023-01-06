import Compute

try await onIncomingRequest { req, res in
    try await res.status(200).send("Hello World!")
}
