import { ethers, type Eip1193Provider } from 'ethers';
import { user } from '../stores/userStore';

export async function connectWallet() {
	if (window.ethereum) {
		const provider = new ethers.JsonRpcProvider('http://127.0.0.1:8545');
		await provider.send('eth_requestAccounts', []);
		const signer = await provider.getSigner();
		const address = await signer.getAddress();

		// window.ethereum.request({
		// 	method: 'wallet_addEthereumChain',
		// 	params: [
		// 		{
		// 			chainId: '0x7A69',
		// 			rpcUrls: ['http://127.0.0.1:8545'],
		// 			chainName: 'Anvil',
		// 			nativeCurrency: {
		// 				name: 'Anvil',
		// 				symbol: 'GO',
		// 				decimals: 18
		// 			}
		// 		}
		// 	]
		// });

		console.log('connected');

		user.set({ address, provider, signer });
	}
}
