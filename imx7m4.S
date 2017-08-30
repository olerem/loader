	.syntax unified
	.text
	.thumb
	.int 0x10020000                 @ Initial SP value
	.int reset + 1

reset:

#define ADDR_DTB        0x10000200
#define ADDR_LINUX      0x10008000

	mov     r0, #0
	mov     r1, #0xffffffff
	ldr     r2, =(ADDR_DTB)
	ldr     pc, =(ADDR_LINUX + 1)

	/* data required by remoteproc loader and actual fw to provide info
	 * about shared resources
	 */
	.data
	.section .resource_table, "aw" @progbits
	.word	1, 0, 0, 0	/* struct resource_table base */
	.word	0		/* uint32_t offset[1] */

