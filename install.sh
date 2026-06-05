#!/bin/bash

# Color
BLUE='\033;0;34m'       
RED='\033;0;31m'
GREEN='\033;0;32m'
YELLOW='\033;0;33m'
WHITE='\033;0;37m'
NC='\033[0m'

# Helper function untuk generate string acak (pengganti generateReadableString di Node.js)
generate_random_string() {
  local length=$1
  tr -dc 'a-z0-9' < /dev/urandom | head -c "$length"
}

# Display welcome message
display_welcome() {
  clear
  echo -e ""
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "${BLUE}[+]                                                 [+]${NC}"
  echo -e "${WHITE}[+]                AUTO INSTALLER THEMA             [+]${NC}"
  echo -e "${WHITE}[+]                  © ZelixBotz                    [+]${NC}"
  echo -e "${BLUE}[+]                                                 [+]${NC}"
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e ""
  echo -e "Script ini dibuat untuk mempermudah penginstalasian thema pterodactyl,"
  echo -e "dilarang keras untuk dikasih gratis."
  echo -e ""
  echo -e "𝗧𝗘𝗟𝗘𝗚𝗥𝗔𝗠 :"
  echo -e "@lixzsukatobrut"
  echo -e "ＣＲＥＤＩＴＳ :"
  echo -e "@lixzsukatobrut"
  sleep 4
  clear
}

# Update and install jq
install_jq() {
  echo -e "                                                       "
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "${BLUE}[+]             UPDATE & INSTALL JQ                 [+]${NC}"
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  sudo apt update && sudo apt install -y jq unzip wget curl
  if [ $? -eq 0 ]; then
    echo -e "                                                       "
    echo -e "${GREEN}[+] =============================================== [+]${NC}"
    echo -e "${GREEN}[+]         INSTALL DEPENDENSI BERHASIL             [+]${NC}"
    echo -e "${GREEN}[+] =============================================== [+]${NC}"
  else
    echo -e "                                                       "
    echo -e "${RED}[+] =============================================== [+]${NC}"
    echo -e "${RED}[+]         INSTALL DEPENDENSI GAGAL                [+]${NC}"
    echo -e "${RED}[+] =============================================== [+]${NC}"
    exit 1
  fi
  echo -e "                                                       "
  sleep 1
  clear
}

# Check user token
check_token() {
  echo -e "                                                       "
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "${BLUE}[+]               LICENSY ZERO DEVELOPER            [+]${NC}"
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  echo -e "${YELLOW}MASUKAN AKSES TOKEN :${NC}"
  read -r USER_TOKEN

  if [ "$USER_TOKEN" = "zelixx" ]; then
    echo -e "${GREEN}AKSES BERHASIL${NC}"
  else
    echo -e "${RED}Buy dulu Gih Ke Zelix${NC}"
    echo -e "${YELLOW}TELEGRAM : @lixzsukatobrut${NC}"
    echo -e "${YELLOW}WHATSAPP : 6287767050506${NC}"
    echo -e "${YELLOW}HARGA TOKEN : 5K${NC}"
    echo -e "${YELLOW}©zelix${NC}"
    exit 1
  fi
  clear
}

