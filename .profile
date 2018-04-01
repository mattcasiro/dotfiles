# Command and console prompt enhancement for Git
# source ~/.git-completion.sh

# PATH updates
export PATH=/Users/mcasiro/Library/Python/2.7/bin/:$PATH
export PATH=/Users/mcasiro/Applications/:$PATH

# Misc Aliases
alias ls='la -al'
alias aws-login='aws ecr get-login --no-include-email --region us-west-2 | sh'
alias getdt='date "+%Y%m%d%H%M%S" | pbcopy'
alias getdte='date "+%Y%m%d%H%M%S@futurepay.com" | pbcopy'
alias iphp='docker run -it --rm php:5.6'

# Docker Aliases
alias dps='docker ps --no-trunc --format="table {{.Names}}\t{{.Command}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}"'
alias docc='docker-compose'
alias doccr='docker-compose run --rm'
alias dclup="docker ps --no-trunc --format=\"table {{.Names}}\t{{.Command}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}\" -a | grep -i exited | awk '{print $1}' | xargs docker rm"
alias doccl='docker-compose logs -f'
alias docclogin='$(aws ecr get-login --no-include-email --profile default)'

# Git Aliases
alias gcd='gfa && git checkout development && git pull'
alias gwip='git commit -v -a -m "--wip--"'
alias gunwip='git reset --soft HEAD^ && git reset --'
alias gclu='git branch | grep -v "*" | xargs git branch -d'

# Environment Variables

# Clean up docker containers and images
dockerCleanup () {
    echo Cleaning up docker containers
    docker container prune -f
    echo Cleaning up docker images
    docker image prune -af
}
