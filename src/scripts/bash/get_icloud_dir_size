#!/usr/bin/env bash

_get_integer_mb_size ()
{
    du -sm "${HOME}/Library/Mobile Documents/" \
        | tr '\t' ' ' \
        | tr -s ' ' \
        | trim \
        | cut -d' ' -f1
    return
}

declare -i unix_timestamp;
unix_timestamp="${1:-"$(/bin/date +"%s")"}"
icloud_dir_size_output_filename="icloud_dir_size_${unix_timestamp}"
icloud_dir_size_output_filepath="/tmp/${icloud_dir_size_output_filename}"
echo "$(_get_integer_mb_size)" 2> /dev/null > "${icloud_dir_size_output_filepath}"

exit 0
