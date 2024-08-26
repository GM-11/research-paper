<script lang="ts">
  let name: string = "";
  let topic: string = "";
  let paperUri: string = "";
  let coAuthors: string[] = [];
</script>

<main>
  <input type="text" placeholder="Name" bind:value={name} />
  <br />
  <input type="text" placeholder="Topic" bind:value={topic} />
  <br />
  <input type="text" placeholder="Paperuri" bind:value={paperUri} />
  <br />
  <label
    >Invite co authors

    <input type="text" placeholder="Email" />
  </label>
  <br />
  <button>Submit</button>
</main>

<style>
  main {
    padding: 1rem;
  }
</style>
