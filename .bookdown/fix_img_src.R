library(magrittr)
for ( md_file in yaml::read_yaml('_bookdown.yml')$rmd_files) {
    content = readr::read_file(md_file)
    content = stringr::str_remove_all(content, '(?<=\\]\\()(\\.\\./)+')
    content = stringr::str_replace_all(content, '/?\\.gitbook/assets', 'images')
    readr::write_file(content, md_file)
}
