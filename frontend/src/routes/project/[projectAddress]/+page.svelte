<script lang="ts">
  import { ethers } from "ethers";
  import type { PageProps } from "./+page";
  import { PROJECT_ABI } from "$lib/contracts";
  import { user } from "../../../stores/userStore";

  export let data: PageProps;

  let amount: number = 0.005;
  let mentorName: string = "";

  async function donate() {
    const contract = new ethers.Contract(
      data.projectAddress,
      PROJECT_ABI,
      $user.signer
    );
    const tx = await contract.fund({ value: ethers.parseEther(`${amount}`) });
    await tx.wait();
    console.log(tx);
  }

  async function becomeMentor() {
    if (!mentorName) {
      alert("Please enter mentor name");
      return;
    }
    const contract = new ethers.Contract(
      data.projectAddress,
      PROJECT_ABI,
      $user.signer
    );
    const tx = await contract.addMentor(mentorName, $user.address, {
      value: ethers.parseEther("0.01"),
    });
    await tx.wait();
    console.log(tx);
  }
</script>

<main>
  <h1>{data.name}</h1>
  <p>{data.projectAddress}</p>
  <p>balance: {data.balance / Math.pow(10, 18)}</p>

  <br />

  <h1>Become mentor</h1>
  <label for="mentorName">Mentor Name</label>
  <input id="mentorName" bind:value={mentorName} type="text" />
  <button on:click={becomeMentor}>Become mentor</button>

  <br />

  <br />
  <h1>Donate Amount</h1>
  <input id="amount" bind:value={amount} type="number" />

  <p>Amount to donate: {amount} ETH</p>
  <button on:click={donate}>donate</button>

  <button
    on:click={() => {
      for (let index = 0; index < data.mentors.length; index++) {
        const element = data.mentors[index];
        console.log(element);
      }
    }}>Get all mentors</button
  >
</main>

<style>
  main {
    padding: 1rem;
  }
</style>
