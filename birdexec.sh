echo "Switch to BirdEXEC!"
echo "Starting Minecraft"
cd bird-files
echo "Starting Port Forwarding..."
sudo systemctl start playit
echo "Done!"
java -Xmx2G -jar server.jar nogui
echo "Stopping Port Forwarding..."
sudo systemctl stop playit
echo "Done!"
echo "Thanks for using Birdie!"
