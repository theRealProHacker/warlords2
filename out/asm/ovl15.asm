; ovl15 stub 2fa6 file_off 0x47860 size 0x21c

ovl15_0000:  ; ENTRY
  0000  55               push bp                                  
  0001  8bec             mov bp, sp                               
  0003  83ec70           sub sp, 0x70                             
  0006  56               push si                                  
  0007  57               push di                                  
  0008  c746fc0000       mov word ptr [bp - 4], 0                 
  000d  833e741100       cmp word ptr [0x1174], 0                 
  0012  7403             je 0x17                                  
  0014  e9c400           jmp 0xdb                                 
  0017  6a02             push 2                                   
  0019  1e               push ds                                  
  001a  68c605           push 0x5c6                                ; "help\warlord2.hlp"
  001d  9a06000b07       lcall 0x70b, 6                           -> 070b:0006
  0022  83c406           add sp, 6                                
  0025  8bf0             mov si, ax                               
  0027  0bf6             or si, si                                
  0029  7d0f             jge 0x3a                                 
  002b  1e               push ds                                  
  002c  68d805           push 0x5d8                                ; "No help file"
  002f  9aac430000       lcall 0, 0x43ac                          -> 0000:43ac
  0034  83c404           add sp, 4                                
  0037  e9a100           jmp 0xdb                                 
  003a  6a02             push 2                                   
  003c  16               push ss                                  
  003d  8d46fe           lea ax, [bp - 2]                         
  0040  50               push ax                                  
  0041  56               push si                                  
  0042  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  0047  83c408           add sp, 8                                
  004a  33ff             xor di, di                               
  004c  6a68             push 0x68                                
  004e  16               push ss                                  
  004f  8d4690           lea ax, [bp - 0x70]                      
  0052  50               push ax                                  
  0053  56               push si                                  
  0054  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  0059  83c408           add sp, 8                                
  005c  8b4690           mov ax, word ptr [bp - 0x70]             
  005f  3b4606           cmp ax, word ptr [bp + 6]                
  0062  7505             jne 0x69                                 
  0064  c746fc0100       mov word ptr [bp - 4], 1                 
  0069  47               inc di                                   
  006a  8b4690           mov ax, word ptr [bp - 0x70]             
  006d  3b4606           cmp ax, word ptr [bp + 6]                
  0070  7405             je 0x77                                  
  0072  3b7efe           cmp di, word ptr [bp - 2]                
  0075  7cd5             jl 0x4c                                  
  0077  56               push si                                  
  0078  9a3a000b07       lcall 0x70b, 0x3a                        -> 070b:003a
  007d  59               pop cx                                   
  007e  837efc00         cmp word ptr [bp - 4], 0                 
  0082  7457             je 0xdb                                  
  0084  837e9200         cmp word ptr [bp - 0x6e], 0              
  0088  7535             jne 0xbf                                 
  008a  16               push ss                                  
  008b  8d46f8           lea ax, [bp - 8]                         
  008e  50               push ax                                  
  008f  9af40abf12       lcall 0x12bf, 0xaf4                      -> 12bf:0af4
  0094  83c404           add sp, 4                                
  0097  6a00             push 0                                   
  0099  66ff76f8         push dword ptr [bp - 8]                  
  009d  9a2a006c30       lcall 0x306c, 0x2a                       -> ovl46:1201
  00a2  83c406           add sp, 6                                
  00a5  16               push ss                                  
  00a6  8d46c6           lea ax, [bp - 0x3a]                      
  00a9  50               push ax                                  
  00aa  16               push ss                                  
  00ab  8d4694           lea ax, [bp - 0x6c]                      
  00ae  50               push ax                                  
  00af  9a39006c30       lcall 0x306c, 0x39                       -> ovl46:1158
  00b4  83c408           add sp, 8                                
  00b7  c70674110100     mov word ptr [0x1174], 1                 
  00bd  eb1c             jmp 0xdb                                 
  00bf  16               push ss                                  
  00c0  8d46f8           lea ax, [bp - 8]                         
  00c3  50               push ax                                  
  00c4  9af40abf12       lcall 0x12bf, 0xaf4                      -> 12bf:0af4
  00c9  83c404           add sp, 4                                
  00cc  66ff76f8         push dword ptr [bp - 8]                  
  00d0  ff7692           push word ptr [bp - 0x6e]                
  00d3  90               nop                                      
  00d4  0e               push cs                                  
  00d5  e80700           call 0xdf                                
  00d8  83c406           add sp, 6                                
  00db  5f               pop di                                   
  00dc  5e               pop si                                   
  00dd  c9               leave                                    
  00de  cb               retf                                     

