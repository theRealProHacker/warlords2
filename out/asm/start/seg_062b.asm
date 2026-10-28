; seg 062b  img 0x62b0..0x64a0  file off 0x6eb0
  062b:0000  3f               aas                                      
  062b:0001  7c75             jl 0x78                                  
  062b:0003  dcc4             fadd st(4), st(0)                        
  062b:0005  5e               pop si                                   
  062b:0006  0a03             or al, byte ptr [bp + di]                
  062b:0008  da26c607         fisub dword ptr [0x7c6]                  
  062b:000c  005dcb           add byte ptr [di - 0x35], bl             
  062b:000f  c8040000         enter 4, 0                               
  062b:0013  56               push si                                  
  062b:0014  57               push di                                  
  062b:0015  8b7e06           mov di, word ptr [bp + 6]                
  062b:0018  c706a80b2b06     mov word ptr [0xba8], 0x62b               [reloc]
  062b:001e  c706a60b8e01     mov word ptr [0xba6], 0x18e              
  062b:0024  9a0000bd06       lcall 0x6bd, 0                           -> 06bd:0000 [reloc]
  062b:0029  3dffff           cmp ax, 0xffff                           
  062b:002c  7514             jne 0x42                                 
  062b:002e  1e               push ds                                  
  062b:002f  689605           push 0x596                                ; "Sorry, not enough memory to load game."
  062b:0032  9a08400000       lcall 0, 0x4008                          -> 0000:4008 [reloc]
  062b:0037  83c404           add sp, 4                                
  062b:003a  6a01             push 1                                   
  062b:003c  9a301c0000       lcall 0, 0x1c30                          -> 0000:1c30 [reloc]
  062b:0041  59               pop cx                                   
  062b:0042  c706a2060100     mov word ptr [0x6a2], 1                  
  062b:0048  c706aa060000     mov word ptr [0x6aa], 0                  
  062b:004e  83ff01           cmp di, 1                                
  062b:0051  7e48             jle 0x9b                                 
  062b:0053  be0100           mov si, 1                                
  062b:0056  eb3f             jmp 0x97                                 
  062b:0058  8bc6             mov ax, si                               
  062b:005a  c1e002           shl ax, 2                                
  062b:005d  c45e08           les bx, ptr [bp + 8]                     
  062b:0060  03d8             add bx, ax                               
  062b:0062  268b4702         mov ax, word ptr es:[bx + 2]             
  062b:0066  268b17           mov dx, word ptr es:[bx]                 
  062b:0069  8946fe           mov word ptr [bp - 2], ax                
  062b:006c  8956fc           mov word ptr [bp - 4], dx                
  062b:006f  eb03             jmp 0x74                                 
  062b:0071  ff46fc           inc word ptr [bp - 4]                    
  062b:0074  c45efc           les bx, ptr [bp - 4]                     
  062b:0077  26803f2d         cmp byte ptr es:[bx], 0x2d               
  062b:007b  74f4             je 0x71                                  
  062b:007d  26803f2f         cmp byte ptr es:[bx], 0x2f               
  062b:0081  74ee             je 0x71                                  
  062b:0083  268a07           mov al, byte ptr es:[bx]                 
  062b:0086  98               cwde                                     
  062b:0087  50               push ax                                  
  062b:0088  9a02260000       lcall 0, 0x2602                          -> 0000:2602 [reloc]
  062b:008d  59               pop cx                                   
  062b:008e  6a01             push 1                                   
  062b:0090  9a301c0000       lcall 0, 0x1c30                          -> 0000:1c30 [reloc]
  062b:0095  59               pop cx                                   
  062b:0096  46               inc si                                   
  062b:0097  3bf7             cmp si, di                               
  062b:0099  7cbd             jl 0x58                                  
  062b:009b  c606981404       mov byte ptr [0x1498], 4                 
  062b:00a0  a09814           mov al, byte ptr [0x1498]                
  062b:00a3  b400             mov ah, 0                                
  062b:00a5  50               push ax                                  
  062b:00a6  9a8c00bd06       lcall 0x6bd, 0x8c                        -> 06bd:008c [reloc]
  062b:00ab  59               pop cx                                   
  062b:00ac  50               push ax                                  
  062b:00ad  9a43003d08       lcall 0x83d, 0x43                        -> 083d:0043 [reloc]
  062b:00b2  59               pop cx                                   
  062b:00b3  9a0500c30b       lcall 0xbc3, 5                           -> 0bc3:0005 [reloc]
  062b:00b8  9a0400070c       lcall 0xc07, 4                           -> 0c07:0004 [reloc]
  062b:00bd  98               cwde                                     
  062b:00be  0bc0             or ax, ax                                
  062b:00c0  7519             jne 0xdb                                 
  062b:00c2  1e               push ds                                  
  062b:00c3  68be05           push 0x5be                                ; "Can't init sound"
  062b:00c6  9a08400000       lcall 0, 0x4008                          -> 0000:4008 [reloc]
  062b:00cb  83c404           add sp, 4                                
  062b:00ce  9af5340000       lcall 0, 0x34f5                          -> 0000:34f5 [reloc]
  062b:00d3  6a05             push 5                                   
  062b:00d5  90               nop                                      
  062b:00d6  0e               push cs                                  
  062b:00d7  e83900           call 0x113                               -> 062b:0113
  062b:00da  59               pop cx                                   
  062b:00db  c606991401       mov byte ptr [0x1499], 1                 
  062b:00e0  9a4b00a906       lcall 0x6a9, 0x4b                        -> 06a9:004b [reloc]
  062b:00e5  9a9300a906       lcall 0x6a9, 0x93                        -> 06a9:0093 [reloc]
  062b:00ea  9af800a906       lcall 0x6a9, 0xf8                        -> 06a9:00f8 [reloc]
  062b:00ef  c7069a140600     mov word ptr [0x149a], 6                 
  062b:00f5  9a09008a04       lcall 0x48a, 9                           -> 048a:0009 [reloc]
  062b:00fa  9a00007905       lcall 0x579, 0                           -> 0579:0000 [reloc]
  062b:00ff  6a02             push 2                                   
  062b:0101  9a03005105       lcall 0x551, 3                           -> 0551:0003 [reloc]
  062b:0106  59               pop cx                                   
  062b:0107  6a00             push 0                                   
  062b:0109  90               nop                                      
  062b:010a  0e               push cs                                  
  062b:010b  e80500           call 0x113                               -> 062b:0113
  062b:010e  59               pop cx                                   
  062b:010f  5f               pop di                                   
  062b:0110  5e               pop si                                   
  062b:0111  c9               leave                                    
  062b:0112  cb               retf                                     

