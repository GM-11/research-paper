import { writable } from "svelte/store";
import { ethers } from "ethers";

type User = {
  address: string;
  provider: ethers.BrowserProvider;
  signer: ethers.Signer;
  name: string;
  userType: 0 | 1;
};

export const user = writable<User>();

// user.subscribe((value) => {
//   if (value) {
//     localStorage.setItem("user", JSON.stringify(value));
//   } else {
//     localStorage.removeItem("user");
//   }
// });

// user.update((value) => {
//   const user = localStorage.getItem("user");
//   if (user) {
//     return JSON.parse(user);
//   }
//   return value;
// });
