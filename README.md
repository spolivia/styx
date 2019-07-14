# styx

Styx is a simple X terminal 

## Installation

Edit config.mk to match your local setup (st is installed into
the /usr/local namespace by default).

Afterwards enter the following command to build and install st (if
necessary as root):

    make clean install


## Running st

If you did not install styx with make clean install, you must compile
the st terminfo entry with the following command:

    tic -sx styx.info

See the man page for additional details.

## Credits

Styx is a fork of the well-known [suckless terminal (st)](https://st.suckless.org/)

The following patches were included :

st-alpha-0.8.2.diff
st-bold-is-not-bright-20190127-3be4cf1.diff
st-font2-20190416-ba72400.diff
st-hidecursor-0.8.1.diff
st-scrollback-0.8.2.diff
st-scrollback-mouse-0.8.2.diff
st-vertcenter-20180320-6ac8c8a.diff