proc_062b_0113:
  062b:0113  55               push bp                                  
  062b:0114  8bec             mov bp, sp                               
  062b:0116  56               push si                                  
  062b:0117  8b7606           mov si, word ptr [bp + 6]                
  062b:011a  9a9f02070c       lcall 0xc07, 0x29f                       -> 0c07:029f [reloc]
  062b:011f  9a7000a906       lcall 0x6a9, 0x70                        -> 06a9:0070 [reloc]
  062b:0124  9ac600a906       lcall 0x6a9, 0xc6                        -> 06a9:00c6 [reloc]
  062b:0129  9a1e01a906       lcall 0x6a9, 0x11e                       -> 06a9:011e [reloc]
  062b:012e  9a2d0aa30a       lcall 0xaa3, 0xa2d                       -> 0aa3:0a2d [reloc]
  062b:0133  9a8800c30b       lcall 0xbc3, 0x88                        -> 0bc3:0088 [reloc]
  062b:0138  0bf6             or si, si                                
  062b:013a  7408             je 0x144                                 
  062b:013c  6a03             push 3                                   
  062b:013e  9a0c00fc0b       lcall 0xbfc, 0xc                         -> 0bfc:000c [reloc]
  062b:0143  59               pop cx                                   
  062b:0144  56               push si                                  
  062b:0145  9a301c0000       lcall 0, 0x1c30                          -> 0000:1c30 [reloc]
  062b:014a  59               pop cx                                   
  062b:014b  5e               pop si                                   
  062b:014c  5d               pop bp                                   
  062b:014d  cb               retf                                     
  062b:014e  c80c0000         enter 0xc, 0                             
  062b:0152  9abf02870c       lcall 0xc87, 0x2bf                       -> 0c87:02bf [reloc]
  062b:0157  16               push ss                                  
  062b:0158  8d46f4           lea ax, [bp - 0xc]                       
  062b:015b  50               push ax                                  
  062b:015c  16               push ss                                  
  062b:015d  8d46f8           lea ax, [bp - 8]                         
  062b:0160  50               push ax                                  
  062b:0161  16               push ss                                  
  062b:0162  8d46fc           lea ax, [bp - 4]                         
  062b:0165  50               push ax                                  
  062b:0166  9aff07870c       lcall 0xc87, 0x7ff                       -> 0c87:07ff [reloc]
  062b:016b  83c40c           add sp, 0xc                              
  062b:016e  ff76f6           push word ptr [bp - 0xa]                 
  062b:0171  ff76f4           push word ptr [bp - 0xc]                 
  062b:0174  ff76fa           push word ptr [bp - 6]                   
  062b:0177  ff76f8           push word ptr [bp - 8]                   
  062b:017a  ff76fe           push word ptr [bp - 2]                   
  062b:017d  ff76fc           push word ptr [bp - 4]                   
  062b:0180  1e               push ds                                  
  062b:0181  68d005           push 0x5d0                                ; "Conv:%lu  MaxBlock:%lu  Lock:%lu"
  062b:0184  9a08400000       lcall 0, 0x4008                          -> 0000:4008 [reloc]
  062b:0189  83c410           add sp, 0x10                             
  062b:018c  c9               leave                                    
  062b:018d  cb               retf                                     

