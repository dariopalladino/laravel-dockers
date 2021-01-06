#!/bin/bash

cd /var/www/

# Setup git variables
if [ ! -z "$GIT_EMAIL" ]; then
    git config --global user.email "$GIT_EMAIL"
fi
if [ ! -z "$GIT_NAME" ]; then
    git config --global user.name "$GIT_NAME"
    git config --global push.default simple
fi
if [[ "$GIT_USE_SSH" == "1" ]] ; then
    # Disable Strict Host checking for non interactive git clones
    mkdir -p -m 0700 /root/.ssh
    # Prevent config files from being filled to infinity by force of stop and restart the container 
    echo "" > /root/.ssh/config
    echo -e "Host *\n\tStrictHostKeyChecking no\n" >> /root/.ssh/config
    echo -e "Host *\n\tUser ${GIT_USERNAME}\n\n" >> /root/.ssh/config
    if [ ! -z "$SSH_KEY" ]; then
        echo $SSH_KEY > /root/.ssh/id_rsa.base64
        base64 -d /root/.ssh/id_rsa.base64 > /root/.ssh/id_rsa
        chmod 400 /root/.ssh/id_rsa
    fi
fi

if [ ! -f /var/www/.env ]; then
    # Pull down code from git for our site!
    if [ ! -z "$CLONE_REPO" ] && [ ! -z "$GIT_REPO" ]; then
        # Remove the test index file if you are pulling in a git repo
        if [ ! -z ${REMOVE_FILES} ] && [ ${REMOVE_FILES} == 0 ]; then
            echo "skiping removal of files"
        else
            rm -Rf /var/www/*
        fi
        GIT_COMMAND='git clone '
        if [ ! -z "$GIT_BRANCH" ]; then
            GIT_COMMAND=${GIT_COMMAND}" -b ${GIT_BRANCH}"
        fi

        if [ -z "$GIT_USERNAME" ] && [ -z "$GIT_PERSONAL_TOKEN" ]; then
            GIT_COMMAND=${GIT_COMMAND}" ${GIT_REPO}"
        else
            if [[ "$GIT_USE_SSH" == "1" ]]; then
            GIT_COMMAND=${GIT_COMMAND}" ${GIT_REPO}"
            else
            GIT_COMMAND=${GIT_COMMAND}" https://${GIT_USERNAME}:${GIT_PERSONAL_TOKEN}@${GIT_REPO}"
            fi
        fi
        echo "Cloning now....."
        #${GIT_COMMAND} /var/www || exit 1
        #ssh-agent bash -c 'ssh-add /somewhere/yourkey; git clone git@github.com:user/project.git'
        ${GIT_COMMAND} . || exit 1
        if [ ! -z "$GIT_TAG" ]; then
            git checkout ${GIT_TAG} || exit 1
        fi
        if [ ! -z "$GIT_COMMIT" ]; then
            git checkout ${GIT_COMMIT} || exit 1
        fi
        if [ -z "$SKIP_CHOWN" ]; then
            chown -Rf $user.www-data /var/www
        fi

    fi

    echo "Copying Laravel environment file... "
    if [ -f /var/temp/.env ]; then
            cp /var/temp/.env .
            rm -fR /var/temp/*
    fi

    if [ -f /var/www/composer.json ]; then     
        if [ -z "$SKIP_COMPOSER_UPDATE" ]; then        
            echo "Running composer update... "
            composer global require hirak/prestissimo
            COMPOSER_MEMORY_LIMIT=4G COMPOSER_ALLOW_XDEBUG=1 composer update
        fi
        echo "Dump autoload and generate key... "
        composer dump-autoload && php artisan key:generate
    fi

fi