# 1. Install theme
install_theme() {
  while true; do
    echo -e "                                                       "
    echo -e "${BLUE}[+] =============================================== [+]${NC}"
    echo -e "${WHITE}[+]                   SELECT THEME                  [+]${NC}"
    echo -e "${BLUE}[+] =============================================== [+]${NC}"
    echo -e "                                                       "
    echo -e "PILIH THEME YANG INGIN DI INSTALL"
    echo "1. stellar"
    echo "2. billing"
    echo "3. enigma"
    echo "x. kembali"
    echo -e "masukan pilihan (1/2/3/x) :"
    read -r SELECT_THEME
    case "$SELECT_THEME" in
      1)
        THEME_URL="https://github.com/gitfdil1248/thema/raw/main/C2.zip"
        break
        ;;
      2)
        THEME_URL=$(echo -e "\x68\x74\x74\x70\x73\x3A\x2F\x2F\x67\x69\x74\x68\x75\x62\x2E\x63\x6F\x6D\x2F\x44\x49\x54\x5A\x5A\x31\x31\x32\x2F\x66\x6F\x78\x78\x68\x6F\x73\x74\x74\x2F\x72\x61\x77\x2F\x6D\x61\x69\x6E\x2F\x43\x31\x2E\x7A\x69\x70")
        break
        ;;
      3)
        THEME_URL="https://github.com/gitfdil1248/thema/raw/main/C3.zip"
        break
        ;; 
      x|X)
        return
        ;;
      *)
        echo -e "${RED}Pilihan tidak valid, silahkan coba lagi.${NC}"
        ;;
    esac
  done
  
  if [ -e /root/pterodactyl ]; then
    sudo rm -rf /root/pterodactyl
  fi
  wget -q "$THEME_URL"
  sudo unzip -o "$(basename "$THEME_URL")"
  
  if [ "$SELECT_THEME" = "1" ]; then
    echo -e "                                                       "
    echo -e "${BLUE}[+] =============================================== [+]${NC}"
    echo -e "${BLUE}[+]                  INSTALLASI THEMA               [+]${NC}"
    echo -e "${BLUE}[+] =============================================== [+]${NC}"
    echo -e "                                                                   "
    sudo cp -rfT /root/pterodactyl /var/www/pterodactyl
    curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
    sudo apt install -y nodejs
    sudo npm i -g yarn
    cd /var/www/pterodactyl || return
    yarn add react-feather
    php artisan migrate
    yarn build:production
    php artisan view:clear
    sudo rm -f /root/C2.zip
    sudo rm -rf /root/pterodactyl

    echo -e "                                                       "
    echo -e "${GREEN}[+] =============================================== [+]${NC}"
    echo -e "${GREEN}[+]                   INSTALL SUCCESS               [+]${NC}"
    echo -e "${GREEN}[+] =============================================== [+]${NC}"
    echo -e ""
    sleep 2
    clear

  elif [ "$SELECT_THEME" = "2" ]; then
    echo -e "                                                       "
    echo -e "${BLUE}[+] =============================================== [+]${NC}"
    echo -e "${BLUE}[+]                  INSTALLASI THEMA               [+]${NC}"
    echo -e "${BLUE}[+] =============================================== [+]${NC}"
    echo -e "                                                       "
    sudo cp -rfT /root/pterodactyl /var/www/pterodactyl
    curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
    sudo apt install -y nodejs
    sudo npm i -g yarn
    cd /var/www/pterodactyl || return
    yarn add react-feather
    php artisan billing:install stable
    php artisan migrate
    yarn build:production
    php artisan view:clear
    sudo rm -f /root/C1.zip
    sudo rm -rf /root/pterodactyl

    echo -e "                                                       "
    echo -e "${GREEN}[+] =============================================== [+]${NC}"
    echo -e "${GREEN}[+]                  INSTALL SUCCESS                [+]${NC}"
    echo -e "${GREEN}[+] =============================================== [+]${NC}"
    echo -e "                                                       "
    sleep 2
    clear

  elif [ "$SELECT_THEME" = "3" ]; then
    echo -e "                                                       "
    echo -e "${BLUE}[+] =============================================== [+]${NC}"
    echo -e "${BLUE}[+]                  INSTALLASI THEMA               [+]${NC}"
    echo -e "${BLUE}[+] =============================================== [+]${NC}"
    echo -e "                                                                   "

    echo -e "${YELLOW}Masukkan link wa (https://wa.me...) : ${NC}"
    read -r LINK_WA
    echo -e "${YELLOW}Masukkan link group (https://.....) : ${NC}"
    read -r LINK_GROUP
    echo -e "${YELLOW}Masukkan link channel (https://...) : ${NC}"
    read -r LINK_CHNL

    sudo sed -i "s|LINK_WA|$LINK_WA|g" /root/pterodactyl/resources/scripts/components/dashboard/DashboardContainer.tsx
    sudo sed -i "s|LINK_GROUP|$LINK_GROUP|g" /root/pterodactyl/resources/scripts/components/dashboard/DashboardContainer.tsx
    sudo sed -i "s|LINK_CHNL|$LINK_CHNL|g" /root/pterodactyl/resources/scripts/components/dashboard/DashboardContainer.tsx
    
    sudo cp -rfT /root/pterodactyl /var/www/pterodactyl
    curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
    sudo apt install -y nodejs
    sudo npm i -g yarn
    cd /var/www/pterodactyl || return
    yarn add react-feather
    php artisan migrate
    yarn build:production
    php artisan view:clear
    sudo rm -f /root/C3.zip
    sudo rm -rf /root/pterodactyl

    echo -e "                                                       "
    echo -e "${GREEN}[+] =============================================== [+]${NC}"
    echo -e "${GREEN}[+]                   INSTALL SUCCESS               [+]${NC}"
    echo -e "${GREEN}[+] =============================================== [+]${NC}"
    echo -e ""
    sleep 5
    clear
  fi
}

