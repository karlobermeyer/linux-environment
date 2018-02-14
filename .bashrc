#!/bin/bash
# .bashrc of Karl J. Obermeyer

# Global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Private definitions
if [ -f ~/.bashrc_private ]; then
    . ~/.bashrc_private
elif [ -d ~/Sync/.bashrc_private ]; then
    export PATH=$PATH:~/Sync/.bashrc_private
fi
. ~/.git-completion.bash

# Custom command-line utilities
if [ -d ~/.utilities ]; then
    export PATH=$PATH:~/.utilities
elif [ -d ~/git_repos/linux_environment/.utilities ]; then
    export PATH=$PATH:~/git_repos/linux_environment/.utilities
fi

# Private custom command-line utilities
if [ -d ~/.utilities_private ]; then
    export PATH=$PATH:~/.utilities_private
elif [ -d ~/Sync/.utilities_private ]; then
    export PATH=$PATH:~/Sync/.utilities_private
fi

umask 022 # permissions
export HOSTNAME=`/bin/hostname`
export HISTFILESIZE=1000
export EDITOR="emacs"
#lpadmin -d [printer name] # set default printer
export PATH=$PATH:/usr/bin
export PATH=$PATH:/Applications/DOWNLOADS/Doxygen/Doxygen.app/Contents/Resources
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
#export LSCOLORS "fxexcxdxbxfgfdabagacad"
#export TERM=xterm-color

# Prompt
#export PS1="\[\033[7;39m\]\h:\[\033[0m\] \w> "
#export PS1="${debian_chroot:+($debian_chroot)}\u@\h:\w\$"
export PS1="\u@\h:\w\$ "
export PS2="> "

# Ubuntu 12.04 trash operations
alias totrash='cd ~/.local/share/Trash'
alias emptytrash='rm -rf ~/.local/share/Trash/expunged/*;\
  rm -rf ~/.local/share/Trash/files/*; rm -rf ~/.local/share/Trash/info/*;'

# Misc. aliases
alias l='clear;pwd;echo "--------------------------------";\
  ls --color -F1 --group-directories-first; echo " "'
alias ll='clear;pwd;echo "--------------------------------";\
  ls --color -Flh --group-directories-first; echo " "'
alias lh='clear;pwd;echo "--------------------------------";\
  ls --color -FA1h --group-directories-first; echo " "'
alias llh='clear;pwd;echo "--------------------------------";\
  ls --color -FAlh --group-directories-first; echo " "'
alias ld='clear;pwd;echo "--------------------------------";\
  ls --color -d -1 */; echo " "'
alias ldh='clear;pwd;echo "--------------------------------";\
  ls --color -d .*/; echo " "'
alias lhead='clear;pwd;echo "--------------------------------";\
  ls --color -FAlh --group-directories-first | head; echo " "'
alias lpy='clear;pwd;echo "--------------------------------";\
  ls --color -F1h *.py; echo " "'
alias llpy='clear;pwd;echo "--------------------------------";\
  ls --color -Flh *.py; echo " "'
alias lsh='clear;pwd;echo "--------------------------------";\
  ls --color -F1h *.sh; echo " "'
alias llsh='clear;pwd;echo "--------------------------------";\
  ls --color -Flh *.sh; echo " "'
alias lpkl='clear;pwd;echo "--------------------------------";\
  ls --color -F1h *.pkl; echo " "'
alias llpkl='clear;pwd;echo "--------------------------------";\
  ls --color -Flh *.pkl; echo " "'
alias lyaml='clear;pwd;echo "--------------------------------";\
  ls --color -F1h *.yaml; echo " "'
alias llyaml='clear;pwd;echo "--------------------------------";\
  ls --color -Flh *.yaml; echo " "'
alias ltex='clear;pwd;echo "--------------------------------";\
  ls --color -F1h *.tex; echo " "'
alias lltex='clear;pwd;echo "--------------------------------";\
  ls --color -Flh *.tex; echo " "'
alias ltxt='clear;pwd;echo "--------------------------------";\
  ls --color -F1h *.txt; echo " "'
