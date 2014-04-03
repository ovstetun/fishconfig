# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Theme
set fish_theme ovstetun

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-fish/plugins/*)
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
# Example format: set fish_plugins autojump bundler

set fish_plugins docker brew localhost node

# Path to your custom folder (default path is $FISH/custom)
#set fish_custom $HOME/dotfiles/oh-my-fish

set -x PATH $PATH $HOME/bin

set -x LANG en_US.UTF-8
set -x JAVA_HOME6 (/usr/libexec/java_home --version 1.6)
set -x JAVA_HOME7 (/usr/libexec/java_home --version 1.7)
set -x JAVA_HOME8 (/usr/libexec/java_home --version 1.8)

function jh6; set -x JAVA_HOME $JAVA_HOME6; end
function jh7; set -x JAVA_HOME $JAVA_HOME7; end
function jh8; set -x JAVA_HOME $JAVA_HOME8; end

set -x JAVA_HOME $JAVA_HOME7

function mci; mvn clean install; end
set -x MAVEN_OPTS "-Xmx3072m -XX:MaxPermSize=512m"

function tower; gittower; end

function l; ls; end

set -x ESAK_LEVERANSEOMRADE /Users/ovstetun/Customers/Kulturradet/kode/Leveranse/eSak

function dh -d "Opens webbrowser to http://localdocker:<PORT> on given port"
  if _open-installed
    if [ (count $argv) -lt 1 ]
        echo "You need to specify a port to open"
        return 1
    end
    command open http://localdocker:$argv
  else
    echo 'Requires open (MacOS only) to be installed'
  end
end

function b2d; boot2docker-cli $argv; end

set -x DOCKER_HOST tcp://localhost:4243

set -x GOPATH $HOME/go
set -x PATH $PATH $GOPATH/bin

#set NODE_PATH /usr/local/share/npm/bin

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish

function server -d 'run server in current directory'
  set -l port $argv[1]

  if test -n "$port"
    python -m SimpleHTTPServer $port
  else
    python -m SimpleHTTPServer 3000
  end
end
