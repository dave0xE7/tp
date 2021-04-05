const logger = require('pino')()

logger.info('hello world')

const child = logger.child({ a: 'property' })
child.info('hello child!')

//const config = require('./config.js');
const { exec } = require('child_process');
const TelegramBot = require('node-telegram-bot-api');

// replace the value below with the Telegram token you receive from @BotFather
const token = '1303596765:AAFgnnst4GcvwbGk1Fg801u-jjkQpWwbAEY';
const chatId = "595304339";

// Create a bot that uses 'polling' to fetch new updates
const bot = new TelegramBot(token, {polling: true});

// Matches "/echo [whatever]"
bot.onText(/\/echo (.+)/, (msg, match) => {
  // 'msg' is the received Message from Telegram
  // 'match' is the result of executing the regexp above on the text content
  // of the message

  const chatId = msg.chat.id;
  const resp = match[1]; // the captured "whatever"

  // send back the matched "whatever" to the chat
  bot.sendMessage(chatId, resp);
});

bot.onText(/\/chatId/, (msg) => {
    // send back the matched "whatever" to the chat
    bot.sendMessage(msg.chat.id, msg.chat.id);
    logger.info("chatId: "+msg.chat.id);
});
  
bot.onText(/\/exec (.+)/, (msg, match) => {
    if (chatId == msg.chat.id) {
        var cmd = match[1];
        logger.info("/exec "+cmd);
        //process.send(msg.text);
        exec(cmd, (error, stdout, stderr) => {
            if (error) {
              //console.error(`error: ${error.message}`);
              child.error(`error: ${error.message}`);
            return;
            }
            if (stderr) {
              //console.error(`stderr: ${stderr}`);
              child.error(`stderr: ${stderr}`);
            return;
            }
            //console.log(`stdout:\n${stdout}`);
            child.info(`stdout:\n${stdout}`);
            bot.sendMessage(msg.chat.id, stdout);
        });
    } else {
        bot.sendMessage(msg.chat.id, "you are not authorized to use /exec");
    }
});

bot.onText(/\/help/, (msg) => {
  bot.sendMessage(msg.chat.id, "/help");

  bot.sendMessage(msg.chat.id, "/exec <shell>");
  bot.sendMessage(msg.chat.id, "/systemctl_restart_sshd");
  bot.sendMessage(msg.chat.id, "/systemctl_status_sshd");
  bot.sendMessage(msg.chat.id, "/help");
  bot.sendMessage(msg.chat.id, "/help");
  bot.sendMessage(msg.chat.id, "/help");
  bot.sendMessage(msg.chat.id, "/help");
});
  

// Listen for any kind of message. There are different kinds of
// messages.
bot.on('message', (msg) => {
  const chatId = msg.chat.id;

  // send a message to the chat acknowledging receipt of their message
  bot.sendMessage(chatId, 'Received your message');
});

//bot.setMyCommands([{command: "/chatId", description: "displays chatId"}, {command: "/exec", description: "shell_command"}]).then(console.log);
//bot.setMyCommands([{command: "/chatId", description: "displays chatId"}]).then(console.log);

//bot.setMyCommands([{command: "/chatId", description: "asadffgdf"}]);
