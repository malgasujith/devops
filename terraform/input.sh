    #!/bin/bash

    cd /tmp && wget https://www.free-css.com/assets/files/free-css-templates/download/page169/art-school.zip
    sudo apt update && sudo apt install unzip -y 
    sudo apt install nginx -y 
    sudo unzip art-school.zip
    sudo mv art-school /var/www/html/art


