#!/bin/bash

mysql -u root -p --table -e "SELECT * FROM information_schema.USER_PRIVILEGES;" > /var/www/user_privileges.txt