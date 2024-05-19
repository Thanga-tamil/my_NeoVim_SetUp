vim.g.ale_linters = {
    javascript = {'eslint'},
    typescript = {'eslint'},
    java = {'checkstyle', 'pmd'},
    python = {'pylint', 'flake8'},
}
vim.g.ale_fixers = {
    javascript = {'eslint'},
    typescript = {'eslint'},
    java = {'google_java_format'},
    python = {'autopep8', 'black'},

}