alias lltxt='clear;pwd;echo "--------------------------------";\
  ls --color -Flh *.txt; echo " "'
alias lpng='clear;pwd;echo "--------------------------------";\
  ls --color -F1h *.png; echo " "'
alias pkk='pkill -KILL'
alias filecount='find . -type f | wc -l'
alias dus='du -sh * | sort -h'
alias duhm='sudo du -hm --max-depth 1 | sort -nr | head'
alias a='atom'
alias an='atom -n &'
alias e='emacs'
function ero(){
    emacs "$1" --eval '(setq buffer-read-only t)'
}
alias eb='emacs ~/.bashrc &'
function ebro(){
    emacs ~/.bashrc --eval '(setq buffer-read-only t)' &
}
alias ebp='emacs ~/.bashrc_private &'
alias ee='emacs ~/.emacs.el &'
function eero(){
    emacs ~/.emacs.el --eval '(setq buffer-read-only t)' &
}
alias et='emacs ~/.tcshrc &'
alias cleaner='rm -f *~ .*~ *# .*# *.aux *.blg *.log *.dvi *.bak *.fot *.o *.do\
  *.db *.mexmaci *.nav *.out *.snm *.toc *.pyc; l'
alias bibcleaner='rm -f *~ .*~ *# .*# *.aux *.blg *.bbl *.log *.dvi *.bak *.fot\
   *.o *.do *.db *.mexmaci *.nav *.out *.snm *.toc *.pyc; l'
