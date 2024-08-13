<script lang="ts">
	import {
		PROJECT_FACTORY_CONTRACT_ADDRESS,
		PROJECT_FACTORY_CONTRACT_ABI,
		PROJECT_ABI
	} from '$lib/contracts';
	import { ethers } from 'ethers';
	import { user } from '../stores/userStore';
	import { onMount, onDestroy } from 'svelte';
	let projects: Array<{ name: string; paperUri: string; topic: string; address: string }> = [];

	let file: File;

	async function getAllProjects() {
		const contract = new ethers.Contract(
			PROJECT_FACTORY_CONTRACT_ADDRESS,
			PROJECT_FACTORY_CONTRACT_ABI,
			$user.provider
		);

		const p = await contract.getAllProjects();
		for (let index = 0; index < p.length; index++) {
			const address = p[index];

			const project = new ethers.Contract(address, PROJECT_ABI, $user.provider);
			const name = await project.name();
			const paperUri = await project.paperUri();
			const topic = await project.topic();
			projects[index] = { name, paperUri, topic, address };
		}
	}

	onMount(() => {
		user.subscribe((value) => {
			if (value) {
				getAllProjects();
			}
		});
	});
</script>

{#if $user}
	<button on:click={getAllProjects}>Get All Projects</button>
	<br />
	<input value={file} type="file" />
	<br />

	<p><a href="/project">add new projcet</a></p>
	<h2>Projects</h2>
	{#each projects as project}
		<a href={`/project/${project.address}`}>
			<h1>
				{project.name}
			</h1></a
		>
		<p>{project.paperUri}</p>
	{/each}
{/if}
