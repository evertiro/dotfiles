# Setup config directory
export DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Load config file
source ${DOTFILES_DIR}/config.bash

LIB="${DOTFILES_DIR}/lib/*.bash"
for config_file in ${LIB}; do
    source ${config_file}
done

# Load OS-specific stuff
case ${OSTYPE} in
    darwin*)
        OSLIB='osx'
        ;;
    *)
        OSLIB='linux'
        ;;
esac

LIB="${DOTFILES_DIR}/lib/${OSLIB}/*.bash"
for config_file in ${LIB}; do
    source ${config_file}
done

# Load custom files
LIB="${DOTFILES_DIR}/custom/*.bash"
for config_file in ${LIB}; do
    source ${config_file}
done
