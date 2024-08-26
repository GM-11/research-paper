<script>
  import { onMount } from "svelte";
  import { user } from "../../stores/userStore";
  import { loginUser } from "$lib/utils";
  import StudentHome from "../../screens/studentHome.svelte";
  import ProfessorHome from "../../screens/professorHome.svelte";

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
    {#if Number($user.userType) === 0}
      <ProfessorHome />
    {:else}
      <StudentHome />
    {/if}
  {:else}
    <h1>Connect your wallet</h1>
  {/if}
  <!-- {#if $user}
    {#if $user.type === 0}
      <h1>Welcome, Professor {$user.name}</h1>
    {:else}

  <h1>Welcome, Student {$user.name}</h1>
  {/if}
  {/if}
  {:else}
    <h1>Connect your wallet</h1>
  {/if} -->
</main>
