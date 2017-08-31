.syntax unified
.text
.thumb
.global _start
_start:

#define ADDR_DTB        0x10000200
#define ADDR_LINUX      0x10008000

	mov     r0, #0
	mov     r1, #0xffffffff
	ldr     r2, =(0x10000200)
	ldr     pc, =(0x10008000 + 1)

/* data required by remoteproc loader and actual fw to provide info
 * about shared resources. It is writable, since it can be updated.
 */
.section .resource_table, "aw" @progbits
.word	1, 0, 0, 0	/* struct resource_table base */
.word	0		/* uint32_t offset[1] */

.section .dts, "aw" @progbits
.incbin "blob.bin"

.section .linux, "aw" @progbits
.incbin "blob.bin"
