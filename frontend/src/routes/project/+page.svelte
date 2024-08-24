<script lang="ts">
	let name: string = '';
	let topic: string = '';
	let paperUri: string = '';
</script>

<input type="text" placeholder="Name" bind:value={name} />
<br />
<input type="text" placeholder="Topic" bind:value={topic} />
<br />
<input type="text" placeholder="Paperuri" bind:value={paperUri} />
<br>
<button>Submit</button>