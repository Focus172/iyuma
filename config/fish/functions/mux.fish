function mux --description "Attach to a zellij session"
    zellij a $(zellij ls -n | fzf | cut -d' ' -f1)
end
