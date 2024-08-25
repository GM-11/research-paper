<script>
  import { onMount } from "svelte";
  import { user } from "../../stores/userStore";
  import { connectWallet, loginUser } from "$lib/utils";

  async function login() {
    try {
      await loginUser();
      
    } catch (error) {
      alert(error);
    }
  }

  onMount(() => {
    login();
  });
</script>

<main>
  {#if $user}
    <h1>Welcome, {$user.name}</h1>
  {:else}
    <h1>Connect your wallet</h1>
  {/if}
</main>
