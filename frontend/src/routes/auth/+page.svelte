<script lang="ts">
  import { goto } from "$app/navigation";
  import { connectWallet, createUser, loginUser } from "$lib/utils";
  import { onMount } from "svelte";
  import { user } from "../../stores/userStore";
  import { ethers } from "ethers";
  let name: string = "";
  let email: string = "";
  let type: 0 | 1 = 0;

  onMount(() => {
    if ($user) {
      goto("/home", { replaceState: true });
    }
  });
</script>

<main>
  <h1>Get started</h1>

  <input type="text" placeholder="Name" bind:value={name} />
  <input type="text" placeholder="Email" bind:value={email} />
  <select bind:value={type}>
    <option value={0}>Professor</option>
    <option value={1}>Student</option>
  </select>
  <button
    on:click={async () => {
      await createUser(name, email, type);
      if ($user) {
        goto("/home", { replaceState: true });
      }
    }}>Connect Wallet</button
  >

  <br /><br />

  <h1>Login</h1>
  <button
    on:click={async () => {
      if (window.ethereum) {
        const provider = new ethers.BrowserProvider(window.ethereum);
        await provider.send("eth_requestAccounts", []);
        const signer = await provider.getSigner();
        const address = await signer.getAddress();
        console.log(address);

        loginUser();
      }
    }}>Login using wallet</button
  >
</main>
