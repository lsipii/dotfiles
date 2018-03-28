if [ "$OSTYPE" == "cygwin" ]; then

	###
	# Calc
	###
	alias calc="bc -l"

	###
	# Wintpy npm
	###
	alias npmw="winpty powershell -command \"% {&'npm' run watch}\""

	###
	# Wintpy docker
	###
	function docker() {
	    winpty docker "$@"
	}
	function docker-compose() {
	    winpty docker-compose "$@"
	}
fi

###
# Log tailer
###
function log() {
    DATERNA=`date +%Y-%m-%d`
    clear;
    if [ ! -f ~/Projects/aarium/storage/logs/fokua-$DATERNA.log ]; then
        touch ~/Projects/aarium/storage/logs/fokua-$DATERNA.log
    fi
    tail -f ~/Projects/aarium/storage/logs/fokua-$DATERNA.log
}