proc_062b_018e:
  062b:018e  55               push bp                                  
  062b:018f  8bec             mov bp, sp                               
  062b:0191  ff7608           push word ptr [bp + 8]                   
  062b:0194  ff7606           push word ptr [bp + 6]                   
  062b:0197  1e               push ds                                  
  062b:0198  68f205           push 0x5f2                                ; "Out of memory at %lu"
  062b:019b  9a08400000       lcall 0, 0x4008                          -> 0000:4008 [reloc]
  062b:01a0  83c408           add sp, 8                                
  062b:01a3  0e               push cs                                  
  062b:01a4  e8a7ff           call 0x14e                               -> 062b:014e
  062b:01a7  8b1ea20b         mov bx, word ptr [0xba2]                 
  062b:01ab  4b               dec bx                                   
  062b:01ac  83fb05           cmp bx, 5                                
  062b:01af  7731             ja 0x1e2                                 
  062b:01b1  d1e3             shl bx, 1                                
  062b:01b3  2effa7f001       jmp word ptr cs:[bx + 0x1f0]             
  062b:01b8  1e               push ds                                  
  062b:01b9  680806           push 0x608                                ; "Out of mem handles"
  062b:01bc  eb1c             jmp 0x1da                                
  062b:01be  1e               push ds                                  
  062b:01bf  681b06           push 0x61b                                ; "Out of memory"
  062b:01c2  eb16             jmp 0x1da                                
  062b:01c4  1e               push ds                                  
  062b:01c5  682906           push 0x629                                ; "Too much memory locked"
  062b:01c8  eb10             jmp 0x1da                                
  062b:01ca  1e               push ds                                  
  062b:01cb  684006           push 0x640                                ; "Bad handle"
  062b:01ce  eb0a             jmp 0x1da                                
  062b:01d0  1e               push ds                                  
  062b:01d1  684b06           push 0x64b                                ; "Invalid handle"
  062b:01d4  eb04             jmp 0x1da                                
  062b:01d6  1e               push ds                                  
  062b:01d7  685a06           push 0x65a                                ; "Block/handle mismatch"
  062b:01da  9a08400000       lcall 0, 0x4008                          -> 0000:4008 [reloc]
  062b:01df  83c404           add sp, 4                                
  062b:01e2  9af5340000       lcall 0, 0x34f5                          -> 0000:34f5 [reloc]
  062b:01e7  6a01             push 1                                   
  062b:01e9  0e               push cs                                  
  062b:01ea  e826ff           call 0x113                               -> 062b:0113
  062b:01ed  59               pop cx                                   
  062b:01ee  5d               pop bp                                   
  062b:01ef  cb               retf                                     
