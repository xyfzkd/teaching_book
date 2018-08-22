library(magrittr)
for ( md_file in yaml::read_yaml('_bookdown.yml')$rmd_files) {
    content = readr::read_file(md_file)
    # fix image src
    content = stringr::str_remove_all(content, '(?<=\\]\\()(\\.\\./)+')
    content = stringr::str_replace_all(content, '/?\\.gitbook/assets', 'images')
    # use ------ for horizontal line
    if (basename(md_file) != 'index.Rmd')
        content = stringr::str_replace_all(content, '^---$', '------')
    # 
    if (basename(md_file) != 'README.md')
    content[1] = paste0(content[1], ' {#index}')

    readr::write_file(content, md_file)
}

readr::write_lines('# Linux', 'part-i.-basic-tools/1.linux.md')


