



	


		Linux Daemon
			systemd, initrc, crontab

			telegram-bot
			http requester

			sshd



	initial setup
		system daemons for base loop
		http transport polling bot
		openssh-server on localhost:22

	autossh connection using shared_rsa to [invidec.net]
		remote port forwarding 5000:localhost:22

	[invidec.net] ssh :5000 ---> some_client:22
		post transport connection setup
		clientspecific individual ssh-rsa key






		