export GREP_OPTIONS="--color=auto"
export GREP_COLOR="4;33"
export CLICOLOR="auto"
export TZ='America/Sao_Paulo'
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

which mate &>/dev/null && export EDITOR='mate -w'
which subl &>/dev/null && export EDITOR='subl -w'

if [[ -x "/usr/libexec/java_home" ]]
then
	export JAVA_HOME=`/usr/libexec/java_home`
fi
