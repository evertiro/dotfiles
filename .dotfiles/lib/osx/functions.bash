# FAKE WGET
wget() {
    if [[ -z ${1} ]]; then
        echo "wget <url>"
        return
    fi

    filename=`basename ${1}`

    curl -k --progress-bar ${1} > ${filename}
}

# COMMAND LINE FILE COPY
copy() {
    if [[ -x ${1} ]]; then
        echo "copy <file>"
        return
    fi

    cat ${1} | pbcopy
}
