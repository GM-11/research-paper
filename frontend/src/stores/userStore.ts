import { writable } from 'svelte/store';
import { ethers } from 'ethers';

type User = {
	address: string;
	provider: ethers.BrowserProvider;
	signer: ethers.Signer;
};

export const user = writable<User>();
