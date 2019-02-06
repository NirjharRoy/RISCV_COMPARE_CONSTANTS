OUTPUT_ARCH( "riscv" )
ENTRY( _start )
SECTIONS 
{
  . = 0x00001000;
  .text : {
    *(.text._start)
    *(.text)
  }
  . = ALIGN(0x00001000);
  .rodata : 
  { 
    *(.rdata)
    *(.rodata)
  }
  .data : { *(.data) }
  .bss : { *(.bss) }
  .debug : { *(.debug) }
  
  __malloc_start = .;
  . = . + 1024; 

  _end = .;
}
