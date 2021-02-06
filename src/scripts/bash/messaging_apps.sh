#!/usr/local/bin/bash
# open_messaging_apps.sh

function usage()
{
    local -a OPTS;
    OPTS=();
    OPTS+=( 'h|H|help|HELP:display this usage message' );
    OPTS+=( 'o|O|open|OPEN:open messaging apps' );
    OPTS+=( 'c|C|close|CLOSE:close messaging apps' );
    OPTS+=( 's|S|status|STATUS:show if apps are open or close' );

    local MSG
    MSG='\n'"USAGE: [36;40;1m ./$(basename "${0:-"./open_messaging_apps.sh"}") [-hoc] [00;00m"
    MSG+='\n\nDESCRIPTION:'
    MSG+='\n  > open designated messaging apps'
    MSG+='\n\nOPTIONS:\n'
    for ((c=0;c<${#OPTS[@]};c++)); do
        MSG+="  - ${OPTS[${c}]%%:*}: ${OPTS[${c}]#*:}"'\n';
    done
    MSG+='\n'
    echo -en "${MSG}" | sed -E -e 's/^/	/'
    return
}

function status()
{
    echo "are apps running?"
    return
}

function openApps()
{
    printf '\t>> %s\n' "OPENING MESSAGING APPS..."
    /usr/bin/osascript <<-!
on openApp(appname)
    tell application appname to activate
end openApp

on closeApp(appname)
    tell application appname to quit
end closeApp

set apps to ${APPNAMES-?}

repeat with x from 1 to count of apps
    openApp(item x of apps)
end repeat
!
    return
}

function closeApps()
{
    printf '\t>> %s\n' "CLOSING MESSAGING APPS..."
    /usr/bin/osascript <<-!
on openApp(appname)
    tell application appname to activate
end openApp

on closeApp(appname)
    tell application appname to quit
end closeApp

set apps to ${APPNAMES-?}

repeat with x from 1 to count of apps
    closeApp(item x of apps)
end repeat
!
    return
}

declare APPNAMES;
APPNAMES='{"Signal", "Telegram", "Discord", "Messages"}';

if (( $# > 0 )); then
    case "${1:?}" in
        ?*h|help|H|HELP|\?)
            usage;
            ;;
        ?*o|open|O|OPEN)
            openApps
            ;;
        ?*c|close|C|CLOSE)
            closeApps
            ;;
        *)
            exit 1
            ;;
    esac
else
    printf '\n\t>> %s\n\t>> ' "Open or Close messaging apps?"
    read -rp "(o/c)? " REP
    case "${REP:-}" in
        o|O|open|OPEN)
            openApps;
            ;;
        c|C|close|CLOSE)
            closeApps;
            ;;
        s|status|S|STATUS)
            status;
            ;;
        *)
            printf '\t>> Aborting...\n'
            ;;
    esac
fi

printf '\n'
exit


