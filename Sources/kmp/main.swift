import Foundation

do {
    let task = Process()
    let pipe = Pipe()

    task.standardOutput = pipe
    task.standardError = pipe

    /* I know the executable is located at /usr/local/bin, but I believe using
     `task.executableURL = URL(fileURLWithPath: "Users/clemensbeck/.tuist/Versions/3.28.0/tuist")`
     would trigger `Error Domain=NSPOSIXErrorDomain Code=13 "Permission denied"`.
     Need to come up with better and especially version agnostic method.
     */
    task.executableURL = URL(fileURLWithPath: "/Users/clemensbeck/.tuist/Versions/3.28.0/tuist")
    task.environment?["TUIST_DEV_KOTLIN_APPS"] = "true"
    task.environment?["TUIST_CONFIG_FORCE_CONFIG_CACHE_DIRECTORY"] = "/Users/clemensbeck/.tuist/Cache"
    task.arguments = ["generate"]

    try task.run()

    let data = pipe.fileHandleForReading.readDataToEndOfFile()
    let output = String(data: data, encoding: .utf8)!

    print(output)
} catch {
    print(error)
}

