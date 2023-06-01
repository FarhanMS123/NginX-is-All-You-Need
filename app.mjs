import express from "express";

const app = express();
app.listen(process.env.PORT ?? 13485, function(){
    console.log(`Listening to ${ process.env.PORT ?? "::13485" }`);
    console.log(`Listening to ${ app.request.socket?.localPort }`);
});

app.use(function(req, res, next){
    console.log(`${new Date().getTime()}_1 ${ req.originalUrl } Hitted`)
    // console.log(`${new Date().getTime()}_2 ${ req.baseUrl } Hitted`)
    // console.log(`${new Date().getTime()}_3 ${ req.url } Hitted`)
    next();
})

// 100, 200, 201, 202, 204, 205
// 400, 401, 403, 404, 405, 406
// 500, 501, 502, 503, 504

app.all("/verify/:code", function(req, res, next){
    res.status(req.params.code)

    if(/(1|2)\d\d/.test(req.params.code))
        res.json({message: "should continue forward"})
    else if (/4\d\d/.test(req.params.code))
        res.json({message: "should block request"})
    
    // console.log(`${new Date().getTime()} /verify/${req.params.code} Hitted`)
});

app.all("/endpoint", function(req, res, next){
    res.send("I am here")
    // console.log(`${new Date().getTime()} /endpoint Hitted`)
})