#!/usr/bin/env bash
# trim.sh

declare INPUT;
if [[ -p /dev/stdin ]]; then
    INPUT="$(cat /dev/stdin)";
    [[ -z "${INPUT}" ]] && exit 11;
else
    if (($#>0)); then
        INPUT="${*:?ERROR, no input detected}";
    fi;
fi;
declare OUTPUT;
OUTPUT="$(builtin echo "${INPUT}" \
            | sed -E \
                -e 's/^[[:cntrl:][:blank:]]*//' \
                -e 's/[[:cntrl:][:blank:]]*$//'\
         )" \
    || exit 12;
[[ -z "${OUTPUT:-}" ]] && exit 13;

builtin echo -e "${OUTPUT}";

exit

