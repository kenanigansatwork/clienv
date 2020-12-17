#!/usr/bin/env bash
sch () 
{ 
    (( $# == 0 )) && _err "target file(s) should be passed as parameters" && return 11;
    local TARGETFILE;
    TARGETFILE="";
    while (( $# > 0 )); do
        TARGETFILE="${1:?}";
        hr;
        echo -e "TARGET: [45;37;1m ${TARGETFILE} [0m";
        if [[ ! -e "${TARGETFILE}" || ! -r "${TARGETFILE}" ]]; then
            _err "can't find or read target file -- ${TARGETFILE}";
            continue;
        fi;
        ${EDITOR:-vim} ~/disk.sh && hr;
        declare SCH;
        SCH="$(shellcheck -xa ~/disk.sh)";
        if [[ -z "${SCH:-}" ]]; then
            echo "ALL GOOD"\!;
        else
            echo -e '[41;37;1m FAILED! [0m' 1>&2;
            echo -e "${SCH:-}" 1>&2;
        fi;
        shift 1;
        continue;
    done;
    hr
}

# vim: fdm=indent fdl=1
