return function()
    local opts = {
        sources = { "filesystem", "buffers", "git_status", "document_symbols" },
        filesystem = {
            follow_current_file = { enabled = true },
            hijack_netrw_behavior = "open_current",
            use_libuv_file_watcher = true,
            bind_to_cwd = false,
            filtered_items = {
                visible = true,
            },
        },
        window = {
            position = "left",
            width = 30,
            mappings = {
                ["<space>"] = "none",
            },
            mapping_options = {
                nowait = true,
            },
        },
        open_files_do_not_replace_types = { "terminal", "Trouble", "qf", "Outline", "edgy" },
    }

    require("neo-tree").setup(opts)
end
