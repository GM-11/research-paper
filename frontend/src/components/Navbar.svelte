<script lang="ts">
	import { ethers, type Eip1193Provider } from 'ethers';
	import { user } from '../stores/userStore';

	async function connectWallet() {
		if (window.ethereum) {
			const provider = new ethers.BrowserProvider(window.ethereum as Eip1193Provider);
			await provider.send('eth_requestAccounts', []);
			const signer = await provider.getSigner();
			const address = await signer.getAddress();

			window.ethereum.request({
				method: 'wallet_addEthereumChain',
				params: [
					{
						chainId: '0x7A69',
						rpcUrls: ['http://127.0.0.1:8545'],
						chainName: 'Anvil',
						nativeCurrency: {
							name: 'Anvil',
							symbol: 'GO',
							decimals: 18
						}
					}
				]
			});

			user.set({ address, provider, signer });
		}
	}
</script>

<nav>
	<h1>Research Paper</h1>

	{#if $user}
		<p>Connected Wallet: <strong>{$user.address}</strong></p>
	{:else}
		<button on:click={connectWallet}>Connect Wallet</button>
	{/if}
</nav>

<style>
	nav {
		display: flex;
		justify-content: space-between;
		align-items: center;
		background-color: coral;
	}

	:global(body) {
		margin: 0;
		padding: 0;
	}
</style>
