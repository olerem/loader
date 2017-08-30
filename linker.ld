SECTIONS
{
	. = 0x0;
	.text : { *(.text) }
	. = 0x20000000;
	.data : { *(.data) }
	. = 0x10000200;
	.dts : { *(.dts) }
	. = 0x10008000;
	.linux : { *(.linux) }
}
