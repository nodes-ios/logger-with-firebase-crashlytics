import Foundation
import os.log
import Firebase
import Logger

public final class FirebaseLogService {
    public let minLevel: LogLevel
    
    public init(minLevel: LogLevel = .error) {
        self.minLevel = minLevel
    }

    public func log(level: LogLevel, log: String, context: CustomStringConvertible?) {
        guard level >= minLevel else { return }
        if let context = context {
            Crashlytics.crashlytics().setCustomValue(context, forKey: "context")
        }
        switch level {
        case .default, .debug, .info:
            Crashlytics.crashlytics().log(log)
        case .error, .fault:
            let error = NSError(
                domain: context?.description ?? "Unkown", code: -1001, userInfo: ["message": log])
            Crashlytics.crashlytics().record(error: error)
        }
    }
}

public extension LoggingServiceClient {
    static func firebase(minLevel: LogLevel = .error) -> LoggingServiceClient {
        let logService = FirebaseLogService(minLevel: minLevel)
        return LoggingServiceClient(log: logService.log(level:log:context:))
    }
}
