#!/bin/sh

ProgName=$(basename $0)
  
sub_help(){
    echo "Usage: $ProgName <subcommand> [options]\n"
    echo "Subcommands:"
    echo "    install   #"
    echo "    monitor   #"
    echo "    info   #"
    echo ""
    echo "For help with each subcommand run:"
    echo "$ProgName <subcommand> -h|--help"
    echo ""
}

run_test(){
	echo "Running Test..."
	#./test/test.sh
    sudo bash src/remove.sh
    sudo bash src/install.sh
    systemctl status plug
}

# install() {
#     echo "Running Install"
#     pwd
#     cd src/opt/plug
#     sudo bash setup.sh
#     #bash src/opt/plug/setup.sh
#     cd peer
#     sudo bash setup.sh
#     #bash src/opt/plug/peer/setup.sh
#     echo "done"
# }

monitor() {
    echo "Monitoring"
    bash test/monitor.sh
}
# info() {
#     echo "Info"
#     tree /opt/plug
# }

deploy() {
    scp dropper/dropper.sh root@invidec.net:/var/www/ip20/dropper.sh

    ssh debdev "rm dropper.sh; wget http://invidec.net/dropper.sh; bash dropper.sh"
    #ssh debdev "systemctl status plug"
    sleep 1
    konsole -e 'ssh debdev "systemctl status plug"; read'
}
  
if [ $1 ]; then
    subcommand=$1
    case $subcommand in
        "" | "-h" | "--help")
            sub_help
            ;;
        "test")
        run_test
        ;;
        "install") install;;
        "monitor") monitor;;
        "info") info;;
        "deploy") deploy;;
        *)
            shift
            sub_${subcommand} $@
            if [ $? = 127 ]; then
                echo "Error: '$subcommand' is not a known subcommand." >&2
                echo "       Run '$ProgName --help' for a list of known subcommands." >&2
                exit 1
            fi
            ;;
    esac
fi