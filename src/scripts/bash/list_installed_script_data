#!/usr/bin/env bash
# list_installed_script_data.sh

declare install_dir
install_dir=~/bin/ 
[[ ! -d "${install_dir}" ]] \
    && mkdir "${install_dir:-}"

[[ ! -d "${install_dir}" ]] \
    && _err && exit 55

_list_link_data () {
    find "${install_dir}" -type l -exec /bin/ls -lT {} \; \
        | sed "s/^.*$(date +%Y)[[:blank:]]*//" \
        | sed 's/ * ->  */,/'
    return
}

while IFS=$",\n" read -r LN SRC; do
    BN="$(basename "$SRC")";
    printf '> %s\n\tsrc: %s\n\tlink: %s\n\n' "${BN}" "${SRC}" "${LN}";
done \
    < <(_list_link_data)
