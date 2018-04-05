function randomgarbage
  echo $RANDOM | sha256sum | cut -c1-7
end
