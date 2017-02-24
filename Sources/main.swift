import Kitura
import HeliumLogger
import LoggerAPI
import KituraStencil


let logger = HeliumLogger()
logger.colored = true
Log.logger = logger

Log.verbose("This is a verbose log message.")
Log.info("This is an informational log message.")
Log.warning("This is a warning.")
Log.error("This is an error.")
Log.debug("This is a debug message.")


let router = Router()
router.setDefault(templateEngine: StencilTemplateEngine())

router.all("/") {
    request, response, next in
    response.send("Hey!")
    next()
}

router.all("/") {
    request, response, next in
    response.send("Still Here!")
    next()
}

router.all("/forbidden") {
    request, response, next in
    try response.send("Hey! You are in the forbidden route.").end()
}

router.all("/forbidden") {
    request, response, next in
    try response.send("Are you still here?.").end()
}


router.all("/html") {
    request, response, next in
    response.send("<html><head><title>My Server</title></head><body><h1>Welcome to my server</h1> <p>My server is running correctly.</p></body></html>")
    next()
}


router.get("/render") {
    request, response, next in
    try response.render("home", context: [:])
    next()
}





Kitura.addHTTPServer(onPort: 8090, with: router)
Kitura.run()

