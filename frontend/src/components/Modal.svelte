<script>
	export let showModal; // boolean
	let dialog; // HTMLDialogElement

	// Ouvre ou ferme le dialog selon showModal
	$: if (dialog) {
		if (showModal && !dialog.open) {
			dialog.showModal();
		}
		if (!showModal && dialog.open) {
			dialog.close();
		}
	}

	// Quand le dialog se ferme, on prévient le parent
	function handleClose() {
		// Émet un événement personnalisé 'close'
		const event = new CustomEvent('close');
		dispatchEvent(event);
	}
</script>

<!-- svelte-ignore a11y-click-events-have-key-events a11y-no-noninteractive-element-interactions -->
<dialog
	bind:this={dialog}
	on:close={() => { showModal = false; handleClose(); }}
	on:click|self={() => dialog.close()}
>
	<!-- svelte-ignore a11y-no-static-element-interactions -->
	<div on:click|stopPropagation>
		<hr />
		<slot/>
		<hr />
		<!-- svelte-ignore a11y-autofocus -->
		<button autofocus on:click={() => dialog.close()}>fermer la recette</button>
	</div>
</dialog>

<style>
	dialog {
		max-width: 32em;
		border-radius: 0.2em;
		border: none;
		padding: 0;
	}
	dialog::backdrop {
		background: rgba(0, 0, 0, 0.3);
	}
	dialog > div {
		padding: 1em;
		color: black;
	}
	dialog[open] {
		animation: zoom 0.3s cubic-bezier(0.34, 1.56, 0.64, 1);
	}
	@keyframes zoom {
		from {
			transform: scale(0.95);
		}
		to {
			transform: scale(1);
		}
	}
	dialog[open]::backdrop {
		animation: fade 0.2s ease-out;
	}
	@keyframes fade {
		from {
			opacity: 0;
		}
		to {
			opacity: 1;
		}
	}
	button {
		display: block;
	}
</style>
