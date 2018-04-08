if not status --is-interactive; and not status --is-login
  exit
end
eval (python3 -m virtualfish)
