import Vapor
import DockerClientSwift

// configures your application
public func configure(_ app: Application) throws {
    // register routes
    try routes(app)
}
