/**
 * 
 */
const fs = require('fs');
const child_process = require('child_process');

// function RunExec (cmd) {
//     child_process.exec(cmd, (e, stdout, stderr)=> {
//         if (e instanceof Error) {
//             console.error(e);
//             throw e;
//         }
//         console.log('stdout ', stdout);
//         console.log('stderr ', stderr);
//     });
// }

function RunExec (cmd) {
    child_process.exec(cmd, (e, stdout, stderr)=> {
        if (e instanceof Error) {
            console.error(e);
            throw e;
        }
        return stdout;
        //console.log('stdout ', stdout);
        //console.log('stderr ', stderr);
    });
}

function RunSpawn (cmd) {
    const { spawn } = require("child_process");
    var command = cmd.split(" ")[0];
    var args = cmd.slice(command.length);
    console.log(args);

    const spawned = spawn(command, [args]);

    spawned.stdout.on("data", data => {
        console.log(`stdout: ${data}`);
    });

    spawned.stderr.on("data", data => {
        console.log(`stderr: ${data}`);
    });

    spawned.on('error', (error) => {
        console.log(`error: ${error.message}`);
    });

    spawned.on("close", code => {
        console.log(`child process exited with code ${code}`);
    });
}

function Install() {


    RunExec("sudo apt install openssh-server -y");
    RunExec("sudo systemctl restart sshd");

}

//Install()

//child_process.spawn("apt", ["install openssh-server -y"]);
//RunExec("bash -c 'sudo apt install curl -y'");

//RunExec("./setup.sh");

var result = child_process.execSync("ls");

console.log(result.toString());