SAURON_DIR=$(pwd)

LEVEL=3

phpcs()
{
    php ./vendor/bin/phpcs $1/src -q
}

psalm()
{
    cd $1
    ${SAURON_DIR}/vendor/bin/psalm -i src ${LEVEL}
    php ${SAURON_DIR}/vendor/bin/psalm
    rm -f psalm.xml
    # back to previous folder
    cd -
}

phpstan()
{
    cd $1
    ${SAURON_DIR}/vendor/bin/phpstan analyse -l ${LEVEL} src 
    # back to previous folder
    cd -
}

psalm $@
phpcs $@
phpstan $@