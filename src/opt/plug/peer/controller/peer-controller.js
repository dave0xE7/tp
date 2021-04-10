
const express = require('express')
const app = express()
const port = 3000

var hosts = [];

function QueryHostid (hostid) {
    console.log("QueryHostid: "+hostid);
    var response = "";

    if (hosts[hostid] !== undefined) {

        hosts[hostid].calls = hosts[hostid].calls +1;

        if (hosts[hostid].buffer !== undefined) {
            response= hosts[hostid].buffer;
            delete hosts[hostid].buffer;
        }

    } else {
        hosts[hostid] = {"calls": 1};
    }

    console.table(hosts);

    return response;
}

app.get('/', (req, res) => {

    if (req.query.hostid) {
        var hostid = req.query.hostid;
        if (hostid.length == 64) {
            res.send(''+QueryHostid(hostid));
        } else {
            res.send('echo nope');
        }
    } else {
        res.send('echo nope');
    }
})

app.get('/msg', (req, res) => {
    if (req.query.host) {
        console.log(req.query);
        console.log(req.query.buffer);
        hosts[req.query.host].buffer = req.query.buffer;
        res.send("ok");
        console.table(hosts);
    }
})

app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`)
})

