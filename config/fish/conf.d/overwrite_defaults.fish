if test -x /usr/bin/bat -o -x /usr/local/bin/bat -o -x $HOME/.cargo/bin/bat
  function cat
    bat $argv
  end
end

if test -x /usr/bin/rg -o -x /usr/local/bin/rg -o -x $HOME/.cargo/bin/rg
  function grep
    rg $argv
  end
end

if test -x $HOME/.cargo/bin/exa -o -x /usr/bin/exa -o -x /usr/local/bin/exa
  function ls
    exa $argv
  end
end

if test -x $HOME/.cargo/bin/fd -o -x /usr/bin/fd -o -x /usr/local/bin/fd
  function find
    fd $argv
  end
end
