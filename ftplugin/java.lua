-- local config = {
--
--     cmd = { vim.fn.expand '~/.local/share/nvim/mason/packages/jdtls/bin/jdtls' },
--     root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]),
-- }
--
-- require('jdtls').start_or_attach(config)

local home = os.getenv("HOME")
local lombok_path = home .. "/.local/lib/lombok/lombok.jar"

require 'lspconfig'.jdtls.setup {
    capabilities = lsp_capabilities,
    cmd = {
        "java",
        "-Xms2g",       -- Updated memory limits
        "-Xmx4g",       -- Increased memory allocation for stability
        "-XX:+UseG1GC", -- G1GC for better memory management
        "-javaagent:" .. lombok_path,
        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.level=FINE", -- Detailed logging for troubleshooting
        "-jar", home .. "/.local/opt/jdtls-launcher/jdtls/plugins/org.eclipse.equinox.launcher_1.6.900.v20240613-2009.jar",
        "-configuration", home .. "/.local/opt/jdtls-launcher/jdtls/config_linux",
        "-data", home .. "/thangam/java-with-me" -- Your workspace folder
    },
    root_dir = require 'lspconfig'.util.root_pattern(".git", "mvnw", "pom.xml"),
    settings = {
        java = {
            configuration = {
                runtimes = {
                    {
                        name = "JavaSE-21",
                        path = "/usr/lib/jvm/java-21-openjdk-amd64",
                    }
                },
            },
            contentProvider = { preferred = "fernflower" }, -- Stable decompiler
            autobuild = { enabled = false },                -- Disable autobuild to prevent restarts
            saveActions = {
                organizeImports = true
            },
            completion = {
                favoriteStaticMembers = {
                    "org.assertj.core.api.Assertions.assertThat",
                    "org.junit.jupiter.api.Assertions.*",
                    "org.mockito.Mockito.*"
                },
            },
            eclipse = {
                downloadSources = true,
            },
            maven = {
                downloadSources = true,
            },
            implementationsCodeLens = {
                enabled = true,
            },
            referencesCodeLens = {
                enabled = true,
            },
            references = {
                includeDecompiledSources = true,
            },
            format = {
                enabled = true,
            },
        },
    },
    on_attach = function(client, bufnr)
        -- Optional: Disable highlight and semanticTokensProvider to reduce LSP server load
        client.server_capabilities.documentHighlightProvider = false
        client.server_capabilities.semanticTokensProvider = false
        -- Additional buffer settings can go here
    end,
    init_options = {
        workspace = home .. "/thangam/java-with-me", -- Define workspace
        jvm_args = {
            "-Xbootclasspath/a:" .. lombok_path      -- Add Lombok to classpath
        }
    }
}
