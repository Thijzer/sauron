SAURON_DIR=$(pwd)

LEVEL=3
#PROJECT=$1
PROJECT='/project'

phpcs()
{
    php ./vendor/bin/phpcs $PROJECT/src -q
}

psalm()
{
    cd $PROJECT
    ${SAURON_DIR}/vendor/bin/psalm -i src ${LEVEL}
    php ${SAURON_DIR}/vendor/bin/psalm
    rm -f psalm.xml
    # back to previous folder
    cd -
}

phpstan()
{
    cd $PROJECT
    ${SAURON_DIR}/vendor/bin/phpstan analyse -l ${LEVEL} src 
    # back to previous folder
    cd -
}

# TODO add project check and src check and vendor check
psalm $@
phpcs $@
phpstan $@