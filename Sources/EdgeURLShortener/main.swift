import Compute
import Upstash

try await onIncomingRequest { req, res in
    let secrets = try ConfigStore(name: "secrets")
    let redisClient = RedisClient(hostname: secrets.get("UPSTASH_HOST_NAME") ?? "", token: secrets.get("UPSTASH_TOKEN") ?? "")
    let newsletter: String = try await redisClient.get("newsletter")
    try await res.redirect(newsletter, permanent: true)
}
