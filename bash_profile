export PATH=/usr/local/bin:$PATH
export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH
alias culpeper="ssh degravity@culpeper.dreamhost.com"
export PIP_REQUIRE_VIRTUALENV=true
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache
# Use syspip install ... to install python packages globally
syspip(){
    PIP_REQUIRE_VIRTUALENV="" pip "$@"
}
