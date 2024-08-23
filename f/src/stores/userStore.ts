import { writable } from 'svelte/store';
import { ethers } from 'ethers';

type User = {
	address: string;
	provider: ethers.JsonRpcProvider;
	signer: ethers.Signer;
};

export const user = writable<User>();
