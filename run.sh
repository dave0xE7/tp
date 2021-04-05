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
  
sub_bar(){
    echo "Running 'bar' command."
}
  
sub_baz(){
    echo "Running 'baz' command."
    echo "First arg is '$1'."
    echo "Second arg is '$2'."
}
run_test(){
	echo "Running Tests..."
	./test/test.sh
}

install() {
    echo "Running Install"
    pwd
    cd src/opt/plug
    sudo bash setup.sh
    #bash src/opt/plug/setup.sh
    cd peer
    sudo bash setup.sh
    #bash src/opt/plug/peer/setup.sh
    echo "done"
}

monitor() {
    echo "Monitoring"
    bash test/monitor.sh
}
info() {
    echo "Info"
    tree /opt/plug
}
  
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
