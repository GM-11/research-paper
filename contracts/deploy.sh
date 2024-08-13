BASE_MAINNET_RPC="https://mainnet.base.org"
BASE_SEPOLIA_RPC="https://sepolia.base.org"
ETHERSCAN_API_KEY="MJ3TYJ95PJ8CXWQWFIV6YFU5BMTBP8G7XK"

read -p "Enter network (local / prod): " network

if [ "$network" == "local" ]; then
echo "Deploying Project Factory Contract"
forge create ./src/ProjectFactory.sol:ProjectFactory --rpc-url http://127.0.0.1:8545 --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
echo ""
else
    echo "Invalid network type. Please enter 'local' or 'prod'."
fi

# cast send 0x5FbDB2315678afecb367f032d93F642f64180aa3 "createProject(string memory name, string memory paperUri, string memory topic)" "Chemistry Research" "uri" "asldfjk" --rpc-url http://127.0.0.1:8545 --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
# cast send 0x5FbDB2315678afecb367f032d93F642f64180aa3 "createProject(string memory name, string memory paperUri, string memory topic)" "Science Research" "another uri" "alal" --rpc-url http://127.0.0.1:8545 --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80


# cast call 0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512 "getAllProjects()" --rpc-url http://127.0.0.1:8545 --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80