OUTPUT_FORMAT("elf32-littlearm", "elf32-bigarm", "elf32-littlearm")
OUTPUT_ARCH(arm)
ENTRY(_start)

SECTIONS
{
	. = 0x0;
	.text : { *(.text) }
	. = 0x20000000;
	.data : { *(.data) }
	. = 0x10000000;
	.dts : { *(.dts) }
	.linux : { *(.linux) }
}
