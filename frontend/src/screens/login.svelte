<script lang="ts">
  import { connectWallet } from "$lib/utils";
  let name: string = "";
  let type: 0 | 1 = 0;
</script>

<main>
  <h1>Get started</h1>

  <input type="text" placeholder="Name" bind:value={name} />
  <select bind:value={type}>
    <option value="0">Student</option>
    <option value="1">Professor</option>
  </select>
  <button on:click={() => connectWallet(name, type)}>Connect Wallet</button>
</main>
