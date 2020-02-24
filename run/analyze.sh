SAURON_DIR=$(pwd)

PSALM_LEVEL=3
STAN_LEVEL=3
PROJECT='/project'

phpcs()
{
    php ./vendor/bin/phpcs $PROJECT/src -q
}

psalm()
{
    #     cd $PROJECT
    cd $1 
    ${SAURON_DIR}/vendor/bin/psalm -i src ${PSALM_LEVEL}
    php ${SAURON_DIR}/vendor/bin/psalm
    rm -f psalm.xml
    # back to previous folder
    cd -
}

phpstan()
{
    #     cd $PROJECT
    cd $1
    ${SAURON_DIR}/vendor/bin/phpstan analyse -l ${STAN_LEVEL} src
    # back to previous folder
    cd -
}

# TODO add project check and src check and vendor check
psalm $@
phpcs $@
phpstan $@