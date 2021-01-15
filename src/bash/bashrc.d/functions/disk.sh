#!/usr/bin/env bash
disk () 
{ 
    function debug () 
    { 
        echo "HEADERS (${#headers[@]}): ${headers[*]}";
        echo "VALUES (${#values[@]}): ${values[*]}";
        return
    };
    function _list_disk_headers ()
    { 
        /bin/df -lPH | tr '\t' ' ' | tr -s ' ' | sed -E -n -e '/(Data)$/p' -e '1p' | sed -E -e '1s/ (on)$/_\1/' | sed -n '1p';
        return;
    };
    function _list_disk_headers_count ()
    {
        _list_disk_headers \
            | /usr/bin/wc -w \
            | trim \
            | /usr/bin/sed -n '1p' \
            | /usr/bin/tr -d '\n';
        return;
    };
    function _list_disk_values ()
    { 
        /bin/df -lPH \
            | tr '\t' ' ' \
            | tr -s ' ' \
            | sed -E -n \
                -e '/(Data)$/p' \
                -e '1p' \
            | sed -E \
                -e '1s/ (on)$/_\1/' \
            | sed -n \
                -e '2p';
        return;
    };
    function _list_disk_values_count ()
    {
        _list_disk_values \
            | /usr/bin/wc -w \
            | trim \
            | /usr/bin/sed -n '1p' \
            | /usr/bin/tr -d '\n';
        return;
    };
    function _get_boot_disk_info ()
    {
        /bin/df -lPH | tr '\t' ' ' | tr -s ' ' | sed -E -n -e '/(Data)$/p' -e '1p' | sed -E -e '1s/ (on)$/_\1/'
        return
    }

    local -a headers values;
    mapfile headers < <(/bin/df -lPH | tr '\t' ' ' | tr -s ' ' | sed -E -n -e '/(Data)$/p' -e '1p' | sed -E -e '1s/ (on)$/_\1/' | sed -n '1p');
    mapfile values < <(/bin/df -lPH | tr '\t' ' ' | tr -s ' ' | sed -E -n -e '/(Data)$/p' -e '1p' | sed -E -e '1s/ (on)$/_\1/' | sed -n '2p');
    echo "HEADERS ($(_list_disk_headers_count))"
    _list_disk_headers
    echo "VALUES ($(_list_disk_values_count))"
    _list_disk_values
    return
}
#    local -a headers values;
#    headers=($(/bin/df -lPH | tr '\t' ' ' | tr -s ' ' | sed -E -n -e '/(Data)$/p' -e '1p' | sed -E -e '1s/ (on)$/_\1/' | sed -n '1p'));
#    values=($(/bin/df -lPH | tr '\t' ' ' | tr -s ' ' | sed -E -n -e '/(Data)$/p' -e '1p' | sed -E -e '1s/ (on)$/_\1/' | sed -n '2p'));

# vim: fdm=indent fdl=1
