function pushall
  for remote in (git remote)
    git push $remote
  end
end

