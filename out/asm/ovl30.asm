; ovl30 stub 3002 file_off 0x57ab0 size 0x39

ovl30_0000:  ; ENTRY
  0000  55               push bp                                  
  0001  8bec             mov bp, sp                               
  0003  9a2500f72f       lcall 0x2ff7, 0x25                       -> ovl29:010b
  0008  33d2             xor dx, dx                               
  000a  eb21             jmp 0x2d                                 
  000c  8bda             mov bx, dx                               
  000e  d1e3             shl bx, 1                                
  0010  b8042c           mov ax, 0x2c04                           
  0013  8ec0             mov es, ax                               
  0015  26c787e3100000   mov word ptr es:[bx + 0x10e3], 0         
  001c  8bda             mov bx, dx                               
  001e  d1e3             shl bx, 1                                
  0020  b8042c           mov ax, 0x2c04                           
  0023  8ec0             mov es, ax                               
  0025  26c787f310ffff   mov word ptr es:[bx + 0x10f3], 0xffff    
  002c  42               inc dx                                   
  002d  83fa08           cmp dx, 8                                
  0030  7cda             jl 0xc                                   
  0032  5d               pop bp                                   
  0033  cb               retf                                     

ovl30_0034:  ; ENTRY
  0034  55               push bp                                  
  0035  8bec             mov bp, sp                               
  0037  5d               pop bp                                   
  0038  cb               retf                                     
