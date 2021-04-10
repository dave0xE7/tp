



command='ssh -N -R 5000:localhost:22 peer@localhost -i /opt/plug/autossh/shared_rsa'
hostid='4461e6b38db1921ff2e3fe536041e42b984e0d8d0a4d56511f51f7c3854b28e4'

function BufferAdd {
    sudo -u peer echo $1 >> /opt/plug/peer/hosts/$0/buffer.sh
}

BufferAdd $hostid "echo '"$public_key"' >> /root/.ssh/authorized_keys"
BufferAdd $hostid $command


 