echo "Installing Dependencies..."
echo "Please Wait..."
#Define Dependencies...
DEPS="figlet openjdk-21-jdk tput"
echo "Installing: $DEPS..."
sudo apt install $DEPS -y > /dev/null
echo "Done!"
function print_centered {
     [[ $# == 0 ]] && return 1

     declare -i TERM_COLS="$(tput cols)"
     declare -i str_len="${#1}"
     [[ $str_len -ge $TERM_COLS ]] && {
          echo "$1";
          return 0;
     }

     declare -i filler_len="$(( (TERM_COLS - str_len) / 2 ))"
     [[ $# -ge 2 ]] && ch="${2:0:1}" || ch=" "
     filler=""
     for (( i = 0; i < filler_len; i++ )); do
          filler="${filler}${ch}"
     done

     printf "%s%s%s" "$filler" "$1" "$filler"
     [[ $(( (TERM_COLS - str_len) % 2 )) -ne 0 ]] && printf "%s" "${ch}"
     printf "\n"

     return 0
}
#Point where we change stuff.
clear
print_centered "-" "-"
figlet -f Birdie
print_centered "A Fully-Automatically Setting-Up Minecraft Server!" "-"
echo "Please wait... Now installing Birdie and Minecraft..."
echo "Making Pre-Install Folders..."
mkdir bird-files
cd bird-files
echo "Finished!"
echo "Downloading minecraft to: `bird-files`"
wget https://meta.fabricmc.net/v2/versions/loader/1.21/0.16.9/1.0.1/server/jar -O server.jar> /dev/null
echo "Setting up Fabric API and Forwarding..."
echo "Step 1 of 2 || Setup Fabric API.."
mkdir mods
cd mods
wget https://cdn.modrinth.com/data/P7dR8mSH/versions/oGwyXeEI/fabric-api-0.102.0%2B1.21.jar -O FabAPI_0.102.0-1_21.jar
#Lives Here now! :3 https://cdn.modrinth.com/data/P7dR8mSH/versions/oGwyXeEI/fabric-api-0.102.0%2B1.21.jar
echo "Step 2 of 2 || Setup Server Forwarding..."
echo "Running Installer..."
bash <(curl -sS https://raw.githubusercontent.com/aBoredDev/playit-setup-script/main/playit-setup.sh)
sudo systemctl stop playit
echo "Please follow the following instructions."
playit
echo "Setting Up Birdie EXEC..."
wget https://raw.githubusercontent.com/voidnonymous/birdie-mc/refs/heads/main/birdexec.sh -O birdexec.sh
bash birdexec.sh
exit

