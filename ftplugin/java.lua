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
    cmd = {
        "java",
        -- Increase memory allocation
        "-Xms2g",
        "-Xmx4G",

        -- Use G1 garbage collector for better memory management
        "-XX:+UseG1GC",

        -- Enable Lombok (comment out to disable for troubleshooting)
        "-javaagent:" .. lombok_path,

        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.level=FINE", -- Enable detailed logging to troubleshoot server restarts
        "-Xms1g",
        "-Xmx2G",
        "-jar", home .. "/.local/opt/jdtls-launcher/jdtls/plugins/org.eclipse.equinox.launcher_1.6.900.v20240613-2009.jar",
        "-configuration", home .. "/.local/opt/jdtls-launcher/jdtls/config_linux",
        "-data", home .. "/thangam/java-with-me" -- Replace with your actual workspace folder
    },

    root_dir = require 'lspconfig'.util.root_pattern(".git", "mvnw", "gradlew", "build.gradle"),

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
            -- Enable annotation processing
            contentProvider = { preferred = "fernflower" }, -- Use a stable decompiler
            errors = { includeStackTrace = true },
            autobuild = { enabled = false },
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

    -- Optional: Set up event handling if the LSP supports on_attach functionality
    on_attach = function(client, bufnr)
        -- Add custom key mappings or buffer-specific settings if needed
        -- For example: map keys for easier navigation or functionality
    end,

    -- Add init_options for additional LSP config
    init_options = {
        jvm_args = {
            "-Xbootclasspath/a:" .. lombok_path      -- Add Lombok to the classpath
        },
        workspace = home .. "/thangam/java-with-me", -- Define workspace location
        jvm_args = {
            -- Additional JVM arguments if necessary
        }
    }
}
