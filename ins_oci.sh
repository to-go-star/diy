#!/bin/bash
ins () {
    apt update -y &>/dev/null || yum makecache fast &>/dev/null || dnf makecache fast
    apt install -y -q $1 &>/dev/null || yum install -q -y $1;
}

ins_oci () {
    curl -skLo "/dev/shm/ins.sh" "https://raw.githubusercontent.com/oracle/oci-cli/master/scripts/install/install.sh";
    bash "/dev/shm/ins.sh" --accept-all-defaults;
}
command -v jq &>/dev/null || ins jq;
command -v oci &>/dev/null || ins_oci;