ovl15_00df:  ; ENTRY
  00df  55               push bp                                  
  00e0  8bec             mov bp, sp                               
  00e2  56               push si                                  
  00e3  57               push di                                  
  00e4  8b5606           mov dx, word ptr [bp + 6]                
  00e7  8b7608           mov si, word ptr [bp + 8]                
  00ea  8b7e0a           mov di, word ptr [bp + 0xa]              
  00ed  83fa01           cmp dx, 1                                
  00f0  7d03             jge 0xf5                                 
  00f2  e99d00           jmp 0x192                                
  00f5  83fa04           cmp dx, 4                                
  00f8  7e03             jle 0xfd                                 
  00fa  e99500           jmp 0x192                                
  00fd  8b1e980e         mov bx, word ptr [0xe98]                 
  0101  6bdb41           imul bx, bx, 0x41                        
  0104  03da             add bx, dx                               
  0106  b8042c           mov ax, 0x2c04                           
  0109  8ec0             mov es, ax                               
  010b  2680bf921500     cmp byte ptr es:[bx + 0x1592], 0         
  0111  7d03             jge 0x116                                
  0113  e90201           jmp 0x218                                
  0116  57               push di                                  
  0117  56               push si                                  
  0118  8b1e980e         mov bx, word ptr [0xe98]                 
  011c  6bdb41           imul bx, bx, 0x41                        
  011f  03da             add bx, dx                               
  0121  b8042c           mov ax, 0x2c04                           
  0124  8ec0             mov es, ax                               
  0126  268a879e15       mov al, byte ptr es:[bx + 0x159e]        
  012b  98               cwde                                     
  012c  50               push ax                                  
  012d  8b1e980e         mov bx, word ptr [0xe98]                 
  0131  6bdb41           imul bx, bx, 0x41                        
  0134  03da             add bx, dx                               
  0136  b8042c           mov ax, 0x2c04                           
  0139  8ec0             mov es, ax                               
  013b  268a87a215       mov al, byte ptr es:[bx + 0x15a2]        
  0140  98               cwde                                     
  0141  50               push ax                                  
  0142  8b1e980e         mov bx, word ptr [0xe98]                 
  0146  6bdb41           imul bx, bx, 0x41                        
  0149  03da             add bx, dx                               
  014b  b8042c           mov ax, 0x2c04                           
  014e  8ec0             mov es, ax                               
  0150  268a879a15       mov al, byte ptr es:[bx + 0x159a]        
  0155  98               cwde                                     
  0156  50               push ax                                  
  0157  8b1e980e         mov bx, word ptr [0xe98]                 
  015b  6bdb41           imul bx, bx, 0x41                        
  015e  03da             add bx, dx                               
  0160  b8042c           mov ax, 0x2c04                           
  0163  8ec0             mov es, ax                               
  0165  268a879615       mov al, byte ptr es:[bx + 0x1596]        
  016a  98               cwde                                     
  016b  50               push ax                                  
  016c  8b1e980e         mov bx, word ptr [0xe98]                 
  0170  6bdb41           imul bx, bx, 0x41                        
  0173  03da             add bx, dx                               
  0175  b8042c           mov ax, 0x2c04                           
  0178  8ec0             mov es, ax                               
  017a  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  017f  98               cwde                                     
  0180  50               push ax                                  
  0181  9a3e006c30       lcall 0x306c, 0x3e                       -> ovl46:032a
  0186  83c40e           add sp, 0xe                              
  0189  c70674110100     mov word ptr [0x1174], 1                 
  018f  e98600           jmp 0x218                                
  0192  83fa05           cmp dx, 5                                
  0195  7c17             jl 0x1ae                                 
  0197  83fa18           cmp dx, 0x18                             
  019a  7f12             jg 0x1ae                                 
  019c  8bc2             mov ax, dx                               
  019e  05fbff           add ax, 0xfffb                           
  01a1  50               push ax                                  
  01a2  6a01             push 1                                   
  01a4  9a7f005830       lcall 0x3058, 0x7f                       -> ovl44:11f4
  01a9  83c404           add sp, 4                                
  01ac  ebdb             jmp 0x189                                
  01ae  83fa21           cmp dx, 0x21                             
  01b1  7c2f             jl 0x1e2                                 
  01b3  83fa24           cmp dx, 0x24                             
  01b6  7f2a             jg 0x1e2                                 
  01b8  8bc2             mov ax, dx                               
  01ba  05dfff           add ax, 0xffdf                           
  01bd  50               push ax                                  
  01be  9a4d009f2f       lcall 0x2f9f, 0x4d                       -> ovl14:03f8
  01c3  59               pop cx                                   
  01c4  6a00             push 0                                   
  01c6  57               push di                                  
  01c7  56               push si                                  
  01c8  9a2a006c30       lcall 0x306c, 0x2a                       -> ovl46:1201
  01cd  83c406           add sp, 6                                
  01d0  1e               push ds                                  
  01d1  68385c           push 0x5c38                              
  01d4  1e               push ds                                  
  01d5  68e605           push 0x5e6                                ; "- User-Defined Button -"
  01d8  9a39006c30       lcall 0x306c, 0x39                       -> ovl46:1158
  01dd  83c408           add sp, 8                                
  01e0  eba7             jmp 0x189                                
  01e2  83fa25           cmp dx, 0x25                             
  01e5  7c14             jl 0x1fb                                 
  01e7  83fa2c           cmp dx, 0x2c                             
  01ea  7f0f             jg 0x1fb                                 
  01ec  57               push di                                  
  01ed  56               push si                                  
  01ee  8bc2             mov ax, dx                               
  01f0  05dbff           add ax, 0xffdb                           
  01f3  50               push ax                                  
  01f4  9a7a000c31       lcall 0x310c, 0x7a                       -> ovl66:1747
  01f9  eb17             jmp 0x212                                
  01fb  83fa2d           cmp dx, 0x2d                             
  01fe  7c18             jl 0x218                                 
  0200  83fa47           cmp dx, 0x47                             
  0203  7f13             jg 0x218                                 
  0205  57               push di                                  
  0206  56               push si                                  
  0207  8bc2             mov ax, dx                               
  0209  05d3ff           add ax, 0xffd3                           
  020c  50               push ax                                  
  020d  9a52003030       lcall 0x3030, 0x52                       -> ovl38:1475
  0212  83c406           add sp, 6                                
  0215  e971ff           jmp 0x189                                
  0218  5f               pop di                                   
  0219  5e               pop si                                   
  021a  5d               pop bp                                   
  021b  cb               retf                                     
