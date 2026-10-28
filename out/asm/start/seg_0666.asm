; seg 0666  img 0x6660..0x6820  file off 0x7260
  0666:0000  cb               retf                                     

proc_0666_0001:
  0666:0001  55               push bp                                  
  0666:0002  8bec             mov bp, sp                               
  0666:0004  83ec6e           sub sp, 0x6e                             
  0666:0007  56               push si                                  
  0666:0008  57               push di                                  
  0666:0009  66ff760a         push dword ptr [bp + 0xa]                
  0666:000d  16               push ss                                  
  0666:000e  8d4692           lea ax, [bp - 0x6e]                      
  0666:0011  50               push ax                                  
  0666:0012  9a9c460000       lcall 0, 0x469c                          -> 0000:469c [reloc]
  0666:0017  83c408           add sp, 8                                
  0666:001a  66ff760e         push dword ptr [bp + 0xe]                
  0666:001e  16               push ss                                  
  0666:001f  8d4692           lea ax, [bp - 0x6e]                      
  0666:0022  50               push ax                                  
  0666:0023  9a5d460000       lcall 0, 0x465d                          -> 0000:465d [reloc]
  0666:0028  83c408           add sp, 8                                
  0666:002b  6a02             push 2                                   
  0666:002d  16               push ss                                  
  0666:002e  8d4692           lea ax, [bp - 0x6e]                      
  0666:0031  50               push ax                                  
  0666:0032  9a0e004a06       lcall 0x64a, 0xe                         -> 064a:000e [reloc]
  0666:0037  83c406           add sp, 6                                
  0666:003a  a3a214           mov word ptr [0x14a2], ax                
  0666:003d  3dffff           cmp ax, 0xffff                           
  0666:0040  7505             jne 0x47                                 
  0666:0042  33c0             xor ax, ax                               
  0666:0044  e97f01           jmp 0x1c6                                
  0666:0047  6a06             push 6                                   
  0666:0049  1e               push ds                                  
  0666:004a  689c14           push 0x149c                              
  0666:004d  ff36a214         push word ptr [0x14a2]                   
  0666:0051  9a75004a06       lcall 0x64a, 0x75                        -> 064a:0075 [reloc]
  0666:0056  83c408           add sp, 8                                
  0666:0059  66ff369e14       push dword ptr [0x149e]                  
  0666:005e  66ff7606         push dword ptr [bp + 6]                  
  0666:0062  9a7c023d08       lcall 0x83d, 0x27c                       -> 083d:027c [reloc]
  0666:0067  83c408           add sp, 8                                
  0666:006a  0bc0             or ax, ax                                
  0666:006c  750e             jne 0x7c                                 
  0666:006e  1e               push ds                                  
  0666:006f  687006           push 0x670                               
  0666:0072  9a08400000       lcall 0, 0x4008                          -> 0000:4008 [reloc]
  0666:0077  83c404           add sp, 4                                
  0666:007a  ebc6             jmp 0x42                                 
  0666:007c  6a00             push 0                                   
  0666:007e  66ff7606         push dword ptr [bp + 6]                  
  0666:0082  9a4a083d08       lcall 0x83d, 0x84a                       -> 083d:084a [reloc]
  0666:0087  83c406           add sp, 6                                
  0666:008a  c45e06           les bx, ptr [bp + 6]                     
  0666:008d  6626837f0a00     cmp dword ptr es:[bx + 0xa], 0           
  0666:0093  7443             je 0xd8                                  
  0666:0095  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  0666:009b  753b             jne 0xd8                                 
  0666:009d  33ff             xor di, di                               
  0666:009f  eb2a             jmp 0xcb                                 
  0666:00a1  8bc7             mov ax, di                               
  0666:00a3  c1e002           shl ax, 2                                
  0666:00a6  c45e06           les bx, ptr [bp + 6]                     
  0666:00a9  03d8             add bx, ax                               
  0666:00ab  6626ff770a       push dword ptr es:[bx + 0xa]             
  0666:00b0  9a9406870c       lcall 0xc87, 0x694                       -> 0c87:0694 [reloc]
  0666:00b5  83c404           add sp, 4                                
  0666:00b8  8bdf             mov bx, di                               
  0666:00ba  c1e302           shl bx, 2                                
  0666:00bd  c47606           les si, ptr [bp + 6]                     
  0666:00c0  03f3             add si, bx                               
  0666:00c2  2689541c         mov word ptr es:[si + 0x1c], dx          
  0666:00c6  2689441a         mov word ptr es:[si + 0x1a], ax          
  0666:00ca  47               inc di                                   
  0666:00cb  c45e06           les bx, ptr [bp + 6]                     
  0666:00ce  268a4734         mov al, byte ptr es:[bx + 0x34]          
  0666:00d2  b400             mov ah, 0                                
  0666:00d4  3bc7             cmp ax, di                               
  0666:00d6  7fc9             jg 0xa1                                  
  0666:00d8  666a00           push 0                                   
  0666:00db  6a00             push 0                                   
  0666:00dd  666800080000     push 0x800                               
  0666:00e3  9a1901870c       lcall 0xc87, 0x119                       -> 0c87:0119 [reloc]
  0666:00e8  83c40a           add sp, 0xa                              
  0666:00eb  8956e4           mov word ptr [bp - 0x1c], dx             
  0666:00ee  8946e2           mov word ptr [bp - 0x1e], ax             
  0666:00f1  52               push dx                                  
  0666:00f2  50               push ax                                  
  0666:00f3  9a9406870c       lcall 0xc87, 0x694                       -> 0c87:0694 [reloc]
  0666:00f8  83c404           add sp, 4                                
  0666:00fb  8956fe           mov word ptr [bp - 2], dx                
  0666:00fe  8946fc           mov word ptr [bp - 4], ax                
  0666:0101  8956fa           mov word ptr [bp - 6], dx                
  0666:0104  8946f8           mov word ptr [bp - 8], ax                
  0666:0107  8146f80004       add word ptr [bp - 8], 0x400             
  0666:010c  a19e14           mov ax, word ptr [0x149e]                
  0666:010f  bb0800           mov bx, 8                                
  0666:0112  99               cdq                                      
  0666:0113  f7fb             idiv bx                                  
  0666:0115  f72ea014         imul word ptr [0x14a0]                   
  0666:0119  8946f6           mov word ptr [bp - 0xa], ax              
  0666:011c  c45e06           les bx, ptr [bp + 6]                     
  0666:011f  66268b471a       mov eax, dword ptr es:[bx + 0x1a]        
  0666:0124  668946f2         mov dword ptr [bp - 0xe], eax            
  0666:0128  66268b471e       mov eax, dword ptr es:[bx + 0x1e]        
  0666:012d  668946ee         mov dword ptr [bp - 0x12], eax           
  0666:0131  66268b4722       mov eax, dword ptr es:[bx + 0x22]        
  0666:0136  668946ea         mov dword ptr [bp - 0x16], eax           
  0666:013a  66268b4726       mov eax, dword ptr es:[bx + 0x26]        
  0666:013f  668946e6         mov dword ptr [bp - 0x1a], eax           
  0666:0143  6a00             push 0                                   
  0666:0145  66ff76e6         push dword ptr [bp - 0x1a]               
  0666:0149  66ff76ea         push dword ptr [bp - 0x16]               
  0666:014d  66ff76ee         push dword ptr [bp - 0x12]               
  0666:0151  6a04             push 4                                   
  0666:0153  ff76f6           push word ptr [bp - 0xa]                 
  0666:0156  680004           push 0x400                               
  0666:0159  66ff76f8         push dword ptr [bp - 8]                  
  0666:015d  66ff76fc         push dword ptr [bp - 4]                  
  0666:0161  ff36a214         push word ptr [0x14a2]                   
  0666:0165  66ff76f2         push dword ptr [bp - 0xe]                
  0666:0169  9a51005906       lcall 0x659, 0x51                        -> 0659:0051 [reloc]
  0666:016e  83c422           add sp, 0x22                             
  0666:0171  66ff76e2         push dword ptr [bp - 0x1e]               
  0666:0175  9a8804870c       lcall 0xc87, 0x488                       -> 0c87:0488 [reloc]
  0666:017a  83c404           add sp, 4                                
  0666:017d  ff36a214         push word ptr [0x14a2]                   
  0666:0181  9a42004a06       lcall 0x64a, 0x42                        -> 064a:0042 [reloc]
  0666:0186  59               pop cx                                   
  0666:0187  c45e06           les bx, ptr [bp + 6]                     
  0666:018a  6626837f0a00     cmp dword ptr es:[bx + 0xa], 0           
  0666:0190  7431             je 0x1c3                                 
  0666:0192  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  0666:0198  7529             jne 0x1c3                                
  0666:019a  33f6             xor si, si                               
  0666:019c  eb18             jmp 0x1b6                                
  0666:019e  8bc6             mov ax, si                               
  0666:01a0  c1e002           shl ax, 2                                
  0666:01a3  c45e06           les bx, ptr [bp + 6]                     
  0666:01a6  03d8             add bx, ax                               
  0666:01a8  6626ff770a       push dword ptr es:[bx + 0xa]             
  0666:01ad  9aa307870c       lcall 0xc87, 0x7a3                       -> 0c87:07a3 [reloc]
  0666:01b2  83c404           add sp, 4                                
  0666:01b5  46               inc si                                   
  0666:01b6  c45e06           les bx, ptr [bp + 6]                     
  0666:01b9  268a4734         mov al, byte ptr es:[bx + 0x34]          
  0666:01bd  b400             mov ah, 0                                
  0666:01bf  3b               db 3b
