BASE_MAINNET_RPC="https://mainnet.base.org"
BASE_SEPOLIA_RPC="https://sepolia.base.org"
ETHERSCAN_API_KEY="MJ3TYJ95PJ8CXWQWFIV6YFU5BMTBP8G7XK"

read -p "Enter network (local / prod): " network

if [ "$network" == "local" ]; then
echo "Deploying Project Factory Contract"
forge create ./src/ProjectFactory.sol:ProjectFactory --rpc-url http://127.0.0.1:8545 --private-key 0x2a871d0798f97d79848a013d4936a73bf4cc922c825d33c1cf7073dff6d409c6
echo ""
else
    echo "Invalid network type. Please enter 'local' or 'prod'."
fi

s

# cast call 0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512 "getAllProjects()" --rpc-url http://127.0.0.1:8545 --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80