#
# ::WARNING:: When using any grep aliases that have a ``--include'' flag, must
# use ./ instead of * at the end, e.g.,
# $ grep --include=*.py "blah" ./
function grepn(){
    # Replaces
    # alias grepn='grep -RHn --color' # case sensitive
    grep -RHn --color "$1" ./
}
function grepni(){
    # Replaces
    # alias grepni='grep -RHin --color' # case sensitive
    grep -RHin --color "$1" ./
}
function grept(){
    # Replaces
    # alias grept='grep -RHn --color --include=*.text --include=*.txt'
    grep -RHn --color --include=*.text --include=*.txt "$1" ./
}
function grepc(){
    # Replaces
    # alias grepc="grep -r --include=*.h --include=*.hpp --include=*.c\
    # --include=*.cpp --include=*.cc --include=*.C"
    grep -r --include=*.h --include=*.hpp --include=*.c\
     --include=*.cpp --include=*.cc --include=*.C "$1" ./
}
function grepy(){
    # Replaces
    # alias grepy='grep -RHn --color --include=*.py --include=*.pyx'
    grep -RHn --color --include=*.py --include=*.pyx "$1" ./
}
function greptex(){
    # Replaces
    # alias greptex='grep -RHn --color --include=*.tex'
    grep -RHn --color --include=*.tex "$1" ./
}
function grepm(){
    # Replaces
    # alias grepm='grep -RHn --color --include=*.m'
    grep -RHn --color --include=*.m "$1" ./
}
function grepe(){
    # Replaces
    # alias grepm='grep -RHn --color --include=*.m'
    grep -l "$1" ./ | xargs emacs &
}
function findname(){
    find . -name "*$1*" 2>/dev/null
}
alias eogpng='eog *.png &'
function eogpngd(){
    eog $1/*.png &
}
alias sagi='sudo apt-get install'
alias sagupdate='sudo apt-get update'
alias sagupgrade='sudo apt-get upgrade'
alias fm='nautilus . &'
function acroreadn(){
    # Open file in new instance of Adobe Reader
    # acroread 1.pdf & acroread -openInNewInstance 2.pdf
    acroread -openInNewInstance $1 &
}

# Git
alias tgr='cd ~/git_repos'
alias gg='git gui &'
alias gco='git checkout'
alias gfa='git fetch --all'
alias gk='gitk &'
alias gka='gitk --all &'
alias grph='git rev-parse HEAD'
alias grh='git reset --hard'
alias gitls='git ls-tree --full-tree -r HEAD'

# SVN
alias s='svn up; svn commit -m " "; svn up'

# LaTeX
alias lbll="cleaner; latex main.tex; bibtex main; latex main.tex;\
  latex main.tex; make pdf"
alias pbpp="cleaner; pdflatex main.tex; bibtex main; pdflatex main.tex;\
  pdflatex main.tex"
export TEXINPUTS=\
./:\
./images//:\
./epsfiles//:\
./fig//:\
./figs//:\
./xfig//:\
/usr/share/tex4ht//:\
/usr/share/tex-common//:\
/usr/share/texinfo//:\
/usr/share/texlive//:\
/usr/share/texlive-bin//:\
/usr/share/texmf//
#~/lib/texmf/tex//:\\
#
export BSTINPUTS=\
./:\
~/lib/texmf/bibtex/bst//:\
/usr/share/texmf-texlive/bibtex/bst//:\
/usr/share/texlive/texmf-dist/bibtex/bst//
export BIBINPUTS=\
./:\
./bib//:\
~/lib/texmf/bibtex/bib//:\
/usr/share/texlive/texmf-dist/bibtex/bib//:\
~/git_repos/stdlatex/bib//

# ffmpeg: Movie/animation from frames
# 'mm' for 'make movie'
#alias mm='ffmpeg -i frame%04d.png -f avi -r 2 -vcodec mjpeg -qscale 1 output.avi'
alias mm='ffmpeg -i frame%04d.png -f avi -t 20 -vcodec mjpeg -qscale 1 output.avi'
function m4as2mp3s(){
    # Convert all .m4a files in current directory to .mp3 files in subdirectory ./mp3s.
    mkdir -p mp3s
    FILES="./*.m4a"
    #for file in $FILES; do ffmpeg -i $file ./mp3s/${file%.*}.mp3; done
    for file in $FILES; do
	file_in_base=`basename $file` # removes path
	file_out=./mp3s/${file_in_base%.*}.mp3 # add new path
	#ffmpeg -i $file $file_out # bit rate too low
	ffmpeg -i $file -acodec libmp3lame -ab 256k $file_out
    done
}
function mp4s2mp3s(){
    # Convert all .mp4 (video) files in current directory to .mp3 (audio) files
    # in subdirectory ./mp3s.
    mkdir -p mp3s
    FILES="./*.mp4"
    #for file in $FILES; do ffmpeg -i $file ./mp3s/${file%.*}.mp3; done
    for file in $FILES; do
	file_in_base=`basename $file` # removes path
	file_out=./mp3s/${file_in_base%.*}.mp3 # add new path
	#ffmpeg -i $file $file_out # bit rate too low
	ffmpeg -i $file -acodec libmp3lame -ab 256k $file_out
    done
}

# Imagemagick
function crop(){
    # 20x10 would leach 20px border horizontal and 10px border vertical
    convert $1 -trim -bordercolor White -border 5x5 +repage $1
}
function fullcrop(){
    convert $1 -trim $1
    # If you don't want to overwrite original, use this instead
    # convert $1 -trim trimmed_$1
}
function cropallpng(){
    # Call crop on all .png files in current directory
    FILES="./*.png"
    for i in $FILES; do crop $i; done
}
function fullcropallpng(){
    # Call crop on all .png files in current directory
    FILES="./*.png"
    for i in $FILES; do fullcrop $i; done
}

# Dot
function dots2pngs(){
    # Convert all dot files in current directory to png files
    FILES="./*.dot"
    for i in $FILES; do dot -Tpng $i > ${i%.*}.png; done
}

# Python
alias py='python'
alias p='python3'
alias ipy='ipython'
alias ipp='ipython --pylab'
alias ipn='ipython notebook --pylab inline'
export PYTHONPATH=$PYTHONPATH:/home/kobermeyer/.python:/home/kobermeyer/git_repos
#export PYTHONPATH=$PYTHONPATH:/usr/local/lib/python2.7/dist-packages/RunSnakeRun-2.0.2b1-py2.7.egg/runsnakerun/runsnake.py
export PYTHONSTARTUP=/home/kobermeyer/.python/startup.py
