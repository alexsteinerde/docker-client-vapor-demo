import Vapor

func routes(_ app: Application) throws {
    app.post("deploy") { req throws -> EventLoopFuture<DeployResponse> in
        let deploy = try req.content.decode(DeployRequest.self)
        
        return try req.dockerClient.images.pullImage(byName: deploy.imageName, tag: deploy.imageTag ?? "latest")
            .and(try req.dockerClient.services.get(serviceByNameOrId: deploy.serviceName))
            .hop(to: req.eventLoop)
            .flatMap({ image, service in
                try req.dockerClient.services.update(service: service, newImage: image)
            })
            .map({ (service) in
                DeployResponse(success: true, imageDigest: service.image.digest?.rawValue)
            })
    }
}

struct DeployRequest: Content {
    let serviceName: String
    let imageName: String
    let imageTag: String?
}

struct DeployResponse: Content {
    let success: Bool
    let imageDigest: String?
}
