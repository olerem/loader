	.syntax unified
	.text
	.thumb
	.int 0x10020000                 @ Initial SP value
	.int reset + 1

reset:
	
	mov	r0, #0x55
	ldr	r1, =(0x40)
1:
	str	r0, [r1]
	add	r0, 1
	b	1b

	/* data required by remoteproc loader and actual fw to provide info
	 * about shared resources
	 */
	.data
	.section .resource_table, "aw" @progbits
	.word	1, 0, 0, 0	/* struct resource_table base */
	.word	0		/* uint32_t offset[1] */

