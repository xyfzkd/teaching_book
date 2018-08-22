library(magrittr)
for ( md_file in yaml::read_yaml('_bookdown.yml')$rmd_files) {
    content = readr::read_file(md_file)
    content = stringr::str_remove_all(content, '(?<=\\]\\()(\\.\\./)+')
    content = stringr::str_replace_all(content, '/?\\.gitbook/assets', 'images')
    if (basename(md_file) != 'index.Rmd')
        content = stringr::str_replace_all(content, '^---$', '------')
    readr::write_file(content, md_file)
}

readr::write_lines('# Linux', 'part-i.-basic-tools/1.linux.md')


