function fish_user_key_bindings
  fish_vi_key_bindings

  bind \cp 'up-or-search'
  bind \cn 'down-or-search'

  bind -M insert \cp 'up-or-search'
  bind -M insert \cn 'up-or-search'
end