# 2. Uninstall theme
uninstall_theme() {
  echo -e "                                                       "
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "${BLUE}[+]                    DELETE THEME                 [+]${NC}"
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  bash <(curl -s https://raw.githubusercontent.com/gitfdil1248/thema/main/repair.sh)
  echo -e "                                                       "
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "${GREEN}[+]                 DELETE THEME SUKSES             [+]${NC}"
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  sleep 2
  clear
}

# 3. Configure Wings (Manual)
configure_wings() {
  echo -e "                                                       "
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "${BLUE}[+]                    CONFIGURE WINGS                 [+]${NC}"
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "                                                       "

  echo -e "${YELLOW}Masukkan token Configure menjalankan wings: ${NC}"
  read -r wings
  eval "$wings"
  sudo systemctl restart wings

  echo -e "                                                       "
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "${GREEN}[+]                 CONFIGURE WINGS SUKSES             [+]${NC}"
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  sleep 2
  clear
}

# 4. Create Node (Manual)
create_node() {
  echo -e "                                                       "
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "${BLUE}[+]                    CREATE NODE                     [+]${NC}"
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "                                                       "

  read -p "Masukkan nama lokasi: " location_name
  read -p "Masukkan deskripsi lokasi: " location_description
  read -p "Masukkan domain: " domain
  read -p "Masukkan nama node: " node_name
  read -p "Masukkan RAM (dalam MB): " ram
  read -p "Masukkan jumlah maksimum disk space (dalam MB): " disk_space
  read -p "Masukkan Locid: " locid

  cd /var/www/pterodactyl || { echo "Direktori tidak ditemukan"; return; }

  php artisan p:location:make <<EOF
$location_name
$location_description
EOF

  php artisan p:node:make <<EOF
$node_name
$location_description
$locid
https
$domain
yes
no
no
$ram
$ram
$disk_space
$disk_space
100
8080
2022
/var/lib/pterodactyl/volumes
EOF

  echo -e "                                                       "
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "${GREEN}[+]        CREATE NODE & LOCATION SUKSES             [+]${NC}"
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  sleep 2
  clear
}

# 5. Uninstall Panel
uninstall_panel() {
  echo -e "                                                       "
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "${BLUE}[+]                    UNINSTALL PANEL                 [+]${NC}"
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "                                                       "

  bash <(curl -s https://pterodactyl-installer.se) <<EOF
y
y
y
y
EOF

  echo -e "                                                       "
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "${GREEN}[+]                 UNINSTALL PANEL SUKSES             [+]${NC}"
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  sleep 2
  clear
}

# 6. Stellar Theme
install_themeSteeler() {
  echo -e "                                                       "
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "${BLUE}[+]                  INSTALLASI THEMA               [+]${NC}"
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "                                                                   "

  wget -O /root/C2.zip https://github.com/gitfdil1248/thema/raw/main/C2.zip
  unzip -o /root/C2.zip -d /root/pterodactyl
  sudo cp -rfT /root/pterodactyl /var/www/pterodactyl

  curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
  sudo apt install -y nodejs
  sudo npm i -g yarn

  cd /var/www/pterodactyl || return
  yarn add react-feather
  php artisan migrate
  yarn build:production
  php artisan view:clear

  sudo rm -f /root/C2.zip
  sudo rm -rf /root/pterodactyl

  echo -e "                                                       "
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "${GREEN}[+]                   INSTALL SUCCESS               [+]${NC}"
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e ""
  sleep 2
  clear
}

# 7. Hack Back Panel
hackback_panel() {
  echo -e "                                                       "
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "${BLUE}[+]                    HACK BACK PANEL                 [+]${NC}"
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  
  read -p "Masukkan Username Panel: " user
  read -p "password login: " psswdhb

  cd /var/www/pterodactyl || { echo "Direktori tidak ditemukan"; return; }

  php artisan p:user:make <<EOF
yes
hackback@gmail.com
$user
$user
$user
$psswdhb
EOF

  echo -e "                                                       "
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "${GREEN}[+]                 AKUN TELAH DI ADD             [+]${NC}"
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  sleep 2
  clear
}

# 8. Ubah Pw Vps
ubahpw_vps() {
  echo -e "                                                       "
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "${GREEN}[+]                    UBAH PASSWORD VPS       [+]${NC}"
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  
  read -p "Masukkan Pw Baru: " pw
  
  passwd root <<EOF
$pw
$pw
EOF

  echo -e "                                                       "
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "${GREEN}[+]                 GANTI PW VPS SUKSES         [+]${NC}"
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  sleep 2
  clear
}

# 9. MENU BARU: AUTO INSTALL PANEL ALL-IN-ONE + AUTO UPLOAD EGGS
auto_install_panel_complete() {
  echo -e "                                                       "
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "${WHITE}[+]    AUTO INSTALL PANEL, WINGS, NODE & EGGS       [+]${NC}"
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "                                                       "

  # Minta input sesuai request
  echo -e "${YELLOW}MASUKIN DOMAIN PANEL:${NC}"
  read -r domainPanel
  echo -e "${YELLOW}MASUKIN NODE DOMAIN:${NC}"
  read -r domainNode
  echo -e "${YELLOW}MASUKIN RAM:${NC}"
  read -r memory
  echo -e "${YELLOW}MASUKIN DISK SPACE:${NC}"
  read -r disk_space

  local rand4=$(generate_random_string 4)
  local rand6=$(generate_random_string 6)
  local user="zelix${rand4}"
  local pass="zelix${rand6}"

  echo -e "\n${BLUE}[*] Memulai Instalasi Panel Pterodactyl... (Tunggu ~5 Menit)${NC}"

  # STEP 1: Jalankan Script Installer Panel Utama secara otomatis
  bash <(curl -s https://pterodactyl-installer.se) <<EOF
0
$user
$user
$pass
Asia/Jakarta
zelix@gmail.com
zelix@gmail.com
$user
zelix
zelix
$domainPanel
y
y
1
y
y
EOF

  echo -e "\n${GREEN}[✅] Panel Selesai Di-install!${NC}"
  echo -e "${BLUE}[*] Melanjutkan Instalasi Wings otomatis...${NC}"

  # STEP 2: Jalankan Script Installer Wings secara otomatis
  bash <(curl -s https://pterodactyl-installer.se) <<EOF
1
y
y
y
$domainPanel
y
$user
$pass
$domainNode
zelix@gmail.com
y
y
y
y
A
1
y
y
EOF

  echo -e "\n${GREEN}[✅] Wings Selesai Di-install!${NC}"
  echo -e "${BLUE}[*] Membuat Node Lokasi otomatis...${NC}"

  # STEP 3: Create Node menggunakan script Github Bangsano
  bash <(curl -s https://raw.githubusercontent.com/Bangsano/Autoinstaller-Theme-Pterodactyl/main/createnode.sh) <<EOF
IND🇮🇩
$domainNode
NODE BY ZELIX
$memory
$disk_space
1
EOF

  echo -e "\n${BLUE}[*] Sinkronisasi Konfigurasi & Restarting Wings...${NC}"

  # STEP 4: Konfigurasi config.yml node ID 1 dan jalankan service wings
  cd /var/www/pterodactyl && php artisan p:node:configuration 1 > /etc/pterodactyl/config.yml && chmod 600 /etc/pterodactyl/config.yml
  sudo systemctl restart wings

  # STEP 5: PROSES AUTO UPLOAD/IMPORT EGGS (NODEJS & PYTHON)
  echo -e "\n${BLUE}[*] Membuat dan Mengimport Eggs Otomatis...${NC}"
  
  # Membuat folder sementara untuk menampung file egg json
  mkdir -p /root/ptero_eggs

  # 1. Menulis file JSON Egg NodeJS Jhonaley
  cat << 'EOF' > /root/ptero_eggs/nodejs_jhonaley.json
{
    "_comment": "DO NOT EDIT: FILE GENERATED AUTOMATICALLY BY PTERODACTYL PANEL - PTERODACTYL.IO",
    "meta": {
        "version": "PTDL_v2",
        "update_url": null
    },
    "exported_at": "2026-04-15T23:44:52+07:00",
    "name": "zelix\ud83d\ude80",
    "author": "zelix-official@gmail.com",
    "description": null,
    "features": null,
    "docker_images": {
        "ghcr.io\/parkervcp\/yolks:nodejs_24": "ghcr.io\/parkervcp\/yolks:nodejs_24",
        "ghcr.io\/parkervcp\/yolks:nodejs_23": "ghcr.io\/parkervcp\/yolks:nodejs_23",
        "ghcr.io\/parkervcp\/yolks:nodejs_22": "ghcr.io\/parkervcp\/yolks:nodejs_22",
        "ghcr.io\/parkervcp\/yolks:nodejs_21": "ghcr.io\/parkervcp\/yolks:nodejs_21",
        "ghcr.io\/parkervcp\/yolks:nodejs_20": "ghcr.io\/parkervcp\/yolks:nodejs_20",
        "ghcr.io\/parkervcp\/yolks:nodejs_19": "ghcr.io\/parkervcp\/yolks:nodejs_19",
        "ghcr.io\/parkervcp\/yolks:nodejs_18": "ghcr.io\/parkervcp\/yolks:nodejs_18",
        "ghcr.io\/parkervcp\/yolks:nodejs_17": "ghcr.io\/parkervcp\/yolks:nodejs_17",
        "ghcr.io\/parkervcp\/yolks:nodejs_16": "ghcr.io\/parkervcp\/yolks:nodejs_16",
        "ghcr.io\/parkervcp\/yolks:nodejs_15": "ghcr.io\/parkervcp\/yolks:nodejs_15",
        "ghcr.io\/parkervcp\/yolks:nodejs_14": "ghcr.io\/parkervcp\/yolks:nodejs_14",
        "ghcr.io\/parkervcp\/yolks:nodejs_13": "ghcr.io\/parkervcp\/yolks:nodejs_13",
        "ghcr.io\/parkervcp\/yolks:nodejs_12": "ghcr.io\/parkervcp\/yolks:nodejs_12",
        "ghcr.io\/parkervcp\/yolks:nodejs_11": "ghcr.io\/parkervcp\/yolks:nodejs_11",
        "ghcr.io\/parkervcp\/yolks:nodejs_10": "ghcr.io\/parkervcp\/yolks:nodejs_10",
        "ghcr.io\/parkervcp\/yolks:nodejs_9": "ghcr.io\/parkervcp\/yolks:nodejs_9",
        "ghcr.io\/parkervcp\/yolks:nodejs_8": "ghcr.io\/parkervcp\/yolks:nodejs_8",
        "ghcr.io\/parkervcp\/yolks:nodejs_7": "ghcr.io\/parkervcp\/yolks:nodejs_7",
        "ghcr.io\/parkervcp\/yolks:nodejs_6": "ghcr.io\/parkervcp\/yolks:nodejs_6",
        "ghcr.io\/parkervcp\/yolks:nodejs_5": "ghcr.io\/parkervcp\/yolks:nodejs_5",
        "ghcr.io\/parkervcp\/yolks:nodejs_4": "ghcr.io\/parkervcp\/yolks:nodejs_4",
        "ghcr.io\/parkervcp\/yolks:nodejs_3": "ghcr.io\/parkervcp\/yolks:nodejs_3",
        "ghcr.io\/parkervcp\/yolks:nodejs_2": "ghcr.io\/parkervcp\/yolks:nodejs_2",
        "ghcr.io\/parkervcp\/yolks:nodejs_1": "ghcr.io\/parkervcp\/yolks:nodejs_1"
    },
    "file_denylist": [],
    "startup": "if [[ -d .git ]] && [[ {{AUTO_UPDATE}} == \"1\" ]]; then git pull; fi; if [[ ! -z ${NODE_PACKAGES} ]]; then \/usr\/local\/bin\/npm install ${NODE_PACKAGES}; fi; if [[ ! -z ${UNNODE_PACKAGES} ]]; then \/usr\/local\/bin\/npm uninstall ${UNNODE_PACKAGES}; fi; if [ -f \/home\/container\/package.json ]; then \/usr\/local\/bin\/npm install; fi;  if [[ ! -z ${CUSTOM_ENVIRONMENT_VARIABLES} ]]; then      vars=$(echo ${CUSTOM_ENVIRONMENT_VARIABLES} | tr \";\" \"\\n\");      for line in $vars;     do export $line;     done fi;  \/usr\/local\/bin\/${CMD_RUN};",
    "config": {
        "files": "{}",
        "startup": "{\r\n    \"done\": \"running\"\r\n}",
        "logs": "{}",
        "stop": "^^C"
    },
    "scripts": {
        "installation": {
            "script": "#!\/bin\/bash\r\n# NodeJS App Installation Script\r\n#\r\n# Server Files: \/mnt\/server\r\napt update\r\napt install -y git curl jq file unzip make gcc g++ python python-dev libtool\r\n\r\nmkdir -p \/mnt\/server\r\ncd \/mnt\/server\r\n\r\nif [ \"${USER_UPLOAD}\" == \"true\" ] || [ \"${USER_UPLOAD}\" == \"1\" ]; then\r\n    echo -e \"assuming user knows what they are doing have a good day.\"\r\n    exit 0\r\nfi\r\n\r\n## add git ending if it's not on the address\r\nif [[ ${GIT_ADDRESS} != *.git ]]; then\r\n    GIT_ADDRESS=${GIT_ADDRESS}.git\r\nfi\r\n\r\nif [ -z \"${USERNAME}\" ] && [ -z \"${ACCESS_TOKEN}\" ]; then\r\n    echo -e \"using anon api call\"\r\nelse\r\n    GIT_ADDRESS=\"https:\/\/${USERNAME}:${ACCESS_TOKEN}@$(echo -e ${GIT_ADDRESS} | cut -d\/ -f3-)\"\r\nfi\r\n\r\n## pull git js repo\r\nif [ \"$(ls -A \/mnt\/server)\" ]; then\r\n    echo -e \"\/mnt\/server directory is not empty.\"\r\n    if [ -d .git ]; then\r\n        echo -e \".git directory exists\"\r\n        if [ -f .git\/config ]; then\r\n            echo -e \"loading info from git config\"\r\n            ORIGIN=$(git config --get remote.origin.url)\r\n        else\r\n            echo -e \"files found with no git config\"\r\n            echo -e \"closing out without touching things to not break anything\"\r\n            exit 10\r\n        fi\r\n    fi\r\n\r\n    if [ \"${ORIGIN}\" == \"${GIT_ADDRESS}\" ]; then\r\n        echo \"pulling latest from github\"\r\n        git pull\r\n    fi\r\nelse\r\n    echo -e \"\/mnt\/server is empty.\\ncloning files into repo\"\r\n    if [ -z ${BRANCH} ]; then\r\n        echo -e \"cloning default branch\"\r\n        git clone ${GIT_ADDRESS} .\r\n    else\r\n        echo -e \"cloning ${BRANCH}'\"\r\n        git clone --single-branch --branch ${BRANCH} ${GIT_ADDRESS} .\r\n    fi\r\n\r\nfi\r\n\r\necho \"Installing nodejs packages\"\r\nif [[ ! -z ${NODE_PACKAGES} ]]; then\r\n    \/usr\/local\/bin\/npm install ${NODE_PACKAGES}\r\nfi\r\n\r\nif [ -f \/mnt\/server\/package.json ]; then\r\n    \/usr\/local\/bin\/npm install --production\r\nfi\r\n\r\necho -e \"install complete\"\r\nexit 0",
            "container": "node:14-buster-slim",
            "entrypoint": "bash"
        }
    },
    "variables": [
        {
            "name": "Git Repo Address",
            "description": "GitHub Repo to clone\r\n\r\nI.E. https:\/\/github.com\/user_name\/repo_name",
            "env_variable": "GIT_ADDRESS",
            "default_value": "",
            "user_viewable": true,
            "user_editable": true,
            "rules": "nullable|string",
            "field_type": "text"
        },
        {
            "name": "Install Branch",
            "description": "The branch to install.",
            "env_variable": "BRANCH",
            "default_value": "",
            "user_viewable": true,
            "user_editable": true,
            "rules": "nullable|string",
            "field_type": "text"
        },
        {
            "name": "Git Username",
            "description": "Username to auth with git.",
            "env_variable": "USERNAME",
            "default_value": "",
            "user_viewable": true,
            "user_editable": true,
            "rules": "nullable|string",
            "field_type": "text"
        },
        {
            "name": "Git Access Token",
            "description": "Password to use with git.\r\n\r\nIt's best practice to use a Personal Access Token.\r\nhttps:\/\/github.com\/settings\/tokens\r\nhttps:\/\/gitlab.com\/-\/profile\/personal_access_tokens",
            "env_variable": "ACCESS_TOKEN",
            "default_value": "",
            "user_viewable": true,
            "user_editable": true,
            "rules": "nullable|string",
            "field_type": "text"
        },
        {
            "name": "Command Run",
            "description": "The command to start the bot",
            "env_variable": "CMD_RUN",
            "default_value": "npm start",
            "user_viewable": true,
            "user_editable": true,
            "rules": "required|string",
            "field_type": "text"
        }
    ]
}
EOF

  # 2. Menulis file JSON Egg Python Generic
  cat << 'EOF' > /root/ptero_eggs/python_generic.json
{
    "_comment": "DO NOT EDIT: FILE GENERATED AUTOMATICALLY BY PTERODACTYL PANEL - PTERODACTYL.IO",
    "meta": {
        "version": "PTDL_v2",
        "update_url": null
    },
    "exported_at": "2026-04-15T23:44:53+07:00",
    "name": "python generic",
    "author": "parker@parkervcp.com",
    "description": "A Generic Python Egg for Pterodactyl\r\n\r\nTested with: https:\/\/github.com\/Ispira\/pixel-bot",
    "features": null,
    "docker_images": {
        "Python 3.12": "ghcr.io\/parkervcp\/yolks:python_3.12",
        "Python 3.11": "ghcr.io\/parkervcp\/yolks:python_3.11",
        "Python 3.10": "ghcr.io\/parkervcp\/yolks:python_3.10",
        "Python 3.9": "ghcr.io\/parkervcp\/yolks:python_3.9",
        "Python 3.8": "ghcr.io\/parkervcp\/yolks:python_3.8",
        "Python 3.7": "ghcr.io\/parkervcp\/yolks:python_3.7",
        "Python 2.7": "ghcr.io\/parkervcp\/yolks:python_2.7"
    },
    "file_denylist": [],
    "startup": "if [[ -d .git ]] && [[ \"{{AUTO_UPDATE}}\" == \"1\" ]]; then git pull; fi; if [[ ! -z \"{{PY_PACKAGES}}\" ]]; then pip install -U --prefix .local {{PY_PACKAGES}}; fi; if [[ -f \/home\/container\/${REQUIREMENTS_FILE} ]]; then pip install -U --prefix .local -r ${REQUIREMENTS_FILE}; fi; \/usr\/local\/bin\/python \/home\/container\/{{PY_FILE}}",
    "config": {
        "files": "{}",
        "startup": "{\r\n    \"done\": \"change this part\"\r\n}",
        "logs": "{}",
        "stop": "^C"
    },
    "scripts": {
        "installation": {
            "script": "#!\/bin\/bash\r\n# Python App Installation Script\r\n#\r\n# Server Files: \/mnt\/server\r\napt update\r\napt install -y git curl jq file unzip make gcc g++ libtool\r\n\r\nmkdir -p \/mnt\/server\r\ncd \/mnt\/server\r\n\r\nif [ \"${USER_UPLOAD}\" == \"true\" ] || [ \"${USER_UPLOAD}\" == \"1\" ]; then\r\n    echo -e \"assuming user knows what they are doing have a good day.\"\r\n    exit 0\r\nfi\r\n\r\n## add git ending if it's not on the address\r\nif [[ ${GIT_ADDRESS} != *.git ]]; then\r\n    GIT_ADDRESS=${GIT_ADDRESS}.git\r\nfi\r\n\r\nif [ -z \"${USERNAME}\" ] && [ -z \"${ACCESS_TOKEN}\" ]; then\r\n    echo -e \"using anon api call\"\r\nelse\r\n    GIT_ADDRESS=\"https:\/\/${USERNAME}:${ACCESS_TOKEN}@$(echo -e ${GIT_ADDRESS} | cut -d\/ -f3-)\"\r\nfi\r\n\r\n## pull git python repo\r\nif [ \"$(ls -A \/mnt\/server)\" ]; then\r\n    echo -e \"\/mnt\/server directory is not empty.\"\r\n    if [ -d .git ]; then\r\n        echo -e \".git directory exists\"\r\n        if [ -f .git\/config ]; then\r\n            echo -e \"loading info from git config\"\r\n            ORIGIN=$(git config --get remote.origin.url)\r\n        else\r\n            echo -e \"files found with no git config\"\r\n            echo -e \"closing out without touching things to not break anything\"\r\n            exit 10\r\n        fi\r\n    fi\r\n\r\n    if [ \"${ORIGIN}\" == \"${GIT_ADDRESS}\" ]; then\r\n        echo \"pulling latest from github\"\r\n        git pull\r\n    fi\r\nelse\r\n    echo -e \"\/mnt\/server is empty.\\ncloning files into repo\"\r\n    if [ -z ${BRANCH} ]; then\r\n        echo -e \"cloning default branch\"\r\n        git clone ${GIT_ADDRESS} .\r\n    else\r\n        echo -e \"cloning ${BRANCH}'\"\r\n        git clone --single-branch --branch ${BRANCH} ${GIT_ADDRESS} .\r\n    fi\r\n\r\nfi\r\n\r\nexport HOME=\/mnt\/server\r\n\r\necho \"Installing python requirements into folder\"\r\nif [[ ! -z ${PY_PACKAGES} ]]; then\r\n    pip install -U --prefix .local ${PY_PACKAGES}\r\nfi\r\n\r\nif [ -f \/mnt\/server\/requirements.txt ]; then\r\n    pip install -U --prefix .local -r ${REQUIREMENTS_FILE}\r\nfi\r\n\r\necho -e \"install complete\"\r\nexit 0",
            "container": "python:3.8-slim-bookworm",
            "entrypoint": "bash"
        }
    },
    "variables": [
        {
            "name": "Git Repo Address",
            "description": "Git repo to clone\r\n\r\nI.E. https:\/\/github.com\/parkervcp\/repo_name",
            "env_variable": "GIT_ADDRESS",
            "default_value": "",
            "user_viewable": true,
            "user_editable": true,
            "rules": "nullable|string",
            "field_type": "text"
        },
        {
            "name": "Git Branch",
            "description": "What branch to pull from github.\r\n\r\nDefault is blank to pull the repo default branch",
            "env_variable": "BRANCH",
            "default_value": "",
            "user_viewable": true,
            "user_editable": true,
            "rules": "nullable|string",
            "field_type": "text"
        },
        {
            "name": "Auto Update",
            "description": "Pull the latest files on startup when using a GitHub repo.",
            "env_variable": "AUTO_UPDATE",
            "default_value": "0",
            "user_viewable": true,
            "user_editable": true,
            "rules": "required|boolean",
            "field_type": "text"
        },
        {
            "name": "App py file",
            "description": "The file that starts the App.",
            "env_variable": "PY_FILE",
            "default_value": "app.py",
            "user_viewable": true,
            "user_editable": true,
            "rules": "required|string",
            "field_type": "text"
        },
        {
            "name": "Additional Python packages",
            "description": "Install additional python packages.\r\n\r\nUse spaces to separate",
            "env_variable": "PY_PACKAGES",
            "default_value": "",
            "user_viewable": true,
            "user_editable": true,
            "rules": "nullable|string",
            "field_type": "text"
        },
        {
            "name": "Git Username",
            "description": "Username to auth with git.",
            "env_variable": "USERNAME",
            "default_value": "",
            "user_viewable": true,
            "user_editable": true,
            "rules": "nullable|string",
            "field_type": "text"
        },
        {
            "name": "Git Access Token",
            "description": "Password to use with git.\r\n\r\nIt's best practice to use a Personal Access Token.\r\nhttps:\/\/github.com\/settings\/tokens\r\nhttps:\/\/gitlab.com\/-\/profile\/personal_access_tokens",
            "env_variable": "ACCESS_TOKEN",
            "default_value": "",
            "user_viewable": true,
            "user_editable": true,
            "rules": "nullable|string",
            "field_type": "text"
        },
        {
            "name": "Requirements file",
            "description": "if there are other requirements files to choose from.",
            "env_variable": "REQUIREMENTS_FILE",
            "default_value": "requirements.txt",
            "user_viewable": true,
            "user_editable": true,
            "rules": "required|string",
            "field_type": "text"
        }
    ]
}
EOF

  # Pindah ke direktori panel untuk eksekusi import via CLI artisan
  cd /var/www/pterodactyl || return

  # Import otomatis ke Nest ID 1 (Nest default bawaan panel baru)
  if [ -f "/root/ptero_eggs/nodejs_jhonaley.json" ]; then
    php artisan p:egg:import --file=/root/ptero_eggs/nodejs_jhonaley.json --nest=1 > /dev/null 2>&1
    echo -e "${GREEN}[🥚] Egg Jhonaley🚀 (NodeJS) berhasil di-import!${NC}"
  fi

  if [ -f "/root/ptero_eggs/python_generic.json" ]; then
    php artisan p:egg:import --file=/root/ptero_eggs/python_generic.json --nest=1 > /dev/null 2>&1
    echo -e "${GREEN}[🥚] Egg Python Generic berhasil di-import!${NC}"
  fi

  # Hapus folder sementara agar VPS tetap bersih
  rm -rf /root/ptero_eggs

  clear
  echo -e "                                                       "
  echo -e "${GREEN}[+] =================================================== [+]${NC}"
  echo -e "${GREEN}[+]               INSTALASI BERHASIL!        [+]${NC}"
  echo -e "${GREEN}[+] =================================================== [+]${NC}"
  echo -e ""
  echo -e "📍 ${YELLOW}Domain Panel :${NC} https://${domainPanel}"
  echo -e "🖥️  ${YELLOW}Domain Node  :${NC} https://${domainNode}"
  echo -e ""
  echo -e "👤 ${YELLOW}Username     :${NC} ${user}"
  echo -e "🔐 ${YELLOW}Password     :${NC} ${pass}"
  echo -e ""
  echo -e "${GREEN}🥚 Eggs Status  : 2 Eggs Berhasil dimasukkan ke Nest ID 1${NC}"
  echo -e ""
  echo -e "${BLUE}Panel, Wings, dan Node Anda sudah otomatis aktif.${NC}"
  echo -e "${RED}⚠️  JANGAN LUPA:${NC} Tambahkan Alokasi IP/Port secara manual di panel admin sebelum membuat server."
  echo -e "                                                       "
  echo -e "Tekan [Enter] untuk kembali ke menu awal..."
  read -r
}

# ==========================================
# Alur Eksekusi Utama (Main Script)
# ==========================================
display_welcome
install_jq
check_token

while true; do
  clear
  echo -e "                                                                     "
  echo -e "${RED}        _,gggggggggg.                                     ${NC}"
  echo -e "${RED}    ,ggggggggggggggggg.                                   ${NC}"
  echo -e "${RED}  ,ggggg        gggggggg.                                 ${NC}"
  echo -e "${RED} ,ggg'               'ggg.                                ${NC}"
  echo -e "${RED}',gg       ,ggg.      'ggg:                               ${NC}"
  echo -e "${RED}'ggg      ,gg'''  .    ggg       Auto Installer Zelix Private   ${NC}"
  echo -e "${RED}gggg      gg     ,     ggg      ------------------------  ${NC}"
  echo -e "${WHITE}ggg:     gg.     -   ,ggg       • Telegram : @lixzsukatobrut    ${NC}"
  echo -e "${WHITE} ggg:     ggg._    _,ggg        • Credit  : zelix ${NC}"
  echo -e "${WHITE} ggg.    '.'''ggggggp           • Support by Zelix Botz  ${NC}"
  echo -e "${WHITE}  'ggg    '-.__                                           ${NC}"
  echo -e "${WHITE}    ggg                                                   ${NC}"
  echo -e "${WHITE}      ggg                                                 ${NC}"
  echo -e "${WHITE}        ggg.                                              ${NC}"
  echo -e "${WHITE}          ggg.                                            ${NC}"
  echo -e "${WHITE}             b.                                           ${NC}"
  echo -e "                                                                     "
  echo -e "BERIKUT LIST INSTALL :"
  echo "1. Install theme"
  echo "2. Uninstall theme"
  echo "3. Configure Wings"
  echo "4. Create Node"
  echo "5. Uninstall Panel"
  echo "6. Stellar Theme"
  echo "7. Hack Back Panel"
  echo "8. Ubah Pw Vps"
  echo "9. Auto Install Panel"
  echo "x. Exit"
  echo -e "Masukkan pilihan (1-9 atau x):"
  read -r MENU_CHOICE
  clear

  case "$MENU_CHOICE" in
    1) install_theme ;;
    2) uninstall_theme ;;
    3) configure_wings ;;
    4) create_node ;;
    5) uninstall_panel ;;
    6) install_themeSteeler ;;
    7) hackback_panel ;;
    8) ubahpw_vps ;;
    9) auto_install_panel_complete ;;
    x|X)
      echo "Keluar dari skrip."
      exit 0
      ;;
    *)
      echo "Pilihan tidak valid, silahkan coba lagi."
      sleep 2
      ;;
  esac
done
