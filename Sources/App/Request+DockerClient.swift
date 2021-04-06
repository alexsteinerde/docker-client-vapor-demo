import Vapor
import DockerClientSwift

extension Request {
    var dockerClient: DockerClient {
        DockerClient(client: self.application.http.client.shared, logger: self.logger)
    }
}

extension DockerError: AbortError {
    public var status: HTTPResponseStatus {
        .internalServerError
    }
    
    public var reason: String {
        switch self {
        case .message(let message):
            return message
        case .errorCode(let code, let message):
            return message ?? "Error: \(code)"
        case .unknownResponse(let message):
            return message
        }
    }
}
