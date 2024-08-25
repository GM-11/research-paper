<script lang="ts">
  import { goto } from "$app/navigation";
  import { connectWallet, createUser } from "$lib/utils";
  import { onMount } from "svelte";
  import { user } from "../../stores/userStore";
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
  <button
    on:click={async () => {
      await createUser(name, type);
      if ($user) {
        goto("/home", { replaceState: true });
      }
    }}>Connect Wallet</button
  >
</main>
