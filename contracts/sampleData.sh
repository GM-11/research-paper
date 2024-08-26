read -p "Enter Users contract address: " usersContract
read -p "Enter Project Factory contract address: " projectFactoryContract


cast send $usersContract "createUser(string, string, uint8)" "Gopal" "gopal@gmail.com" 0 --rpc-url http://127.0.0.1:8545 --private-key 0x7c852118294e51e653712a81e05800f419141751be58f605c371e15141b007a6

cast send $usersContract "createUser(string, string, uint8)" "Romit" "romit@gmail.com" 0 --rpc-url http://127.0.0.1:8545 --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80

cast send $usersContract "createUser(string, string, uint8)" "Rhythm" "rhythm@gmail.com" 0 --rpc-url http://127.0.0.1:8545 --private-key 0x47e179ec197488593b187f80a00eb0da91f1b9d0b13f8733639f19c30a34926a

cast send $usersContract "createUser(string, string, uint8)" "Ansh" "Ansh@gmail.com" 0 --rpc-url http://127.0.0.1:8545 --private-key 0x8b3a350cf5c34c9194ca85829a2df0ec3153be0318b5e2d3348e872092edffba

cast send $usersContract "createUser(string, string, uint8)" "ksdfj" "pawan@gmail.com" 3 --rpc-url http://127.0.0.1:8545 --private-key 0x4bbbf85ce3377467afe5d46f804f221813b2bb87f24d81f60f1fcdbf7cbf4356

cast send $usersContract "createUser(string, string, uint8)" "Anil" "Anil@gmail.com" 1 --rpc-url http://127.0.0.1:8545 --private-key 0xdbda1821b80551c9d65939329250298aa3472ba22feea921c0cf5d620ea67b97


# cast send projectFactoryContract "createProject(string name, string paperUri, string topic, address[] contributers)" "Bio" "URI" "sometopic" --rpc-url http://127.0.0.1:8545 --private-key 0x7c852118294e51e653712a81e05800f419141751be58f605c371e15141b007a6

# cast send projectFactoryContract "createProject(string name, string paperUri, string topic)" "THermo" "URI" "sometopic" --rpc-url http://127.0.0.1:8545 --private-key 0x4bbbf85ce3377467afe5d46f804f221813b2bb87f24d81f60f1fcdbf7cbf4356

# cast send projectFactoryContract "createProject(string name, string paperUri, string topic)" "Eng" "URI" "sometopic" --rpc-url http://127.0.0.1:8545 --private-key 0x7c852118294e51e653712a81e05800f419141751be58f605c371e15141b007a6
