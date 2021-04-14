



	


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





#plug-daemon
	loop
		eval $(cat hostid | ssh peer@$UP)
		sleep $t

################################################3

$UP-sshd
	Match User peer
		ForceCommand peer.sh

		curl localhost:3000/?hostid=$hostid
			


		